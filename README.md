# Raw size-frequency datasets

This R project is used to build the `iotc.data.reference.datasets.SF.raw` R package and contains all necessary code and resources to create the **raw** size-frequency datasets for all species for which there is any type of length or weight measurement available in the IOTC databases.

It uses the `iotc.base.common.data` library to access the current data storage (`IOTDB`) but does not explicitly depends on it. This means that the final package can be used in other R projects / scripts that need any of the exported datasets, without introducing any type of dependency from the IOTC databases.

In fact, *live* access to the IOTC databases is only required when **building** the project.

## How to initialise the datasets

Simply run the `load_datasets.R` script included under the `data-raw` folder.

The script will take care of:

- loading all current raw size-frequency data using the IOTC data libraries
- creating distinct *subsets* of the size-frequency records, one for each species group
- producing a distinct `.rda` R data file for each subset of the original information, eventually stored under the `data` folder of the project

## How to build the package

Run the `build_and_upload.R` script.

This will:

-   load all necessary datasets (see above)
-   build the package
-   upload the `.rda` dataset files and the built package (as a `.tar.gz` file) onto the [*Downloads* section](https://bitbucket.org/iotc-ws/iotc-reference-datasets-sf/downloads/) of the BitBucket repository

For this to work, it is necessary to configure in advance the `BITBUCKET_UPLOAD_SF_DATASET_TOKEN` as an environment variable that should be assigned an access token created for the specific repository (with the `repository:write` OAuth 2.0 scope).

The creation of the token is generally [performed by the repository administrators](https://support.atlassian.com/bitbucket-cloud/docs/create-a-repository-access-token/) and the tokens, once created, shall be stored securely as they won't be accessible again after the creation.

See also the specific section of the [BitBucket cloud REST API](https://developer.atlassian.com/cloud/bitbucket/rest/api-group-downloads/#api-repositories-workspace-repo-slug-downloads-post).

## How to install the package

Build the package first, then from a command shell run:

```         
Rcmd.exe INSTALL --preclean --no-multiarch --with-keep.source iotc-reference-datasets-sf
```

or select `Build` / `Install package` from within R studio

## Publicly exported package content

### Datasets

1.  `RAW.TEMP` - raw size-frequency data for temperate tunas (**albacore** and **southern bluefin tuna**)
2.  `RAW.TROP` - raw size-frequency data for tropical tunas (**bigeye tuna**, **skipjack tuna**, and **yellowfin tuna**)
3.  `RAW.BILL` - raw size-frequency data for billfish species (**black marlin**, **blue marlin**, **striped marlin**, **Indo-pacific sailfish**, and **swordfish**)
4.  `RAW.NERI` - raw size-frequency data for neritic tunas (**bullet tuna**, **frigate tuna**, **kawakawa**, and **longtail tuna**)
5.  `RAW.SEER` - raw size-frequency data for seerfish species (**Indo-pacific king mackerel** and **narrow-barred Spanish mackerel**)
6.  `RAW.TNEI` - raw size-frequency data for other **tunas NEI** species
7.  `RAW.SHRK` - raw size-frequency data for **sharks**, **rays**, and **mobulid** species
8.  `RAW.ETPS` - raw size-frequency data for ETP species (**marine turtles**, **cetaceans**, **seabirds**)
9.  `RAW.OTHR` - raw size-frequency data for **all other species**
10. `LAST_UPDATE` - the date of last update / production of the datasets

### Functions

1.  `RAW.all()` - to return a collation of all `RAW.*` datasets above

## Structure of the datasets

-   `YEAR` < *to be described* >
-   `QUARTER` < *to be described* >
-   `MONTH_START` < *to be described* >
-   `MONTH_END` < *to be described* >
-   `FISHING_GROUND_CODE` < *to be described* >
-   `FISHING_GROUND` < *to be described* >
-   `FLEET_CODE` < *to be described* >
-   `FLEET` < *to be described* >
-   `FISHERY_TYPE_CODE` < *to be described* >
-   `FISHERY_TYPE` < *to be described* >
-   `FISHERY_GROUP_CODE` < *to be described* >
-   `FISHERY_GROUP` < *to be described* >
-   `FISHERY_CODE` < *to be described* >
-   `FISHERY` < *to be described* >
-   `GEAR_CODE` < *to be described* >
-   `GEAR` < *to be described* >
-   `SCHOOL_TYPE_CODE` < *to be described* >
-   `IUCN_STATUS_CODE` < *to be described* >
-   `IUCN_STATUS` < *to be described* >
-   `SPECIES_WP_CODE` < *to be described* >
-   `SPECIES_WP` < *to be described* >
-   `SPECIES_GROUP_CODE` < *to be described* >
-   `SPECIES_GROUP` < *to be described* >
-   `SPECIES_CATEGORY_CODE` < *to be described* >
-   `SPECIES_CATEGORY` < *to be described* >
-   `SPECIES_CODE` < *to be described* >
-   `SPECIES` < *to be described* >
-   `SPECIES_SCIENTIFIC` < *to be described* >
-   `SPECIES_FAMILY` < *to be described* >
-   `SPECIES_ORDER` < *to be described* >
-   `IS_IOTC_SPECIES` < *to be described* >
-   `IS_SPECIES_AGGREGATE` < *to be described* >
-   `IS_SSI` < *to be described* >
-   `MEASURE_TYPE_CODE` < *to be described* >
-   `MEASURE_TYPE` < *to be described* >
-   `MEASURE_UNIT_CODE` < *to be described* >
-   `SEX_CODE` < *to be described* >
-   `CLASS_LOW` < *to be described* >
-   `CLASS_HIGH` < *to be described* >
-   `FISH_COUNT` < *to be described* >
-   `RAISING` < *to be described* >
-   `RAISE_CODE` < *to be described* >
