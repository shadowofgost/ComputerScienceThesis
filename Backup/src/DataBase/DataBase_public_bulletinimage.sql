create table bulletinimage
(
    id          integer default nextval('bulletinimage_id_seq'::regclass) not null
        primary key,
    bulletin_id integer
        references bulletin,
    file        varchar(500)
);

alter table bulletinimage
    owner to postgres;

