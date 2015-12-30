select  pt.table_name
,fk.foreign_key_name
, fkc.FOREIGN_KEY_SEQUENCE
,ft.table_name F_TABLE
,fc.column_name F_COLUMN
from    FND_FOREIGN_KEYS fk
inner join FND_FOREIGN_KEY_COLUMNS  fkc
on fk.FOREIGN_KEY_ID = fkc.FOREIGN_KEY_ID
inner join fnd_tables pT
on fk.PRIMARY_KEY_TABLE_ID  = pt.table_ID
inner join fnd_tables FT
on FT.table_id = fkc.table_id
inner join fnd_columns FC
on fc.column_id = fkc.column_id
where pt.table_name= 'HZ_CUST_ACCOUNTS'
order by 1, 2, 3
/