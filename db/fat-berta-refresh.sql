--Clean input table
truncate table INPUT;

--import CSV
begin
    DBMS_CLOUD.COPY_DATA (
        table_name => 'INPUT',
        credential_name => 'DEF_CRED_NAME',
        file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/K6x8IhajWzxdjd7ZgO9kZWeOMkw7N7n1_oQlXGdtDQVLDqdwcYs5S7HImTQge5EG/n/fropgpctldxd/b/hafur/o/library.csv',
        format => json_object('type' value 'csv', 'delimiter' value ',', 'skipheaders' value 1, 'blankasnull' value 'true')
    );
end;
/

-- clean library table
truncate table LIBRARY;

-- insert new stuff from input table 
insert into LIBRARY
select * from INPUT;

commit;
