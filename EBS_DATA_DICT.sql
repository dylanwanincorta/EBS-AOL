
select * FROM all_objects where owner = 'APPLSYS' and object_type = 'TABLE' and object_name like 'FND%';

FND_TABLES
FND_COLUMNS
FND_PRIMARY_KEYS
FND_PRIMARY_KEY_COLUMNS
FND_FOREIGN_KEYS
FND_FOREIGN_KEY_COLUMN

FND_COMPILED_ID_FLEXS
FND_COMPILED_ID_FLEX_STRUCTS
FND_COMPILED_DESCRIPTIVE_FLEXS


select * from fnd_tables;
select * From fnd_columns;
desc FND_PRIMARY_KEYS
desc FND_PRIMARY_KEY_COLUMNS


select distinct pk.enabled_flag from FND_PRIMARY_KEYS PK;
select distinct primary_key_type from FND_PRIMARY_KEYS PK;

desc FND_FOREIGN_KEYS
desc FND_FOREIGN_KEY_COLUMNS
