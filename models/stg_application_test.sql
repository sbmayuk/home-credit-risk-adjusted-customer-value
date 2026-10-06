SELECT
    * REPLACE (

        CASE
            WHEN DAYS_EMPLOYED = 365243 THEN NULL
            ELSE DAYS_EMPLOYED
        END AS DAYS_EMPLOYED,

        CASE
            WHEN ORGANIZATION_TYPE = 'XNA' THEN NULL
            ELSE ORGANIZATION_TYPE
        END AS ORGANIZATION_TYPE

    )

FROM {{ source('homecredit_raw', 'application_test') }}