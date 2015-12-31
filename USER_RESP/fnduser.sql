select * FRom fnd_user where rownum < 10;

-- This is wrong
select CUSTOMER_ID from FND_USER where CUSTOMER_ID is not null
minus
select CUST_ACCOUNT_ROLE_ID from HZ_CUST_ACCOUNT_ROLES;

-- THis is correct
select CUSTOMER_ID from FND_USER where CUSTOMER_ID is not null
minus
select party_id from hz_parties;


select party_type, count(*) from hz_parties where party_id in 
(Select CUSTOMER_ID from FND_USER where CUSTOMER_ID is not null)
group by party_type
/

Select count(*) from FND_USER where CUSTOMER_ID is not null and customer_id not in
(select PARTY_ID from HZ_CUST_ACCOUNT_ROLES)
/

select party_type, count(*) from hz_parties where party_id in 
(Select CUSTOMER_ID from FND_USER where CUSTOMER_ID is not null and customer_id in
(select PARTY_ID from HZ_CUST_ACCOUNT_ROLES))
group by party_type
/
/*
PARTY_TYPE                       COUNT(*)
------------------------------ ----------
PERSON                                226 
PARTY_RELATIONSHIP                    142 
*/


desc HZ_CUST_ACCOUNT_ROLES

-- This is correct
select PERSON_PARTY_ID from FND_USER where PERSON_PARTY_ID is not null
minus
select PARTY_ID from HZ_PARTIES where PARTY_TYPE = 'PERSON'
/

-- This is correct
select employee_id from FND_USER where employee_id is not null
minus 
select PERSON_ID from PER_ALL_PEOPLE_F
/
-- this is correct
-- very few records as it is not used
select supplier_id from FND_USER where supplier_id is not null
minus
select VENDOR_CONTACT_ID from AP_SUPPLIER_CONTACTS;

desc AP_SUPPLIER_CONTACTS