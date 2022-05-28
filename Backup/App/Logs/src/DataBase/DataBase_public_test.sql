create table test
(
    "user" varchar(50) not null
        primary key,
    tt     timestamp
);

alter table test
    owner to postgres;

