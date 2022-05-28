create table agespan
(
    id      integer      default nextval('agespan_id_seq'::regclass) not null
        primary key,
    name    varchar(100) default NULL::character varying,
    fromage integer,
    toage   integer
);

alter table agespan
    owner to postgres;

INSERT INTO public.agespan (id, name, fromage, toage) VALUES (1, '小学生', 6, 13);
INSERT INTO public.agespan (id, name, fromage, toage) VALUES (2, '幼儿', 3, 10);
INSERT INTO public.agespan (id, name, fromage, toage) VALUES (3, '成人', 18, 120);
INSERT INTO public.agespan (id, name, fromage, toage) VALUES (4, '小学生及中学生', 6, 18);
