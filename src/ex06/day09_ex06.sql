CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar DEFAULT 'Dmitriy',
    pprice numeric DEFAULT 500,
    pdate date DEFAULT '2022-01-08'
) 
RETURNS TABLE (
    name varchar
) AS
$$
    SELECT DISTINCT pz.name 
    FROM pizzeria AS pz
        JOIN menu AS m ON m.pizzeria_id = pz.id
        JOIN person_visits AS pv ON pv.pizzeria_id = pz.id
        JOIN person AS p ON p.id = pv.person_id 
    WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
$$ 
LANGUAGE SQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
