create table advert
(
    id         integer default nextval('advert_id_seq'::regclass) not null
        primary key,
    title      varchar(200),
    website    varchar(200),
    image_file varchar(200)
);

alter table advert
    owner to postgres;

