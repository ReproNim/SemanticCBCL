# SemanticCBCL
An ABCD-ReproNim project to prototype methods and procedures for handling (restricted) ABCD data using NIDM to create a ReproPond that can be integrated with similar data from other sources. We will use the Child Behavior Checklist (CBCL) as a test case, but the results should be generalizable to any NDA-hosted data schema. 

## Problem Statement
Given the data dictionary and the data for the ABCD CBCL raw data (from NDA, with ABCD data access approval), represent this data in NIDM so as to be able to treat this data as a local "ReproPond".

## Bigger Picture
By extension, if one can represent the ABCD data in their ReproPond, one can then add data from other CBCL sources (i.e. HCP-Development) to integrate and query across disperate data sources. Similarly, if one can add a second data type (i.e. FreeSurfer volumetric data from ABCD and HCP-Development) one has a very rish example set of queries and integrations they could do across this large ReproPond. And finally, if there is marching public open data in a ReproLake, performing integrated data queries and analysis across the local (Pond) and pubic (Lake) data sources should be 'easily' facilitated.

# First Things First
ABCD CBCL raw data to NIDM

## The ReproSchema Way
ReproSchema (https://github.com/ReproNim/reproschema) already knows about many instruments, including the ABCD version of the CBCL, https://github.com/ReproNim/reproschema-library/tree/master/activities/abcd_cbcl01.

Each 'item' from the questionaire already has makrup. For example, the markup for qustion 1 can be seen here: https://github.com/ReproNim/reproschema-library/blob/master/activities/abcd_cbcl01/items/cbcl_q01_p

## The PyNIDM Way

> usage: csv2nidm [-h] -csv CSV_FILE [-json_map JSON_MAP | -redcap REDCAP]
>
>                [-nidm NIDM_FILE] [-no_concepts] [-log LOGFILE]
>                
>                [-dataset_id DATASET_IDENTIFIER] -out OUTPUT_FILE
