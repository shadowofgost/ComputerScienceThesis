create table school_feature
(
    school_id  integer not null
        constraint school_feature_ibfk_1
            references school
            on update cascade on delete cascade
            deferrable initially deferred,
    feature_id integer not null
        references feature
            on update cascade on delete restrict,
    primary key (school_id, feature_id)
);

alter table school_feature
    owner to postgres;

create index school_feature_feature_id_idx
    on school_feature (feature_id);

create index school_feature_school_id_idx
    on school_feature (school_id);

INSERT INTO public.school_feature (school_id, feature_id) VALUES (75, 3);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (76, 3);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (76, 6);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (76, 1);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (77, 3);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (77, 1);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (78, 5);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (79, 6);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (79, 1);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (79, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (79, 4);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (13, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (14, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (16, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (19, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (21, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (22, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (28, 6);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (29, 6);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (29, 3);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (30, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (31, 6);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (31, 3);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (33, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (35, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (36, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (37, 4);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (41, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (42, 4);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (42, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (43, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (44, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (45, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (46, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (47, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (47, 3);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (48, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (49, 4);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (50, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (51, 0);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (57, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (59, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (60, 2);
INSERT INTO public.school_feature (school_id, feature_id) VALUES (61, 3);
