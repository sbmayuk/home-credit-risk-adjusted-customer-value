SELECT
    SK_ID_CURR,
    COUNT(*) AS total_pos_records,
    COUNT(DISTINCT SK_ID_PREV) AS pos_contract_count,

    COUNTIF(SK_DPD > 0) AS delayed_record_count,

    SAFE_DIVIDE(
        COUNTIF(SK_DPD > 0),
        COUNT(*)
    ) AS delayed_record_ratio ,
    MAX(SK_DPD) AS max_dpd ,
    COUNTIF(SK_DPD_DEF > 0) AS def_delayed_record_count ,
    SAFE_DIVIDE(
    COUNTIF(SK_DPD_DEF > 0),
    COUNT(*)
) AS def_delayed_record_ratio ,
    MAX(SK_DPD_DEF) AS max_dpd_def ,
    COUNT(DISTINCT IF(
    NAME_CONTRACT_STATUS = 'Completed',
    SK_ID_PREV,
    NULL
)) AS completed_contract_count ,
    SAFE_DIVIDE(
    COUNT(DISTINCT IF(
        NAME_CONTRACT_STATUS = 'Completed',
        SK_ID_PREV,
        NULL
    )),
    COUNT(DISTINCT SK_ID_PREV)
) AS completed_contract_ratio  

FROM {{ ref('stg_pos_cash_balance') }}

GROUP BY SK_ID_CURR