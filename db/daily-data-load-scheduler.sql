BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => 'DAILY_DATA_LOAD',
            job_type => 'STORED_PROCEDURE',
            job_action => 'ITUNES.DATA_LOAD',
            number_of_arguments => 0,
            start_date => '18-JUN-22 04.00.00 AM Europe/Amsterdam',
            repeat_interval => 'FREQ=DAILY;INTERVAL=1;',
            end_date => NULL,
            enabled => TRUE,
            auto_drop => FALSE,
            comments => '');

    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => 'DAILY_DATA_LOAD', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);

-- enable
DBMS_SCHEDULER.enable(
             name => 'DAILY_DATA_LOAD');
END;