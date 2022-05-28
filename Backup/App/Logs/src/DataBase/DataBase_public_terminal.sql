create table terminal
(
    id         integer      default nextval('terminal_id_seq'::regclass) not null
        primary key,
    account_id integer
        constraint terminal_ibfk_1
            references account
            on update cascade on delete cascade
            deferrable initially deferred,
    type       integer,
    code       varchar(510) default NULL::character varying
);

alter table terminal
    owner to postgres;

create index terminal_account_id_idx
    on terminal (account_id);

