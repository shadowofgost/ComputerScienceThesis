create table schoolimage
(
    id        integer       default nextval('schoolimage_id_seq'::regclass) not null
        primary key,
    school_id integer
        constraint schoolimage_ibfk_1
            references school
            on update cascade on delete cascade
            deferrable initially deferred,
    file      varchar(1000) default NULL::character varying
);

alter table schoolimage
    owner to postgres;

create index schoolimage_school_id_idx
    on schoolimage (school_id);

