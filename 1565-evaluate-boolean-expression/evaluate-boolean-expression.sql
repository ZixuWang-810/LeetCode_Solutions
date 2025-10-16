SELECT
    LV.name as left_operand
    ,E.operator
    ,RV.name as right_operand
    ,CASE 
        WHEN ((E.operator = '=' AND LV.value = RV.value) 
            OR (E.operator = '<' AND LV.value < RV.value)
            OR (E.operator = '>' AND LV.value > RV.value))
        THEN 'true'
        ELSE 'false' END as value
FROM Expressions E
    INNER JOIN Variables LV
    ON E.left_operand = LV.name
    INNER JOIN Variables RV
    ON E.right_operand  = RV.name