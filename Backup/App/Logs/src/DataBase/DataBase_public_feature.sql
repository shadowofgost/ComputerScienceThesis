create table feature
(
    id   integer      default nextval('feature_id_seq'::regclass) not null
        primary key,
    name varchar(100) default NULL::character varying
);

alter table feature
    owner to postgres;

INSERT INTO public.feature (id, name) VALUES (0, '');
INSERT INTO public.feature (id, name) VALUES (1, '艺术（声乐、乐器、绘画、舞蹈）');
INSERT INTO public.feature (id, name) VALUES (2, '语言（英语、小语种）');
INSERT INTO public.feature (id, name) VALUES (3, '体育');
INSERT INTO public.feature (id, name) VALUES (4, '课外辅导（语文、奥数）');
INSERT INTO public.feature (id, name) VALUES (5, '思维逻辑');
INSERT INTO public.feature (id, name) VALUES (6, '国学（书法、国画、围棋、蒙学）');
