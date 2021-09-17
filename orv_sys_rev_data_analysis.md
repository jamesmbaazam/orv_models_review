---
title: "Primary analysis for Outbreak response models of vaccine-preventable diseases in humans (1970-2019)"
author: "James Azam"
date: 'September 17, 2021'
output:
  word_document:
    keep_md: yes
    reference_docx: word-style.docx
    toc: yes
---









We did not include foot and mouth disease (FMD) in all the primary analyses. All analyses pertaining to FMD can be found in the supplementary files.  

# Publications per year

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-3-1.jpeg)<!-- -->

# Primary objectives of review

## Collaboration patterns in time

### Number of studies per combinations of collaboration types


|author_affiliation_type                               |   n|
|:-----------------------------------------------------|---:|
|academic_institutions                                 | 131|
|academic_institutions + government_institutions       |  55|
|academic_institutions + NGO                           |  17|
|academic_institutions + government_institutions + NGO |  14|
|government_institutions                               |   5|
|NGO                                                   |   5|
|government_institutions + NGO                         |   2|

### Proportions of the total publications per year by collaboration type

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-5-1.jpeg)<!-- -->


### Absolute number of publications per year by collaboration type
![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-6-1.jpeg)<!-- -->

Even though non-academic collaborations increased over time, the share of total publications per year over time decreased.


## Collaboration patterns in geographic space

### Countries studied


Table: Number/percentage of studies per country

|Country     | Number of studies| Percentage|
|:-----------|-----------------:|----------:|
|other       |                91|       36.4|
|none        |                53|       21.3|
|US          |                38|       15.3|
|CN          |                19|        7.6|
|CA          |                11|        4.4|
|LR          |                10|        4.0|
|HK          |                 9|        3.6|
|MX          |                 9|        3.6|
|west_africa |                 9|        3.6|



### Continents studied

Table: Number/percentage of studies per continent

|Continent           | Number of studies| Percentage|
|:-------------------|-----------------:|----------:|
|americas            |                68|       27.3|
|none                |                53|       21.3|
|africa              |                47|       18.8|
|asia                |                47|       18.8|
|europe              |                25|       10.0|
|global              |                 7|        2.8|
|northern_hemisphere |                 1|        0.4|
|oceania             |                 1|        0.4|



### Geographic connection of authors to the studied locations 

#### Top 5 countries

|collab_type     |country_studied | yes| no| Total|
|:---------------|:---------------|---:|--:|-----:|
|purely_academic |US              |  17|  1|    18|
|purely_academic |CN              |   8|  0|     8|
|purely_academic |HK              |   7|  2|     9|
|purely_academic |HT              |   0|  3|     3|
|purely_academic |CA              |   3|  1|     4|
|mixed           |US              |  17|  0|    17|
|mixed           |CN              |  11|  0|    11|
|mixed           |CA              |   7|  0|     7|
|mixed           |MX              |   4|  1|     5|
|mixed           |LR              |   1|  3|     4|
|Total           |-               |  75| 11|    86|

#### Aggregated

|collab_type     | yes| no| Total|
|:---------------|---:|--:|-----:|
|mixed           |  63| 12|    75|
|purely_academic |  55| 28|    83|


## Interventions
### Types of interventions

|Collaboration   | No vaccination| Vaccination (mixed interventions)| Vaccination (single intervention)|
|:---------------|--------------:|---------------------------------:|---------------------------------:|
|purely_academic |             68|                                49|                                14|
|mixed           |             42|                                43|                                13|
|Total           |            110|                                92|                                27|

### Impact of vaccination

Table: Conclusions about impact of vaccination

|collab_type     | yes| no| inconclusive|
|:---------------|---:|--:|------------:|
|mixed           |   7|  5|            1|
|purely_academic |   6|  5|            3|
|Total           |  13| 10|            4|

# Secondary objectives of review
## Modelling objectives


Table: Study objectives by collaboration type

|collab_type     | both| future| past| Total|
|:---------------|----:|------:|----:|-----:|
|purely_academic |    4|     99|   28|   131|
|mixed           |    1|     68|   29|    98|
|Total           |    5|    167|   57|   229|

## Outbreak types

Table: Study objectives by collaboration type

|collab_type     | hypothetical_outbreak| real_outbreak| Total|
|:---------------|---------------------:|-------------:|-----:|
|purely_academic |                    69|            62|   131|
|mixed           |                    45|            53|    98|
|Total           |                   114|           115|   229|


## Modelling objectives and outbreak type by collaboration types

Table: Number of studies per objective and outbreak type

|outbreak_type         | future| past| both| Total|
|:---------------------|------:|----:|----:|-----:|
|hypothetical_outbreak |    107|    6|    1|   114|
|real_outbreak         |     60|   51|    4|   115|
|Total                 |    167|   57|    5|   229|

## Diseases studied per collab type


|disease                  | purely_academic| mixed| total|
|:------------------------|---------------:|-----:|-----:|
|influenza                |              73|    62|   135|
|ebola                    |              25|    10|    35|
|dengue                   |               6|     6|    12|
|cholera                  |               9|     2|    11|
|measles                  |               4|     7|    11|
|tuberculosis             |               6|     1|     7|
|poliomyelitis            |               2|     5|     7|
|varicella                |               2|     2|     4|
|meningococcal_meningitis |               1|     2|     3|
|pertussis                |               1|     1|     2|
|pneumococcal_disease     |               1|     1|     2|
|yellow_fever             |               1|     1|     2|
|hepatitis_a              |               1|     0|     1|
|hepatitis_b              |               0|     1|     1|
|malaria                  |               0|     1|     1|
|mumps                    |               0|     1|     1|
|rubella                  |               1|     0|     1|
|typhoid                  |               1|     0|     1|
![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-17-1.jpeg)<!-- -->

## Model characteristics 
### Individual heterogeneity: agent-based versus compartmental models

|collab_type     | compartments| agents| individuals_representation_other| Total|
|:---------------|------------:|------:|--------------------------------:|-----:|
|purely_academic |          106|     24|                                1|   131|
|mixed           |           75|     21|                                2|    98|
|Total           |          181|     45|                                3|   229|
<!-- ### Individual representation by model structure -->
<!-- ```{r} -->
<!-- mod_structure_vs_individual_representation <- compact_data_with_citation_keys_no_fmd %>%  -->
<!--   group_by(collab_type) %>%  -->
<!--   count(model_structure, individual_representation, sort = TRUE) %>%  -->
<!--   pivot_wider(names_from = model_structure, values_from = n) %>%  -->
<!--   adorn_totals(where = c('col', 'row')) -->

<!-- knitr::kable(mod_structure_vs_individual_representation, caption = 'Model structure versus individual heterogeneity') -->
<!-- ``` -->

### Spatial heterogeneity

Table: Spatial models

|collab_type     | no| yes| Total|
|:---------------|--:|---:|-----:|
|purely_academic | 97|  34|   131|
|mixed           | 66|  32|    98|

<!-- ### Spatial models by model structure -->
<!-- ```{r} -->
<!-- mod_structure_vs_space_representation <- compact_data_with_citation_keys_no_fmd %>%  -->
<!--   group_by(collab_type) %>%  -->
<!--   count(model_structure, space_representation, sort = TRUE) %>%  -->
<!--   pivot_wider(names_from = model_structure, values_from = n) %>%  -->
<!--   adorn_totals(where = c('col', 'row')) -->

<!-- knitr::kable(mod_structure_vs_space_representation, caption = 'Model structure versus spatial heterogeneity') -->
<!-- ``` -->

### Model dynamics: deterministic vs stochastic

Table: Model dynamics (deterministic versus stochastic)

|collab_type     | both| deterministic| stochastic|
|:---------------|----:|-------------:|----------:|
|purely_academic |    7|            94|         30|
|mixed           |    7|            52|         39|
|Total           |   14|           146|         69|


## Modelling methods

### Outcomes measured

### Parametrization methods


Table: How model parameters are obtained

|parametrization                          | purely_academic| mixed|
|:----------------------------------------|---------------:|-----:|
|literature and expert_opinion            |              35|    24|
|literature and fitted                    |              28|    28|
|literature                               |              24|    14|
|expert_opinion                           |              19|     7|
|literature and expert_opinion and fitted |              13|    19|
|fitted                                   |               9|     5|
|expert_opinion and fitted                |               3|     1|
|Total                                    |             131|    98|



### Validation methods 




### Sensitivity analysis

|model_structure | no| yes|
|:---------------|--:|---:|
|deterministic   | 85|  61|
|stochastic      | 34|  35|
|both            |  5|   9|


|collab_type     | no| yes|
|:---------------|--:|---:|
|purely_academic | 77|  54|
|mixed           | 47|  51|


### Data use and data availability

Table: How often publicly available data is used for modelling outbreak response interventions

|collab_type     | yes| no| Total|
|:---------------|---:|--:|-----:|
|purely_academic |  52| 11|    63|
|mixed           |  37| 26|    63|
|Total           |  89| 37|   126|


### Code availability

|collab_type     |  no| yes|
|:---------------|---:|---:|
|purely_academic | 129|   2|
|mixed           |  96|   2|
|Total           | 225|   4|


