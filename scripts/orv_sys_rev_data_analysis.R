library('tidyverse')
library('ggthemes')
library('scales')
library('janitor')

#load the data and remove the Kobotoolbox meaningless variables 
data_raw <- readxl::read_excel('./data/2021_02_18.xlsx') 


############################################
#Data cleaning
############################################


data_cleaned <- data_raw %>% 
    select(-c('start':'phonenumber'),
           -c('__version__':'_notes')
           # -author_affiliation_type,
           # -country_studied,
           # -disease,
           # -objectives,
           # -model_structure,
           # -parametrization,
           # -validation,
           # -intervention_modelled,
           # -outcome_measured
           ) %>% 
    clean_names() %>% 
    remove_empty('cols')



#' Primary objectives 
#' 
#' 
#' 1. Is modelling being used to inform policy?

# 1A. Get relevant variables
data_policy_making <- data_cleaned %>%
  select(
    paper_title,
    publication_year,
    starts_with("author_affiliation_type_"),
    author_in_country_studied,
    outbreak_type,
    starts_with("objectives_"),
    modelling_timing,
    data_used
  )

# 1B. Clean the variable names
data_policy_making_clean <- data_policy_making %>%
  arrange(publication_year) %>%
  rename_at(
    vars(starts_with("author_affiliation_type_")),
    funs(str_replace(
      .,
      "author_affiliation_type_",
      ""
    ))
  ) %>%
  rename_at(
    vars(starts_with("objectives_")),
    funs(str_replace(
      .,
      "objectives_",
      ""
    ))
  ) %>%
  arrange(publication_year) %>%
  mutate(
    objective = case_when(
      assess_impact_past == T & assess_impact_future == F & assess_impact_other == F ~ "assess_impact_past",
      assess_impact_past == F & assess_impact_future == T & assess_impact_other == F ~ "assess_impact_future",
      assess_impact_past == F & assess_impact_future == F & assess_impact_other == T ~ "assess_impact_other"
    ),
    affiliation_type = case_when(
      academic_institutions == T & government_institutions == F & ngo == F ~ "A",
      academic_institutions == F & government_institutions == T & ngo == F ~ "G",
      academic_institutions == F & government_institutions == F & ngo == T ~ "N",
      academic_institutions == T & government_institutions == T & ngo == F ~ "A+G",
      academic_institutions == T & government_institutions == F & ngo == T ~ "A+N",
      academic_institutions == F & government_institutions == T & ngo == T ~ "G+N",
      academic_institutions == T & government_institutions == T & ngo == T ~ "A+G+N"
    ),
    author_in_country_studied = if_else(author_in_country_studied == 'NA', 'not_applicable',
                                        author_in_country_studied
                                        )
  )

#' Count by affiliation type and plot
data_policy_making_affiliation_type_aggregated <- data_policy_making_clean %>% 
    mutate(affiliation_type = as_factor(affiliation_type)) %>% 
    count(affiliation_type) %>% 
    mutate(perc = round(n/sum(n)*100, 1)) 
 
    
    
author_affilition_type_aggregated_plot <- data_policy_making_affiliation_type_aggregated %>%
    ggplot() + geom_bar(aes(x = reorder(affiliation_type, perc),
                            y = perc,
                            fill = factor(affiliation_type)
                            ),
                        stat = 'identity',
                        color = 'black'
                        ) +
    scale_y_continuous(breaks = seq(0, 60, 5),
                       labels = seq(0, 60, 5)) +
    labs(x = 'Author affiliation type', y = 'Percent') + 
    scale_color_tableau()

plot(author_affilition_type_aggregated_plot)

#' Save the plot    
ggsave(filename = './figs/author_affilition_type_aggregated_plot.jpg', 
       plot = author_affilition_type_aggregated_plot,
       width = 10.5,
       height = 6.5,
       units = 'in'
)

#Author affiliations composition over time
data_policy_making_trend <- data_policy_making %>%
    arrange(publication_year) %>%
    rename_at(
        vars(starts_with("author_affiliation_type_")),
        funs(str_replace(
            .,
            "author_affiliation_type_",
            ""
        ))
    ) %>%
    rename_at(
        vars(starts_with("objectives_")),
        funs(str_replace(
            .,
            "objectives_",
            ""
        ))
    ) %>%
    arrange(publication_year) 


#' Count the number of each affiliation type per year
data_policy_making_affiliation_type_by_year <- data_policy_making_clean %>% 
    arrange(publication_year) %>% 
    group_by(publication_year, affiliation_type) %>% 
    count(publication_year, affiliation_type)

#Plot the affiliation type over time
author_affiliation_type_by_year_plot <- ggplot(data = data_policy_making_affiliation_type_by_year) + 
    geom_bar(aes(x = factor(publication_year), 
                 y = n, 
                 fill = affiliation_type
                 ),
             color = 'black',
             stat = 'identity',
             position = 'stack'
             ) + 
    labs(title = 'Author affiliation composition over time',
         x = 'Year',
         y = 'Number of publications') +
    scale_color_tableau()

plot(author_affiliation_type_by_year_plot)

#' save the plot
ggsave(filename = './figs/author_affiliation_type_by_year_plot.jpg', 
       plot = author_affiliation_type_by_year_plot,
       width = 10.5,
       height = 6.5,
       units = 'in'
       )

#' 2. Is vaccination the most effective when compared to other single interventions?

data_disease_intervention_vax_vars <- data_cleaned %>% 
    select(paper_title, 
           publication_year,
           starts_with('disease_'),
           outbreak_type,
           starts_with('intervention_modelled_'),
           vax_modelled_with_non_vax,
           is_vax_effective
           ) 

#' Clean the data by renaming some columns
data_disease_intervention_vax_vars_clean <- data_disease_intervention_vax_vars %>%
    arrange(publication_year) %>%
    rename_at(
        vars(starts_with("disease_")),
        funs(str_replace(
            .,
            "disease_",
            ""
        ))
    ) %>%
    rename_at(
        vars(starts_with("intervention_modelled_")),
        funs(str_replace(
            .,
            "intervention_modelled_",
            ""
        ))
    )



#' Secondary objectives

#' 1. Number of ORV publications by year
data_cleaned %>% count(publication_year) %>% 
    ggplot() + 
    geom_bar(aes(x = publication_year, y = n), 
             stat = 'identity',
             color = 'black',
             fill = 'tomato3'
    ) +
    scale_x_continuous(breaks = seq(1970, 2020, 5),
                       labels = seq(1970, 2020, 5)
    ) +
    scale_y_continuous(breaks = seq(0, 26, 2),
                       labels = seq(0, 26, 2)
    )


#' Year with highest number of ORV publications
max_pub_by_year <- data_cleaned %>% 
    count(publication_year) %>% 
    filter(n == max(n)) 

max_pub_by_year


#' Disease and intervention(s) modelled
data_disease_and_intervention <- data_cleaned %>% 
    select(publication_year,
           starts_with('disease_'),
           starts_with('intervention_modelled_'),
           vax_modelled_with_non_vax,
           is_vax_effective
           ) 

#' Clean up the variable names
data_disease_and_intervention_cleaned <- data_disease_and_intervention %>% 
    rename_at(vars(starts_with('intervention_modelled_')), 
              funs(str_replace(., 
                               'intervention_modelled_', 
                               '')
                   )
              ) %>% 
    rename_at(vars(starts_with('disease_')), 
              funs(str_replace(., 
                               'disease_', 
                               '')
              )
    )



#'Data and analysis code availability





