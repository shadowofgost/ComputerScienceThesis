create table schooltype
(
    id   integer      default nextval('schooltype_id_seq'::regclass) not null
        primary key,
    name varchar(100) default NULL::character varying
);

alter table schooltype
    owner to postgres;

INSERT INTO public.schooltype (id, name) VALUES (1, '幼儿园');
INSERT INTO public.schooltype (id, name) VALUES (2, '小学');
INSERT INTO public.schooltype (id, name) VALUES (3, '初中');
INSERT INTO public.schooltype (id, name) VALUES (4, '高中');
INSERT INTO public.schooltype (id, name) VALUES (5, '中等职业学校');
INSERT INTO public.schooltype (id, name) VALUES (6, '大专');
INSERT INTO public.schooltype (id, name) VALUES (7, '大学');
