SELECT
    SK_ID_CURR,
    TARGET,

    SAFE_DIVIDE(
        AMT_CREDIT,
        AMT_INCOME_TOTAL
    ) AS credit_income_ratio,

    SAFE_DIVIDE(
        AMT_ANNUITY,
        AMT_INCOME_TOTAL
    ) AS annuity_income_ratio,

    SAFE_DIVIDE(
        -DAYS_BIRTH,
        365
    ) AS age_years,

    SAFE_DIVIDE(
        -DAYS_EMPLOYED,
        365
    ) AS employment_years,

    SAFE_DIVIDE(
        AMT_CREDIT,
        AMT_GOODS_PRICE
    ) AS credit_goods_ratio,

    SAFE_DIVIDE(
        AMT_INCOME_TOTAL,
        CNT_FAM_MEMBERS
    ) AS income_per_person,

    (
        SELECT AVG(score)
        FROM UNNEST([
            EXT_SOURCE_1,
            EXT_SOURCE_2,
            EXT_SOURCE_3
        ]) AS score
    ) AS ext_source_avg

FROM {{ ref('stg_application_train') }}