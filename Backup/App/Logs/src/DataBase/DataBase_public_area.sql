create table area
(
    id   integer      default nextval('area_id_seq'::regclass) not null
        primary key,
    name varchar(100) default NULL::character varying
);

alter table area
    owner to postgres;

INSERT INTO public.area (id, name) VALUES (2, '徐汇区');
INSERT INTO public.area (id, name) VALUES (3, '黄浦区');
INSERT INTO public.area (id, name) VALUES (4, '卢湾区');
INSERT INTO public.area (id, name) VALUES (5, '静安区');
INSERT INTO public.area (id, name) VALUES (6, '长宁区');
INSERT INTO public.area (id, name) VALUES (7, '闵行区');
INSERT INTO public.area (id, name) VALUES (8, '杨浦区');
INSERT INTO public.area (id, name) VALUES (9, '普陀区');
INSERT INTO public.area (id, name) VALUES (10, '虹口区');
INSERT INTO public.area (id, name) VALUES (11, '宝山区');
INSERT INTO public.area (id, name) VALUES (12, '闸北区');
INSERT INTO public.area (id, name) VALUES (13, '松江区');
INSERT INTO public.area (id, name) VALUES (14, '嘉定区');
INSERT INTO public.area (id, name) VALUES (15, '青浦区');
INSERT INTO public.area (id, name) VALUES (16, '奉贤区');
INSERT INTO public.area (id, name) VALUES (17, '金山区');
INSERT INTO public.area (id, name) VALUES (18, '崇明县');
INSERT INTO public.area (id, name) VALUES (1, '浦东新区');
