create sequence hibernate_sequence start 1 increment 1;

create sequence house_seq start 1 increment 10;
create sequence device_seq start 1 increment 50;

create table house (
    id int8 not null,
    description varchar(255) not null,
    primary key (id)
);

create table device (
    id int8 not null,
    power boolean not null,
    voltage int4,
    id_house int8,
    primary key (id)
);

--Unique keys
alter table house add constraint house__description_uk unique (description);

--Foreign keys
alter table device add constraint device__house_fk foreign key (id_house) references house
    ON DELETE CASCADE ON UPDATE CASCADE;