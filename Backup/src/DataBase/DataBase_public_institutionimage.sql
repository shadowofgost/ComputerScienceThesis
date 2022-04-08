create table institutionimage
(
    id             integer       default nextval('institutionimage_id_seq'::regclass) not null
        primary key,
    institution_id integer
        constraint institutionimage_ibfk_1
            references institution
            on update cascade on delete cascade
            deferrable initially deferred,
    file           varchar(1000) default NULL::character varying
);

alter table institutionimage
    owner to postgres;

create index institutionimage_institution_id_idx
    on institutionimage (institution_id);

