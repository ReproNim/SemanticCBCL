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

### Example
You can try this toy example at home, using fake, abcd-like CBCL data (fake_Data/abcd_cbcl01_simdata.tsv) and a pre-specified set of annotations for the CBCL questions (jsons/test_annotations.json). To do this,
1. Clone this repository, 
2. 'cd' into it on your local machine
3. run the following command:
> csv2nidm -csv fake_Data/abcd_cbcl01_simdata.tsv -json_map jsons/test_annotations.json -no_concept -out test2.ttl

This results in two files: 
* test2.ttl                 # the resultant NIDM version of the original CBCL (fake) data
* test2_annotations.json    # the json annotations of this NIDM file

So, if you have appropriate authorization and permissions and have the actual abcd_cbcl01.txt file downloaded from the NDA, you can (at home!) 
convert the real data into the NIDM format. Just replace the *fake_Data/abcd_cbcl01_simdata.tsv* with the *real_data.tsv*.  Note, the data 
files you get from NDA are tab-separated, but given the *.txt* extension. Before running the above command, move your rename (or copy, if you prefer) 
the *real_data.txt* to *real_data.tsv*. The ABCD CBCL datafile is big (~12000 subjects, multiple sessions, depending on which release you have). So 
the above command can take a long time on the read data (TODO: include time estimate here...).


### More about PyNIDM

> usage: csv2nidm [-h] -csv CSV_FILE [-json_map JSON_MAP | -redcap REDCAP]
>
>                [-nidm NIDM_FILE] [-no_concepts] [-log LOGFILE]
>                
>                [-dataset_id DATASET_IDENTIFIER] -out OUTPUT_FILE
