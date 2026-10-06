SELECT
    * REPLACE (

        CASE
            WHEN DAYS_EMPLOYED = 365243 THEN NULL
            ELSE DAYS_EMPLOYED
        END AS DAYS_EMPLOYED,

        CASE
            WHEN ORGANIZATION_TYPE = 'XNA' THEN NULL
            ELSE ORGANIZATION_TYPE
        END AS ORGANIZATION_TYPE,

        CASE
            WHEN CODE_GENDER = 'XNA' THEN NULL
            ELSE CODE_GENDER
        END AS CODE_GENDER,

        CASE
            WHEN NAME_FAMILY_STATUS = 'Unknown' THEN NULL
            ELSE NAME_FAMILY_STATUS
        END AS NAME_FAMILY_STATUS

    )

FROM {{ source('homecredit_raw', 'application_train') }}