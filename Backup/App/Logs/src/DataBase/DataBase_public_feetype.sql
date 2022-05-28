create table feetype
(
    id   integer      default nextval('feetype_id_seq'::regclass) not null
        primary key,
    name varchar(400) default NULL::character varying
);

alter table feetype
    owner to postgres;

INSERT INTO public.feetype (id, name) VALUES (1, '按时间收费');
INSERT INTO public.feetype (id, name) VALUES (2, '按等级收费');
