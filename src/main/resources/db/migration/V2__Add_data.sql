insert into house (id, description)
    values (1, 'Дом 1'),
           (2, 'Дом 2'),
           (3, 'Дом 3');

insert into device (id, power, voltage, id_house)
    values (1, true, 110, 1),
           (2, true, null, 1),
           (3, false, 220, 2),
           (4, true, 5, 2),
           (5, false, null, 2),
           (6, true, 200, 3),
           (7, true, null, 3);

select setval('house_seq', (select max(id) FROM house));
select setval('device_seq', (select max(id) FROM device));