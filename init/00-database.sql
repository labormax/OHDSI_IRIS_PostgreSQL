CREATE DATABASE omop;

\connect omop;


CREATE ROLE ohdsi_admin_group
  CREATEDB REPLICATION
   VALID UNTIL 'infinity';
COMMENT ON ROLE ohdsi_admin_group
  IS 'Administration group for OHDSI applications';

CREATE ROLE ohdsi_admin LOGIN PASSWORD 't8tia4XEFmBsN9MVJpwcE5iQT2g59DUt'
   VALID UNTIL 'infinity';
GRANT ohdsi_admin_group TO ohdsi_admin;
COMMENT ON ROLE ohdsi_admin
  IS 'Admin user account for OHDSI applications';

CREATE DATABASE "OHDSI"
  WITH ENCODING='UTF8'
       OWNER=ohdsi_admin_group
       CONNECTION LIMIT=-1;
COMMENT ON DATABASE "OHDSI"
  IS 'OHDSI database';
GRANT ALL ON DATABASE "OHDSI" TO GROUP ohdsi_admin_group;

CREATE SCHEMA webapi
       AUTHORIZATION ohdsi_admin_group;
COMMENT ON SCHEMA webapi
  IS 'Schema containing tables to support WebAPI functionality';
GRANT USAGE ON SCHEMA webapi TO PUBLIC;
GRANT ALL ON SCHEMA webapi TO GROUP ohdsi_admin_group;
