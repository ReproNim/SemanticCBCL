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

So, what is in this test2.ttl file? Let's see. We'll use "pynidm query".

First, lets discover what 'projects' are here:

> pynidm query -nl test2.ttl -u /projects 

which returns (for me):

> UUID
> ------------------------------------
> fe04fade-c74e-11ec-926b-acde48001122

Your actual UUID may be different.  Using this project ID, we can see what 'fields' we have:

> pynidm query -nl test2.ttl -u /projects/fe04fade-c74e-11ec-926b-acde48001122

where you insert your 'UUID'. This returns:

```
-----------------------------------------------  ------------------------------------
AcquisitionModality                              []
ImageContrastType                                []
ImageUsageType                                   []
Task                                             []
http://www.w3.org/1999/02/22-rdf-syntax-ns#type  "http://www.w3.org/ns/prov#Activity"
nfo:filename                                     "fake_Data/abcd_cbcl01_simdata.tsv"
-----------------------------------------------  ------------------------------------

Subject Information
---------------------
uuid                                  subject id
------------------------------------  ----------------
ce094792-c74e-11ec-926b-acde48001122  NDAR_INV00000001
de0ba3b6-c74e-11ec-926b-acde48001122  NDAR_INV00000002
fe0e0d7c-c74e-11ec-926b-acde48001122  NDAR_INV00000003
ee1011c6-c74e-11ec-926b-acde48001122  NDAR_INV00000004
ae12167e-c74e-11ec-926b-acde48001122  NDAR_INV00000005
fe14222a-c74e-11ec-926b-acde48001122  NDAR_INV00000006
be1625c0-c74e-11ec-926b-acde48001122  NDAR_INV00000007
ae182424-c74e-11ec-926b-acde48001122  NDAR_INV00000008
be1a3de0-c74e-11ec-926b-acde48001122  NDAR_INV00000009
ee1c621e-c74e-11ec-926b-acde48001122  NDAR_INV00000010
ae207d68-c74e-11ec-926b-acde48001122  nan
ae28a27c-c74e-11ec-926b-acde48001122  nan
ae2adc18-c74e-11ec-926b-acde48001122  nan
ae2cd888-c74e-11ec-926b-acde48001122  nan
ce1e7428-c74e-11ec-926b-acde48001122  nan
de248d0e-c74e-11ec-926b-acde48001122  nan
de2688d4-c74e-11ec-926b-acde48001122  nan
fe228e64-c74e-11ec-926b-acde48001122  nan
ee06d03e-c74e-11ec-926b-acde48001122  project

Data Elements
---------------
uuid                              label
--------------------------------  ------------------------
abcd_cbcl01_id_1b6gfba            abcd_cbcl01_id
cbcl_q01_p_3jfn7bu                cbcl_q01_p
cbcl_q02_p_gjfeer                 cbcl_q02_p
cbcl_q03_p_7qfqvc                 cbcl_q03_p
cbcl_q04_p_1ch9ml9                cbcl_q04_p
cbcl_q05_p_psft4o                 cbcl_q05_p
cbcl_q06_p_3vigv7u                cbcl_q06_p
cbcl_q07_p_273oj79                cbcl_q07_p
cbcl_q08_p_1v3tnte                cbcl_q08_p
cbcl_q09_p_1etnrni                cbcl_q09_p
cbcl_q100_p_1pcl9b7               cbcl_q100_p
cbcl_q101_p_31kcsa7               cbcl_q101_p
cbcl_q102_p_105reil               cbcl_q102_p
cbcl_q103_p_2sjitf                cbcl_q103_p
cbcl_q104_p_4h77i8                cbcl_q104_p
cbcl_q105_p_1h8k9qq               cbcl_q105_p
cbcl_q106_p_1jgpgmv               cbcl_q106_p
cbcl_q107_p_1mcpk0q               cbcl_q107_p
cbcl_q108_p_9u99e4                cbcl_q108_p
cbcl_q109_p_23tm5r1               cbcl_q109_p
cbcl_q10_p_2hk5e86                cbcl_q10_p
cbcl_q110_p_2slu63j               cbcl_q110_p
cbcl_q111_p_28f1mbs               cbcl_q111_p
cbcl_q112_p_2n15dah               cbcl_q112_p
cbcl_q11_p_2f1mtas                cbcl_q11_p
cbcl_q12_p_3hjjb69                cbcl_q12_p
cbcl_q13_p_i5bu9b                 cbcl_q13_p
cbcl_q14_p_3hc2j4b                cbcl_q14_p
cbcl_q15_p_2finq3f                cbcl_q15_p
cbcl_q16_p_2abv2ro                cbcl_q16_p
cbcl_q17_p_g2cttj                 cbcl_q17_p
cbcl_q18_p_3tqlvcc                cbcl_q18_p
cbcl_q19_p_38ncnjg                cbcl_q19_p
cbcl_q20_p_3qd471g                cbcl_q20_p
cbcl_q21_p_2gau3cp                cbcl_q21_p
cbcl_q22_p_3tgcjhv                cbcl_q22_p
cbcl_q23_p_q8pn27                 cbcl_q23_p
cbcl_q24_p_1n5knee                cbcl_q24_p
cbcl_q25_p_ee3qsd                 cbcl_q25_p
cbcl_q26_p_qratqk                 cbcl_q26_p
cbcl_q27_p_1jbj49k                cbcl_q27_p
cbcl_q28_p_2278029                cbcl_q28_p
cbcl_q29_p_kptmr9                 cbcl_q29_p
cbcl_q30_p_3o8a4ia                cbcl_q30_p
cbcl_q31_p_484k65                 cbcl_q31_p
cbcl_q32_p_3lts63p                cbcl_q32_p
cbcl_q33_p_23bunfv                cbcl_q33_p
cbcl_q34_p_2ft1oso                cbcl_q34_p
cbcl_q35_p_3tljbqm                cbcl_q35_p
cbcl_q36_p_fjssvr                 cbcl_q36_p
cbcl_q37_p_v8gvu8                 cbcl_q37_p
cbcl_q38_p_2jl20to                cbcl_q38_p
cbcl_q39_p_1aovufd                cbcl_q39_p
cbcl_q40_p_2tuunm                 cbcl_q40_p
cbcl_q41_p_fqah2k                 cbcl_q41_p
cbcl_q42_p_22poq54                cbcl_q42_p
cbcl_q43_p_1pr9iiv                cbcl_q43_p
cbcl_q44_p_25e5ksn                cbcl_q44_p
cbcl_q45_p_bv5vtt                 cbcl_q45_p
cbcl_q46_p_2gn53o1                cbcl_q46_p
cbcl_q47_p_1qkmsb9                cbcl_q47_p
cbcl_q48_p_1eam3ve                cbcl_q48_p
cbcl_q49_p_fkgq8k                 cbcl_q49_p
cbcl_q50_p_17dcs2a                cbcl_q50_p
cbcl_q51_p_6jo3hi                 cbcl_q51_p
cbcl_q52_p_3pman9v                cbcl_q52_p
cbcl_q53_p_1b3ia5v                cbcl_q53_p
cbcl_q54_p_1b19bf9                cbcl_q54_p
cbcl_q55_p_2naem4g                cbcl_q55_p
cbcl_q56a_p_2i2jcna               cbcl_q56a_p
cbcl_q56b_p_30iiqf4               cbcl_q56b_p
cbcl_q56c_p_2ug2pqm               cbcl_q56c_p
cbcl_q56d_p_1km7grk               cbcl_q56d_p
cbcl_q56e_p_22nh2jn               cbcl_q56e_p
cbcl_q56f_p_2k2lbhp               cbcl_q56f_p
cbcl_q56g_p_q1j3g8                cbcl_q56g_p
cbcl_q56h_p_2dutt1h               cbcl_q56h_p
cbcl_q57_p_3d5psic                cbcl_q57_p
cbcl_q58_p_27f68pl                cbcl_q58_p
cbcl_q59_p_15hsr4b                cbcl_q59_p
cbcl_q60_p_3j4u9ic                cbcl_q60_p
cbcl_q61_p_3deh80g                cbcl_q61_p
cbcl_q62_p_15bcrhj                cbcl_q62_p
cbcl_q63_p_1luiq0p                cbcl_q63_p
cbcl_q64_p_2ee2es2                cbcl_q64_p
cbcl_q65_p_2cjp33p                cbcl_q65_p
cbcl_q66_p_vf44t                  cbcl_q66_p
cbcl_q67_p_2ktjbqq                cbcl_q67_p
cbcl_q68_p_c176lk                 cbcl_q68_p
cbcl_q69_p_tskbce                 cbcl_q69_p
cbcl_q70_p_2doa6ck                cbcl_q70_p
cbcl_q71_p_2q8tocs                cbcl_q71_p
cbcl_q72_p_3e0skag                cbcl_q72_p
cbcl_q73_p_2298j8e                cbcl_q73_p
cbcl_q74_p_31j2db9                cbcl_q74_p
cbcl_q75_p_1t1junu                cbcl_q75_p
cbcl_q76_p_qjm4sm                 cbcl_q76_p
cbcl_q77_p_25scult                cbcl_q77_p
cbcl_q78_p_3234p6g                cbcl_q78_p
cbcl_q79_p_2biiots                cbcl_q79_p
cbcl_q80_p_3prbe64                cbcl_q80_p
cbcl_q81_p_3smju8o                cbcl_q81_p
cbcl_q82_p_1gikge5                cbcl_q82_p
cbcl_q83_p_39fusu5                cbcl_q83_p
cbcl_q84_p_e9flps                 cbcl_q84_p
cbcl_q85_p_1j6neso                cbcl_q85_p
cbcl_q86_p_2gh5bnb                cbcl_q86_p
cbcl_q87_p_27qctdm                cbcl_q87_p
cbcl_q88_p_12jk2d1                cbcl_q88_p
cbcl_q89_p_22vindi                cbcl_q89_p
cbcl_q90_p_3n2tc35                cbcl_q90_p
cbcl_q91_p_36pbjia                cbcl_q91_p
cbcl_q92_p_1jm1egr                cbcl_q92_p
cbcl_q93_p_1mh7pi5                cbcl_q93_p
cbcl_q94_p_2jteqha                cbcl_q94_p
cbcl_q95_p_uthg5o                 cbcl_q95_p
cbcl_q96_p_12hlfr6                cbcl_q96_p
cbcl_q97_p_17tigm7                cbcl_q97_p
cbcl_q98_p_1afnfff                cbcl_q98_p
cbcl_q99_p_1nsepkk                cbcl_q99_p
cbcl_select_language___1_3egc78r  cbcl_select_language___1
collection_id_h5qss6              collection_id
collection_title_3iu39bp          collection_title
dataset_id_65sqil                 dataset_id
eventname_5cki6a                  eventname
interview_age_2gbbrbr             interview_age
interview_date_19cndle            interview_date
sex_39fscdd                       sex
src_subject_id_2au9tpl            src_subject_id
study_cohort_name_193i02a         study_cohort_name
subjectkey_1rf8qld                subjectkey
timept_33ivdmb                    timept
```

Now, for one of the 'data element' uuids, we can fetch its' data by:

> TODO...


### Actual ABCD data
So, if you have appropriate authorization and permissions and have the actual abcd_cbcl01.txt file downloaded from the NDA, you can (at home!) 
convert the real data into the NIDM format. Just replace the *fake_Data/abcd_cbcl01_simdata.tsv* with the *real_data.tsv*.  Note, the data 
files you get from NDA are tab-separated, but given the *.txt* extension. Before running the above command, move your rename (or copy, if you prefer) 
the *real_data.txt* to *real_data.tsv*. The ABCD CBCL datafile is big (~12000 subjects, multiple sessions, depending on which release you have). So 
the above command can take a long time on the read data (~20 minutes on a MacBook Pro).


### More about PyNIDM

> usage: csv2nidm [-h] -csv CSV_FILE [-json_map JSON_MAP | -redcap REDCAP]
>
>                [-nidm NIDM_FILE] [-no_concepts] [-log LOGFILE]
>                
>                [-dataset_id DATASET_IDENTIFIER] -out OUTPUT_FILE
