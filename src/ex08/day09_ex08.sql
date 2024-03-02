CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (
    a bigint
) AS
$$
    WITH RECURSIVE fib(a, b) AS (
        SELECT 0 AS a, 1 AS b
        UNION ALL 
        SELECT b, a + b FROM fib 
        WHERE b < pstop
    )

    SELECT a FROM fib;
$$ 
LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
