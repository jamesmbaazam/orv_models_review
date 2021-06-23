---
title: "Systematic review of outbreak response models"
author: "James Azam"
date: "01/06/2021"
output:
  word_document:
    keep_md: yes
  html_document:
    df_print: paged
---











# Exploratory Data Analysis
1. Publications per year
2. Distribution of collaborations across types (aggregated)
3. Countries/settings being studied (author affiliation vs country studied)


What science is being inferred from models?

1. Impact of vaccination (human diseases vs FMD); analyse with and without Influenza
2. What diseases are being studied (to understand vaccine impact)
3. Which interventions are being studied?

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-4-1.png)<!-- -->


Table: Number of studies per objective type

|Objective type | Number of studies|
|:--------------|-----------------:|
|both           |                 6|
|future         |               166|
|past           |                57|



Table: Number of studies per outbreak type

|Outbreak type         | Number of studies|
|:---------------------|-----------------:|
|hypothetical_outbreak |               115|
|real_outbreak         |               114|



Table: Number of studies per objective and outbreak type

|Objective type |Outbreak type         | Number of studies|
|:--------------|:---------------------|-----------------:|
|future         |hypothetical_outbreak |               107|
|future         |real_outbreak         |                59|
|past           |real_outbreak         |                51|
|past           |hypothetical_outbreak |                 6|
|both           |real_outbreak         |                 4|
|both           |hypothetical_outbreak |                 2|




|Disease                  | Number of times|
|:------------------------|---------------:|
|influenza                |             135|
|ebola                    |              35|
|dengue                   |              12|
|cholera                  |              11|
|measles                  |              11|
|poliomyelitis            |               7|
|tuberculosis             |               7|
|varicella                |               4|
|meningococcal_meningitis |               3|
|pertussis                |               2|
|pneumococcal_disease     |               2|
|yellow_fever             |               2|
|hepatitis_a              |               1|
|hepatitis_b              |               1|
|malaria                  |               1|
|mumps                    |               1|
|rubella                  |               1|
|typhoid                  |               1|



|disease   |   n|
|:---------|---:|
|influenza | 135|


Table: Number/percentage of studies per country

|Country     | Number of studies| Percentage|
|:-----------|-----------------:|----------:|
|other       |                91|       36.4|
|none        |                54|       21.7|
|US          |                37|       14.9|
|CN          |                19|        7.6|
|CA          |                11|        4.4|
|LR          |                10|        4.0|
|HK          |                 9|        3.6|
|MX          |                 9|        3.6|
|west_africa |                 9|        3.6|



Table: Number/percentage of studies per continent

|Continent           | Number of studies| Percentage|
|:-------------------|-----------------:|----------:|
|americas            |                67|       26.9|
|none                |                54|       21.7|
|africa              |                47|       18.8|
|asia                |                47|       18.8|
|europe              |                25|       10.0|
|global              |                 7|        2.8|
|northern_hemisphere |                 1|        0.4|
|oceania             |                 1|        0.4|



Table: Most studied country

|Country | Number of studies| Percentage|
|:-------|-----------------:|----------:|
|US      |                37|       14.9|



Table: Most studied continent

|Continent | Number of studies| Percentage|
|:---------|-----------------:|----------:|
|americas  |                67|       26.9|

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-6-1.png)<!-- -->

Table: Number/percent of studies by continent

|Continent | Number of papers| Percent of papers|
|:---------|----------------:|-----------------:|
|africa    |               47|              25.1|
|americas  |               67|              35.8|
|asia      |               47|              25.1|
|europe    |               25|              13.4|
|oceania   |                1|               0.5|

Other summaries

|max_pub_year |disease_with_max_pubs |country_most_studied |
|:------------|:---------------------|:--------------------|
|2016         |influenza             |US                   |



# Primary objectives 

1. Is modelling being used to inform outbreak response policy-making? 
+ How are the results distributed according to collaboration type?

Note that we do not include FMD in all the primary analyses. We only use it for comparisons, where necessary.


|author_affiliation_type                               |   n|
|:-----------------------------------------------------|---:|
|academic_institutions                                 | 131|
|academic_institutions + government_institutions       |  54|
|academic_institutions + government_institutions + NGO |  14|
|academic_institutions + NGO                           |  18|
|government_institutions                               |   5|
|government_institutions + NGO                         |   2|
|NGO                                                   |   5|

+ What has been the trend in collaboration over the years?

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-9-1.png)<!-- -->

Table: Number of publications per collaboration type

|Collaboration type                                    | Number of publications|
|:-----------------------------------------------------|----------------------:|
|academic_institutions                                 |                    131|
|academic_institutions + government_institutions       |                     54|
|academic_institutions + government_institutions + NGO |                     14|
|academic_institutions + NGO                           |                     18|
|government_institutions                               |                      5|
|government_institutions + NGO                         |                      2|
|NGO                                                   |                      5|

Proportions of the total publications by collaboration type (academic only versus others).

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-10-1.png)<!-- -->

Plot of academic collaborations versus other collaborations not involving academics.

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-11-1.png)<!-- -->

2. Is vaccination the most effective when compared to other single interventions?



|is_vax_effective               |  n|
|:------------------------------|--:|
|yes                            | 12|
|no                             | 11|
|the_outcomes_were_inconclusive |  5|


![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-13-1.png)<!-- -->

How many times each disease has been studied.

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-14-1.png)<!-- -->


How many times each intervention type has been modelled.

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-15-1.png)<!-- -->

|intervention_modelled                                                               |   n|
|:-----------------------------------------------------------------------------------|---:|
|vaccination                                                                         | 116|
|school_closure                                                                      |  37|
|isolation                                                                           |  28|
|antiviral_prophylaxis                                                               |  26|
|treatment                                                                           |  25|
|distancing                                                                          |  16|
|quarantine                                                                          |  15|
|travel_restriction                                                                  |  11|
|safe_burial                                                                         |   9|
|behavioural_change                                                                  |   8|
|face_masks                                                                          |   8|
|media_campaign                                                                      |   8|
|contact_tracing                                                                     |   7|
|work_closure                                                                        |   6|
|antiviral treatment                                                                 |   5|
|education                                                                           |   5|
|hygiene                                                                             |   5|
|beds                                                                                |   4|
|hospitalization                                                                     |   4|
|larvicides                                                                          |   4|
|screening                                                                           |   3|
|ebola treatment center                                                              |   2|
|handwashing                                                                         |   2|
|PPE_other_1                                                                         |   2|
|unclear                                                                             |   2|
|ventilation                                                                         |   2|
|active case finding                                                                 |   1|
|antiviral treatment                                                                 |   1|
|case holding                                                                        |   1|
|community care center                                                               |   1|
|community care centers                                                              |   1|
|e.g.                                                                                |   1|
|early detection and diagnosis                                                       |   1|
|exit screening                                                                      |   1|
|larva control                                                                       |   1|
|latent case finding                                                                 |   1|
|passive diagnosis active diagnosis and combined above                               |   1|
|point-of-use water treatment                                                        |   1|
|preventing importation                                                              |   1|
|prophylactic measures to mitigate outbreak seasonality and morbidity                |   1|
|quarantine                                                                          |   1|
|reduce the number of susceptible and infected and simultaneously increase recovered |   1|
|reduction of community transmission                                                 |   1|
|secondary ipt                                                                       |   1|
|several combinations of interventions                                               |   1|
|stay-at-home behaviour                                                              |   1|
|ultraviolet germicidal irradiation                                                  |   1|
|various                                                                             |   1|
|adult vector control                                                                |   1|
|antibiotic prophylaxis                                                              |   1|
|capturing infected bats                                                             |   1|
|close live poultry market                                                           |   1|
|closure of public places                                                            |   1|
|control the propagation                                                             |   1|
|diagnostics                                                                         |   1|
|direct measures to reduce infectiousness                                            |   1|
|disease control                                                                     |   1|
|distancing from infectious individuals                                              |   1|
|drugs                                                                               |   1|
|ebola treatment unit                                                                |   1|
|ebola treatment units                                                               |   1|
|effective hospitalization                                                           |   1|
|high efficiency particulate air filtration                                          |   1|
|household protective kits                                                           |   1|
|hygiene precaution                                                                  |   1|
|interventions to reduce transmission                                                |   1|
|mass immunization program                                                           |   1|
|mosquito repellent                                                                  |   1|
|onboard quarantine inspection                                                       |   1|
|paid sick days                                                                      |   1|
|pallative_care                                                                      |   1|
|post-exposure prophylaxis                                                           |   1|
|ppe_other_1                                                                         |   1|
|prevention of mass gatherings                                                       |   1|
|prison: entry screening                                                             |   1|
|prohibition of traffic                                                              |   1|
|protected sex with condoms                                                          |   1|
|reducing mosquito density                                                           |   1|
|reducing transmission                                                               |   1|
|reduction of hospital transmission                                                  |   1|
|respiratory protective devices                                                      |   1|
|sanitary measures                                                                   |   1|
|school absenteeism surveillance                                                     |   1|
|several interventions to reduce transmission                                        |   1|
|sick leave strategy                                                                 |   1|
|social mobilisation                                                                 |   1|
|stay-at-home                                                                        |   1|
|stay home                                                                           |   1|
|sterile insect technique                                                            |   1|
|therapeutics                                                                        |   1|
|ultra-low volume (ulv) insecticide applications                                     |   1|
|vector control                                                                      |   1|
|water treatment                                                                     |   1|

How many times each outcome/metric has been used


|outcome_measured                                                               |  n|
|:------------------------------------------------------------------------------|--:|
|final_epidemic_size                                                            | 87|
|attack_rate                                                                    | 58|
|cases_averted                                                                  | 37|
|timing_of_peak                                                                 | 35|
|outbreak_duration_and_timing                                                   | 28|
|cost                                                                           | 23|
|intervention_coverage                                                          | 14|
|hospitalizations                                                               | 13|
|case_fatality                                                                  | 10|
|incidence                                                                      | 10|
|peak magnitude                                                                 |  8|
|cumulative incidence                                                           |  7|
|r0                                                                             |  6|
|total deaths                                                                   |  5|
|campaign_duration                                                              |  4|
|control reproduction number                                                    |  4|
|cumulative attack rate                                                         |  4|
|deaths_averted                                                                 |  4|
|qualys                                                                         |  4|
|cumulative deaths                                                              |  3|
|incidence                                                                      |  3|
|peak magnitude                                                                 |  3|
|basic reproduction number                                                      |  3|
|cumulative cases                                                               |  3|
|mortality rate                                                                 |  3|
|peak incidence                                                                 |  3|
|peak size                                                                      |  3|
|basic reproduction number                                                      |  2|
|cumulative cases                                                               |  2|
|population immunity                                                            |  2|
|cumulative deaths                                                              |  2|
|cumulative infections                                                          |  2|
|deaths                                                                         |  2|
|incremental cost effectiveness ratio                                           |  2|
|                                                                               |  1|
|and the individuals that have recovered and are immune to evd                  |  1|
|average expected number of cases                                               |  1|
|average number of weeks lost                                                   |  1|
|case reproduction number                                                       |  1|
|cumulative attack rate                                                         |  1|
|cumulative infections                                                          |  1|
|date of first reported cases                                                   |  1|
|i and r curve                                                                  |  1|
|incremental net benefits                                                       |  1|
|indirect protection                                                            |  1|
|isolated or quarantined individuals                                            |  1|
|maximum number of symptomatic cases per day                                    |  1|
|net benefits                                                                   |  1|
|number of courses of drug required to achieve containment                      |  1|
|number of latently infected individuals                                        |  1|
|number of susceptible individuals                                              |  1|
|number of times countermeasures are started                                    |  1|
|peak day                                                                       |  1|
|peak infections                                                                |  1|
|proportion of susceptible individuals                                          |  1|
|proportion of time that infected size is above a threshold number of infecteds |  1|
|return on investment                                                           |  1|
|risk of death                                                                  |  1|
|total vaccinated                                                               |  1|
|vaccination coverage                                                           |  1|
|vaccine-derived virus prevalence                                               |  1|
|years of life lost                                                             |  1|
|cumulative hospital cases                                                      |  1|
|cumulative infected                                                            |  1|
|dalys                                                                          |  1|
|delay between epidemics                                                        |  1|
|duration of infection                                                          |  1|
|effective reproduction number                                                  |  1|
|effectiveness of vaccination strategies                                        |  1|
|extra protective rate                                                          |  1|
|first arrival time                                                             |  1|
|force of infection                                                             |  1|
|funerals                                                                       |  1|
|geometric mean number of infected hosts                                        |  1|
|hospital notifications                                                         |  1|
|household reproduction number                                                  |  1|
|household reproduction number for                                              |  1|
|immunization threshold                                                         |  1|
|incremental cost effectiveness ratio (icer)                                    |  1|
|infection rate                                                                 |  1|
|instantaneous reproduction number                                              |  1|
|morbidity                                                                      |  1|
|mortality                                                                      |  1|
|number of contacts traced                                                      |  1|
|number of deaths                                                               |  1|
|number of exposed and infectious individuals                                   |  1|
|number of individuals in s                                                     |  1|
|number of simulations with epidemic outbreak                                   |  1|
|paralytic incidence                                                            |  1|
|peak daily infection                                                           |  1|
|peak difference                                                                |  1|
|peak infection rate                                                            |  1|
|prevalence                                                                     |  1|
|prevalence of infection                                                        |  1|
|probability of preventing a large outbreak                                     |  1|
|reproduction number                                                            |  1|
|resistant cases                                                                |  1|
|risk of case importation                                                       |  1|
|time of detection                                                              |  1|
|total fraction of infected and exposed                                         |  1|
|vaccine doses                                                                  |  1|

![](orv_sys_rev_data_analysis_files/figure-docx/unnamed-chunk-16-1.png)<!-- -->

