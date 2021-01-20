library('dplyr')
library('tidyr')
library('ggplot2')
library('stringr')

#load the data
data <- readxl::read_excel('./data/2021_01_17.xlsx') %>% 
    mutate(paper_title = str_to_lower(paper_title))

#tally the publication years and make a bar plot
data %>% count(publication_year) %>% 
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

#Find year with highest number of publications
data %>% 
    count(publication_year) %>% 
    filter(n == max(n))
