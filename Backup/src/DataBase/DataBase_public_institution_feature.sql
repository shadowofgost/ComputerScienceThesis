create table institution_feature
(
    institution_id integer not null
        constraint institution_feature_ibfk_1
            references institution
            on update cascade on delete cascade
            deferrable initially deferred,
    feature_id     integer not null
        constraint institution_feature_ibfk_2
            references feature
            on update cascade
            deferrable initially deferred,
    primary key (institution_id, feature_id)
);

alter table institution_feature
    owner to postgres;

create index institution_feature_feature_id_idx
    on institution_feature (feature_id);

create index institution_feature_institution_id_idx
    on institution_feature (institution_id);

INSERT INTO public.institution_feature (institution_id, feature_id) VALUES (1, 1);
INSERT INTO public.institution_feature (institution_id, feature_id) VALUES (2, 2);
