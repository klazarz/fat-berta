CREATE OR REPLACE PROCEDURE DATA_LOAD authid current_user
IS 

BEGIN

BEGIN
execute immediate 'truncate table INPUT';
END;

BEGIN
    DBMS_CLOUD.COPY_DATA (
        table_name => 'INPUT',
        credential_name => 'DEF_CRED_NAME',
        file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/pob365OlfcV5FaM5MsyREZgq6d5r5Z9rOlXqdwdY3Vs8cYwZHKvmzd0gxTjBgoEQ/n/fropgpctldxd/b/hafur/o/library.csv',
        format => json_object('type' value 'csv', 'delimiter' value ',', 'skipheaders' value 1, 'blankasnull' value 'true')
    );
END;


BEGIN
execute immediate 'truncate table LIBRARY';

insert into LIBRARY
select * from INPUT;

END;

commit;

END DATA_LOAD;
/

