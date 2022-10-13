SELECT * FROM project WHERE city = 'Лондон';
-- Задание 4
SELECT * FROM supplier_project_part_number WHERE quantity BETWEEN 300 AND 750;
-- Задание 8
SELECT DISTINCT pppn.supplier_id,
                pppn.detail_id,
                pppn.project_id FROM supplier_project_part_number pppn INNER JOIN 
                    supplier ON pppn.supplier_id = supplier.id INNER JOIN part ON 
                        pppn.detail_id = part.id INNER JOIN project ON pppn.project_id = project.id WHERE
                            supplier.city != part.city OR supplier.city != project.city;
-- Задание 11
SELECT DISTINCT first.city, second.city FROM 
    (SELECT * FROM supplier INNER JOIN supplier_project_part_number ON supplier.id = supplier_project_part_number.supplier_id) as first INNER JOIN
        (SELECT * FROM project INNER JOIN supplier_project_part_number ON project.id = supplier_project_part_number.project_id) as second ON first.supplier_id = second.supplier_id;
        -- refactor
-- Задание 13
SELECT DISTINCT p.id FROM project p INNER JOIN supplier_project_part_number pppn ON p.id = pppn.project_id 
    INNER JOIN supplier s ON pppn.supplier_id = s.id WHERE s.id != pppn.project_id;
-- Задание 14
SELECT DISTINCT fpppn.detail_id, spppn.detail_id FROM supplier_project_part_number fpppn INNER JOIN 
    supplier_project_part_number spppn ON fpppn.supplier_id = spppn.supplier_id WHERE 
        fpppn.detail_id != spppn.detail_id AND fpppn.detail_id > spppn.detail_id;
-- Задание 22
SELECT DISTINCT project_id FROM supplier_project_part_number WHERE 
    detail_id IN (SELECT DISTINCT detail_id FROM supplier_project_part_number WHERE supplier_id = 'П1');
-- Задание 27
SELECT project_id FROM supplier_project_part_number AS fpppn WHERE 
    (fpppn.detail_id = 'Д1') AND ((SELECT avg(quantity) FROM supplier_project_part_number AS spppn
        WHERE (fpppn.detail_id = spppn.detail_id)) < fpppn.quantity);
-- Задание 29
SELECT project.id FROM project WHERE project.id NOT IN 
    (SELECT DISTINCT pppn.project_id FROM supplier_project_part_number pppn WHERE 
        pppn.supplier_id IN (SELECT id FROM supplier WHERE id != 'П1'));
-- Задание 33
SELECT part.city FROM part UNION SELECT supplier.city FROM supplier UNION SELECT project.city FROM project;
