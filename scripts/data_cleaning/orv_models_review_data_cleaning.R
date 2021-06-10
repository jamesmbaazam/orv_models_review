library('sjmisc')
library('tidyverse')
library('ggthemes')
library('scales')
library('janitor')
library('forcats')
library('stringr')



#load the data and remove extraneous variables 
review_data_wide <- readxl::read_excel('./data/final_data/raw_data/2021-06-10_wide.xlsx', 
                                       na = c('', 'NA')
                                       )
review_data_compact <- readxl::read_excel('./data/final_data/raw_data/2021-06-10_compact.xlsx', 
                                          na = c('', 'NA')
                                          )


############################################
#Data cleaning
############################################

# review_data_wide %>% pivot_longer(everything(),
#                                   names_to = c('country_studied', '.value'),
#                                   names_sep = '_'
#                                   )




#Step 1
#' Remove extraneous variables and clean the column names
#' the compact data is the same as above except that there are multiple entries per cell;
#' because that is how KoboToolbox saves multiple answer questions
review_data_compact_cleaning_step1 <- review_data_compact %>% 
    filter(publication_year < 2020) %>% #remove 2020 because the search was done in Jan 2020 so it gives the illusion that there were few papers in 2020.
    select(-'_index') %>% 
    clean_names() %>% 
    remove_empty('cols')

#' Step 2
#' Rename/shorten some of the entries and move the entries in "other" and "multiple" columns to the "main" column
review_data_compact_cleaning_step2 <- review_data_compact_cleaning_step1 %>% 
    mutate(disease = str_to_lower(disease), 
           objectives = case_when(objectives == 'assess_impact_future' ~ 'future', 
                                  objectives == 'assess_impact_past' ~ 'past', 
                                  objectives == 'assess_impact_past assess_impact_future' ~ 'both'
                                  ),
           author_in_country_studied = as_factor(if_else(is.na(author_in_country_studied), 
                                                         'not_applicable', 
                                                         author_in_country_studied
                                                         )
                                                 ),
           country_studied = as_factor(case_when(country_studied == 'none' ~ 'none',
                                       country_studied == 'multiple' ~ country_studied_multiple,
                                       country_studied == 'other' ~ str_to_lower(str_replace_all(country_studied_other, ' ', '_')),
                                       country_studied != 'none' & country_studied != 'multiple' & country_studied != 'other' ~ country_studied
                                     )),
           is_vax_effective = as_factor(if_else(is.na(is_vax_effective),
                                                'not_applicable', 
                                                is_vax_effective)
               
           ),
           data_available = as_factor(if_else(is.na(data_available), 
                                              'not_applicable', 
                                              data_available
                                              )
                                      ),
           intervention_modelled = str_replace_all(intervention_modelled, 
                           ' ', 
                           ','
                           ),
           outcome_measured = str_replace_all(outcome_measured, 
                           ' ', 
                           ','
                           )
           )

#View(review_data_compact_cleaning_step2)


#' Step 3
#' Combine the intervention and outcome columns, replace the commas with space, and remove the "other" variables
review_data_compact_cleaning_step3 <- review_data_compact_cleaning_step2 %>% 
   mutate(intervention_modelled = case_when(
       is.na(intervention_modelled_other) ~ intervention_modelled,
       !is.na(intervention_modelled_other) ~ str_to_lower(paste(intervention_modelled, intervention_modelled_other, sep = ','))
       ),
       outcome_measured = case_when(
           is.na(outcome_measured_other) ~ outcome_measured,
           !is.na(outcome_measured_other) ~ str_to_lower(paste(outcome_measured, outcome_measured_other, sep = ','))
       )
       ) 

#View(review_data_compact_cleaning_step3)



#View(review_data_compact_cleaning_step3)

#' Step 3A
#Removed the "other" and "multiple" columns
review_data_compact_cleaned <- review_data_compact_cleaning_step3 %>% 
    select(-contains('othe'), #for some reason, one column has "othe" instead of "other"
           -country_studied_multiple
    ) 
#View(review_data_compact_cleaned)

#save the cleaned data
saveRDS(review_data_compact_cleaned, file = './data/final_data/cleaned_data/review_data_compact_cleaned.rds')



#' Step 4
#Separate columns with multiple entries into single rows
review_data_wide_to_long <- review_data_compact_cleaned %>% 
    separate_rows(author_affiliation_type, sep = ' ') %>% 
    separate_rows(disease, sep = ' ') %>% 
    separate_rows(model_structure, sep = ' ') %>% 
    separate_rows(parametrization, sep = ' ') %>% 
    separate_rows(validation, sep = ' ') %>% 
    separate_rows(country_studied, sep = ' ') %>% 
    separate_rows(intervention_modelled, sep = ',') %>% 
    separate_rows(outcome_measured, sep = ',')

review_data_long_cleaned_with_fmd <- review_data_wide_to_long %>% 
    filter(outcome_measured != 'outcome_other') %>% 
    filter(intervention_modelled != 'intervention_other')


review_data_long_cleaned_no_fmd <- review_data_wide_to_long %>% 
    filter(disease != 'fmd') %>% 
    filter(outcome_measured != 'outcome_other') %>% 
    filter(intervention_modelled != 'intervention_other')


#View(review_data_compact_cleaning_step4)

#save the cleaned data
saveRDS(review_data_long_cleaned_with_fmd, file = './data/final_data/cleaned_data/review_data_long_cleaned_with_fmd.rds')
saveRDS(review_data_long_cleaned_no_fmd, file = './data/final_data/cleaned_data/review_data_long_cleaned_no_fmd.rds')




#' Select the necessary variables for the various major analyses and save them
#' 
#' 1. Policy-making related questions
pm_data <- review_data_compact_cleaned %>%
    select(
        paper_title,
        publication_year,
        objectives,
        author_affiliation_type,
        disease,
        country_studied,
        author_in_country_studied,
        outbreak_type,
        modelling_timing,
        data_used,
        data_available
    )  


#' Make the policy-making data longer by splitting the multiple entry columns into
#' individual rows 


policy_making_data <- pm_data %>% 
    separate_rows(author_affiliation_type, sep = ' ') %>% 
    separate_rows(disease, sep = ' ') %>% 
    separate_rows(country_studied, sep = ' ') 


#save the cleaned data
saveRDS(policy_making_data, file = './data/final_data/cleaned_data/policy_making_data.rds')



#' 2. Vaccine-impact related questions
#' 
#' 
#' Select the variables related to vaccination 
vax_impact_data <- review_data_compact_cleaned %>% 
    select(paper_title, 
           publication_year,
           disease,
           outbreak_type,
           intervention_modelled,
           vax_modelled_with_non_vax,
           is_vax_effective,
           outcome_measured
    ) 

#the long data
vax_impact_data_final <- vax_impact_data %>% 
    separate_rows(disease, sep = ' ') %>% 
    separate_rows(intervention_modelled, sep = ',') %>% 
    separate_rows(outcome_measured, sep = ',') 
    
#save the cleaned data
saveRDS(vax_impact_data_final, file = './data/final_data/cleaned_data/vax_impact_data.rds')



# rm(review_data_compact, 
#    review_data_compact_cleaning_step1, 
#    review_data_compact_cleaning_step2,
#    review_data_compact_cleaning_step3,
#    review_data_compact_cleaning_step4,
#    pm_data,
#    vax_impact_data_final
#    )






#' Remove extraneous variables and clean the column names
#' The wide data has one column per answer from multiple select questions, 
#' hence, it spans many columns; Weird KoboToolbox behaviour
#' 
# review_data_wide_cleaned <- review_data_wide %>% 
#     filter(publication_year < 2020) %>% #remove 2020 because the search was done in Jan 2020 so it gives the illusion that there were few papers in 2020.
#     select(-c('start':'phonenumber'),
#            -c('__version__':'_notes')
#     ) %>% 
#     clean_names() %>% 
#     remove_empty('cols')
# 
# 
# #save the cleaned data
# saveRDS(review_data_wide_cleaned, file = './data/final_data/cleaned_data/review_data_wide_cleaned.rds')