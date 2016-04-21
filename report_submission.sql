SELECT fcr.request_id, fcr.request_date
, fcr.program_application_id, fav.application_short_name,fav.application_name
, fcr.concurrent_program_id, fcpv.concurrent_program_name
, fcpv.user_concurrent_program_name
, fcr.responsibility_application_id, fcr.responsibility_id, frv.responsibility_name
, fcr.parent_request_id, fcr.actual_start_date, fcr.actual_completion_date, fcr.cpu_seconds
, fcr.request_type, org_id
, fcr.resubmit_interval, fcr.resubmit_interval_unit_code
FROM fnd_concurrent_requests fcr
INNER JOIN fnd_concurrent_programs_vl fcpv ON fcpv.concurrent_program_id = fcr.concurrent_program_id
                AND  fcpv.application_id = fcr.program_application_id
INNER JOIN fnd_application_vl fav ON fav.application_id = fcr.program_application_id
INNER JOIN fnd_responsibility_vl frv ON frv.responsibility_id = fcr.responsibility_id
                AND frv.application_id = fcr.responsibility_application_id
WHERE fcpv.srs_flag ='Y'
