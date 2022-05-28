create table account
(
    id             integer      default nextval('account_id_seq'::regclass) not null
        primary key,
    username       varchar(100) default NULL::character varying,
    password       varchar(510) default NULL::character varying,
    name           varchar(40)  default NULL::character varying,
    telephone      varchar(100) default NULL::character varying,
    role           integer      default 0,
    flag_telephone integer,
    checkcode      varchar(50),
    source         varchar(20),
    dtcreate       timestamp
);

comment on column account.role is 'COMMENT ''0:normal, 1: admin''';

alter table account
    owner to postgres;

