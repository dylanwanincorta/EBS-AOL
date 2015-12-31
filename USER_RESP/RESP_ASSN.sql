select count(*) from fnd_user_resp_groups;
desc fnd_user_resp_groups
-- This is a view now
select * From all_objects where object_name = upper('fnd_user_resp_groups');

select * from all_views where view_name = 'FND_USER_RESP_GROUPS';

select U.user_id user_id 
, wur.role_orig_system_id RESPONSIBILITY_ID 
,	FA.application_id  RESPONSIBILITY_APPLICATION_ID 
,	FSG.security_group_id SECURITY_GROUP_ID 
,	fnd_date.canonical_to_date ( '1000/01/01' ) START_DATE 
, to_date ( NULL ) END_DATE 
,	to_char ( NULL ) DESCRIPTION 
, to_number ( NULL ) CREATED_BY 
,	to_date ( NULL ) CREATION_DATE 
, to_number ( NULL )	LAST_UPDATED_BY 
, to_date ( NULL ) LAST_UPDATE_DATE 
, to_number ( NULL ) LAST_UPDATE_LOGIN
from  fnd_user u 
,     wf_user_role_assignments_v wura 
,     wf_user_roles wur
,     fnd_application FA
,     fnd_security_groups FSG
where wura.user_name = u.user_name
   and wur.role_orig_system = 'FND_RESP'
   and wur.partition_id = 2
   and wura.role_name = wur.role_name
   and wura.user_name = wur.user_name
 AND FA.application_short_name =/* Val between 1 st and 2 nd separator */
	replace ( substr ( WURA.ROLE_NAME , INSTR ( WURA.ROLE_NAME , '|' , 1 , 1 )+1 
                                    , (   INSTR ( WURA.ROLE_NAME , '|' , 1 , 2 )
		                                    - INSTR ( WURA.ROLE_NAME , '|' , 1 , 1 ) 
                                        -1 
                                      ) 
                    ) , '%col' ,':' )
 AND FSG.security_group_key =/* Val after 3 rd separator */
	replace ( substr ( WURA.ROLE_NAME , INSTR (WURA.ROLE_NAME , '|' , 1 , 3 ) +1 ) , '%col' , ':' )
/



select * from all_views where view_name = upper('wf_user_role_assignments_v');


select
 WURA.USER_NAME,
 WURA.ROLE_NAME,
 WURA.ASSIGNING_ROLE,
 WURA.START_DATE,
 WURA.END_DATE,
 WURA.ROLE_ORIG_SYSTEM_ID,
 decode(WURA.RELATIONSHIP_ID, -1, 'DIRECT', 'INHERITED') RELATIONSHIP_ID,
 WURA.ASSIGNMENT_REASON,
 WURA.CREATION_DATE,
 WURA.CREATED_BY,
 WURA.LAST_UPDATE_DATE,
 WURA.LAST_UPDATED_BY,
 WURA.LAST_UPDATE_LOGIN,
 WURA.PARTITION_ID
 from WF_USER_ROLE_ASSIGNMENTS wura
 where wura.effective_start_date <= ( TRUNC(SYSDATE + 1) - .000011574 ) --This is a not-null column
   and (wura.effective_end_date is NULL or
        wura.effective_end_date > ( TRUNC(SYSDATE) - .000011574 ))
