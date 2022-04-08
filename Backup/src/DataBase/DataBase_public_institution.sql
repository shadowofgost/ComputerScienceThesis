create table institution
(
    id          integer      default nextval('institution_id_seq'::regclass) not null
        primary key,
    name        varchar(200) default NULL::character varying,
    area_id     integer
        constraint institution_ibfk_3
            references area
            on update cascade
            deferrable initially deferred,
    agespan_id  integer
        constraint institution_ibfk_4
            references agespan
            on update cascade
            deferrable initially deferred,
    address     varchar(200) default NULL::character varying,
    location    varchar(200) default NULL::character varying,
    website     varchar(200) default NULL::character varying,
    telephone   varchar(200) default NULL::character varying,
    feedesc     varchar(200) default NULL::character varying,
    feetype_id  integer
        constraint institution_ibfk_2
            references feetype
            on update cascade
            deferrable initially deferred,
    longitude   real,
    latitude    real,
    featuredesc varchar(400) default NULL::character varying,
    feature_id  integer
        constraint institution_ibfk_5
            references feature
            on update cascade
            deferrable initially deferred,
    timeopen    timestamp,
    timeclose   timestamp
);

alter table institution
    owner to postgres;

create index institution_agespan_id_idx
    on institution (agespan_id);

create index institution_area_id_idx
    on institution (area_id);

create index institution_feature_id_idx
    on institution (feature_id);

create index institution_feetype_id_idx
    on institution (feetype_id);

INSERT INTO public.institution (id, name, area_id, agespan_id, address, location, website, telephone, feedesc, feetype_id, longitude, latitude, featuredesc, feature_id, timeopen, timeclose) VALUES (1, '韦博国际英语', 2, 3, '衡山路922号建汇大厦33层', '徐家汇中心', 'http://www.webi.com.cn', '400-720-9090', '每小时2元', 1, null, null, '（实用英语、职场英语、雅思、托福、SAT等等）', 0, '1999-01-01 08:00:00.000000', '1999-01-01 22:00:00.000000');
INSERT INTO public.institution (id, name, area_id, agespan_id, address, location, website, telephone, feedesc, feetype_id, longitude, latitude, featuredesc, feature_id, timeopen, timeclose) VALUES (2, '东书房', 5, 1, '张杨路500号华润时代广场6楼（靠近浦东南路，八佰伴对面）', '华润中心', 'http://www.dongshufang.cn/', '400-870-2227', '1、按级别收费，每个级别6个月；2、按时间收费，不限级别；', 2, null, null, '（古筝、围棋、书法、国画）', 0, '1999-01-01 08:00:00.000000', null);
