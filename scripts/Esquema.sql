conn /as sysdba;
DROP TABLESPACE Dietic including contents and datafiles;
DROP USER admin_dietic cascade;

CREATE TABLESPACE Dietic LOGGING
DATAFILE 'D:\Documents\Oracle\Tablespace\Dietic.dbf' size 50M
extent management local segment space management auto; 

create user admin_dietic profile default 
identified by 123456 
default tablespace Dietic 
temporary tablespace temp 
account unlock; 

--permisos 

grant connect, resource,dba to admin_dietic; 
connect admin_dietic/123456;