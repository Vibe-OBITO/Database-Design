//1 Количество конструкторов в Форумуле 1
MATCH (class)-[:is_constructor]-(constructor) WHERE class.name = "Formula 1" RETURN COUNT(constructor)

//2 Конструктор с именем "Williams Racing"
MATCH (c: constructor) WHERE c.name = "Williams Racing" RETURN c

//3 Пары "конструктор - используемая силовая установка"
MATCH (n)-[:used_power_unit]-(m) RETURN n, m

//4 Конструкторы у которых количество побед в чемпионате больше пяти
MATCH (n: constructor)-[:world_championships]-(m) WHERE m.value > 5 RETURN n

//5 Конструкторы использующие силовую установку Ferrari
MATCH (n: constructor)-[:used_power_unit]-(m) WHERE m.name="Ferrari power unit" RETURN n

//6 Конструкторы появившиеся в Формуле 1 после 2000 года
MATCH (n: constructor)-[:first_team_entry]-(m) WHERE m.value>2000 RETURN n, m

//7 Количество конструкторов использующих силовые установки Honda
MATCH (constructor)-[:used_power_unit]-(m) WHERE m.name = "Honda power unit" RETURN COUNT(constructor)

//8 Конструкторы ни разу не победившие в чемпионате
MATCH (n: constructor)-[:world_championships]-(m) WHERE m.value = 0 RETURN n

//9 Конструкторы, главный штаб которых находится в Великобритании
MATCH (c: constructor) WHERE c.from = "United Kingdom" RETURN c

//10 Конструкторы, главный штаб которых находится в Италии, имеющие хотя бы одну победу в кубке конструкоров.
MATCH (c: constructor)-[:world_championships]-(n) WHERE c.from="Italy" AND n.value>0 RETURN c