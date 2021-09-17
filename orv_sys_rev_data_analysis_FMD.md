---
title: "Primary analysis for Outbreak response models of foot and mouth disease (1970-2019)"
author: "James Azam"
date: 'September 17, 2021'
output:
  word_document:
    keep_md: yes
    reference_docx: word-style.docx
    toc: yes
---









# Primary objectives of review

## Collaboration patterns in time
### Number of FMD studies per collaboration types

|author_affiliation_type                               |  n|
|:-----------------------------------------------------|--:|
|academic_institutions                                 | 10|
|academic_institutions + government_institutions       |  6|
|government_institutions                               |  5|
|academic_institutions + government_institutions + NGO |  3|
|government_institutions + NGO                         |  1|
### Proportions of the total publications per year by collaboration type

![](orv_sys_rev_data_analysis_FMD_files/figure-docx/unnamed-chunk-4-1.jpeg)<!-- -->
### Absolute number of publications per year by collaboration type

![](orv_sys_rev_data_analysis_FMD_files/figure-docx/unnamed-chunk-5-1.jpeg)<!-- -->

## Collaboration patterns in geographic space

### Geographic connection of authors to the studied locations 

|collab_type     | yes| no| Total|
|:---------------|---:|--:|-----:|
|mixed           |  14|  1|    15|
|purely_academic |   9|  1|    10|


## Interventions
### Types of interventions

|Collaboration   | No vaccination| Vaccination (mixed interventions)| Vaccination (single intervention)|
|:---------------|--------------:|---------------------------------:|---------------------------------:|
|mixed           |             11|                                 2|                                 2|
|purely_academic |              3|                                 5|                                 2|
|Total           |             14|                                 7|                                 4|

### Impact of vaccination

Table: Conclusions about impact of vaccination

|collab_type     | no| inconclusive| yes|
|:---------------|--:|------------:|---:|
|mixed           |  7|            2|   2|
|purely_academic |  1|            2|   0|
|Total           |  8|            4|   2|

# Secondary objectives of review

## Modelling objectives


Table: Study objectives by collaboration type

|collab_type     | future| past| Total|
|:---------------|------:|----:|-----:|
|purely_academic |      6|    4|    10|
|mixed           |     11|    4|    15|
|Total           |     17|    8|    25|

## Outbreak types

Table: Study objectives by collaboration type

|collab_type     | hypothetical_outbreak| real_outbreak| Total|
|:---------------|---------------------:|-------------:|-----:|
|purely_academic |                     7|             3|    10|
|mixed           |                    10|             5|    15|
|Total           |                    17|             8|    25|


## Modelling objectives and outbreak type by collaboration types

Table: Number of studies per objective and outbreak type

|outbreak_type         | future| past|
|:---------------------|------:|----:|
|hypothetical_outbreak |     13|    4|
|real_outbreak         |      4|    4|
|Total                 |     17|    8|


## Model characteristics 

### Individual heterogeneity: agent-based versus compartmental models

|collab_type     | agents| compartments|
|:---------------|------:|------------:|
|mixed           |     11|            4|
|purely_academic |      9|            1|
|Total           |     20|            5|
### Spatial heterogeneity

Table: Spatial models

|collab_type     | yes| no| Total|
|:---------------|---:|--:|-----:|
|mixed           |  10|  5|    15|
|purely_academic |   8|  2|    10|
|Total           |  18|  7|    25|


### Model dynamics: deterministic vs stochastic


Table: Model dynamics (deterministic versus stochastic)

|collab_type     | deterministic| stochastic|
|:---------------|-------------:|----------:|
|purely_academic |             4|          6|
|mixed           |             8|          7|
|Total           |            12|         13|


## Modelling methods

### Parametrization methods

Table: How model parameters are obtained

|parametrization                          | mixed| purely_academic|
|:----------------------------------------|-----:|---------------:|
|literature and expert_opinion            |     6|               1|
|literature                               |     4|               1|
|fitted                                   |     3|               2|
|literature and expert_opinion and fitted |     1|               2|
|literature and fitted                    |     0|               2|
|expert_opinion                           |     1|               1|
|expert_opinion and fitted                |     0|               1|
|Total                                    |    15|              10|

### Validation methods 




### Sensitivity analysis

|model_structure | no| yes|
|:---------------|--:|---:|
|deterministic   |  7|   5|
|stochastic      |  7|   6|
|Total           | 14|  11|


### Data use and data availability

Table: How often publicly available data is used for modelling outbreak response interventions

|collab_type     | no| yes|
|:---------------|--:|---:|
|mixed           |  6|   1|
|purely_academic |  5|   2|
|Total           | 11|   3|


### Code availability

|collab_type     | no|
|:---------------|--:|
|purely_academic | 10|
|mixed           | 15|
|Total           | 25|



