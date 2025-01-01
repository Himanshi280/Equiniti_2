alert_policy_mssql = "MSSQL_New_Monitors_Policy"

incident_preference_mssql = "PER_CONDITION_AND_TARGET"

nrql_alert_condition_details_mssql = {
  "0" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "Average wait time"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample  SELECT uniqueCount(AverageWaitTimeMs) WHERE label.query='avgwait'  AND AverageWaitTimeMs >250 FACET wait_type, instance,hostname,AverageWaitTimeMs"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "1" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "vlf count"
    description                   = ""
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM MssqlCustomQuerySample  SELECT uniqueCount(vlf_count) WHERE label.query='virfile' WHERE vlf_count IS NOT NULL AND vlf_count >100  FACET vlf_count,instance,hostname,name"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
  },
  "2" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "vlf count"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample  SELECT uniqueCount(vlf_count) WHERE label.query='virfile' WHERE vlf_count IS NOT NULL AND vlf_count >1000  FACET vlf_count,instance,hostname,name"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "3" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "Availability Database Backup Status"
    description                   = ""
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM MssqlCustomQuerySample SELECT uniqueCount(HoursSinceLastBackup) WHERE label.query='avbackup' WHERE HoursSinceLastBackup >=24 AND HoursSinceLastBackup <=36   FACET instance,HoursSinceLastBackup,hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
  },
  "4" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "Availability Database Backup Status"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample SELECT uniqueCount(HoursSinceLastBackup) WHERE label.query='avbackup' WHERE HoursSinceLastBackup>36  FACET instance,HoursSinceLastBackup,hostname"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "5" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "Log Backup Status"
    description                   = ""
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM MssqlCustomQuerySample SELECT uniqueCount(LogBackupStatus) WHERE LogBackupStatus LIKE '%Log Backup Outdated%'  FACET LogBackupStatus,instance,hostname,DatabaseName"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
  },
  "6" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "Log Backup Status"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample SELECT uniqueCount(LogBackupStatus) WHERE LogBackupStatus LIKE '%No Log Backup%' FACET LogBackupStatus,instance,hostname,DatabaseName "
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "7" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "Blocking Session ID"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample SELECT uniqueCount(BlockingSessionID) WHERE label.query='blocked' AND BlockingSessionID!=0 FACET instance,hostname,wait_resource,BlockingSessionID"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "8" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "Database Status"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample SELECT  uniquecount(DatabaseStatus) WHERE label.query='dbstate'  WHERE DatabaseStatus!='ONLINE' FACET DatabaseName,instance,DatabaseStatus"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "9" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "AG Health Policy"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample SELECT  uniqueCount(SynchronizationHealth) WHERE label.query='grouphealth' AND SynchronizationHealth!='HEALTHY' FACET AvailabilityGroupName,ReplicaServerName,SynchronizationHealth,instance"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "10" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "AG Replica Health"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample  SELECT  uniqueCount(SynchronizationHealth) WHERE label.query='replica' WHERE SynchronizationHealth!='HEALTHY' FACET SynchronizationHealth,instance,hostname"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "11" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "AG Online Monitor"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample  SELECT uniqueCount(DatabaseState) WHERE label.query='agonline' WHERE DatabaseState!='ONLINE' FACET instance,hostname,DatabaseState"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
  "12" = {
    type                            = "static"
    account_id                      = 4411834
    name                            = "AG Automatic Failover Monitor"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample  SELECT uniqueCount(instance)WHERE label.query='agafc'  AND FailoverMode!='AUTOMATIC' AND AvailabilityMode !='SYNCHRONOUS_COMMIT'   FACET  instance, hostname,AvailabilityMode,FailoverMode"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    critical_threshold_occurrences = "all"
  },
}  

//
alert_policy_mssql_rules = "MSSQL_Rules_Monitors_Policy"

incident_preference_mssql_rules = "PER_CONDITION_AND_TARGET"

nrql_alert_condition_details_mssql_rules = {

  # "" = {
  #   type                          = "static"
  #   account_id                    = 4411834
  #   name                          = ""
  #   description                   = ""
  #   runbook_url                   = "https://www.example.com"
  #   enabled                       = false
  #   violation_time_limit_seconds  = 3600
  #   aggregation_window            = 300
  #   aggregation_method            = "event_flow"
  #   aggregation_delay             = 120
  #   baseline_direction            = "upper_only"
  #   query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID= AND  message LIKE '%error%'FACEThostname"
  #   warning                       = true
  #   critical                      = false
  #   warning_operator              = "above_or_equals"
  #   warning_threshold             = 1
  #   warning_threshold_duration    = 300
  #   warning_threshold_occurrences = "all"
  # },
"0" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: The agent is suspect. No response within last minutes"
    description                   = "This behavior occurs because the replication agent is too busy to respond when SQL Server Enterprise Manager polls the replication agent; therefore, SQL Server Enterprise Manager does not know the status of the replication agent and it cannot report whether the replication agent is functioning or not."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=20554 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"1" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred in a SQL Server Service Broker/Database Mirroring transport connection endpoint"
    description                   = "SQL Server uses Service Broker and Database Mirroring endpoints for communications outside the SQL Server instance."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9642 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"2" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred in the Service Broker manager"
    description                   = "The rule triggers an alert when an error occurs in the SQL Server Service Broker manager."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9645 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"3" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred in the Service Broker queue rollback handler"
    description                   = "SQL Server Service Broker raises MSSQLSERVER event ID 8405 when an error prevents Service Broker from disabling a queue during a rollback."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8405 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"4" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred in the SQL Server Service Broker message dispatcher"
    description                   = "An error occurred in the SQL Server Service Broker message dispatcher. The Windows application log or SQL Server error log may identify the specific error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9644 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"5" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred in the SQL Server Service Broker message transmitter"
    description                   = "SQL Server Service Broker message transmitter detected an error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=28072 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"6" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred in the SQL Server Service Broker or Database Mirroring transport manager"
    description                   = "An error occurred in the SQL Server Service Broker or Database Mirroring transport manager. The Windows application log or SQL Server error log may identify the specific error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9643 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"7" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred in the timer event cache"
    description                   = "An error occurred in the SQL Server Service Broker transport layer timer event cache. The Windows application log or SQL Server error log may identify the specific error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9646 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"8" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred while processing SQL Server Service Broker mirroring routes"
    description                   = "The rule triggers an alert when an error occurs while processing SQL Server Service Broker mirroring routes."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9789 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"9" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An error occurred while reading the log for database"
    description                   = "This error indicates a failure while processing the transaction log during rollback, recovery, or replication."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9004 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"10" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: An SQL Server Service Broker dialog detected an error"
    description                   = "The rule triggers an alert when a SQL Server Service Broker dialog detects an error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9736 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"11" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: AppDomain failed to unload with error code"
    description                   = "The rule is triggered when an application domain fails to unload because of some error. The Windows application log may contain information about the original error code and other diagnostic details."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6291 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"12" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: A security (SSPI) error occurred when connecting to another Service Broker or Database Mirroring host"
    description                   = "When Service Broker transport security uses SSPI, the service account for the remote database must have the CONNECT permission in the master database. The remote SQL Server instance should allow Windows Authentication for the account being used by the remote host. There are no requirements for the login to have other permissions or to own objects in any database."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9649 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"13" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: A SQL Server Service Broker conversation has been closed due to an error"
    description                   = "The rule triggers an alert when a SQL Server Service Broker conversation has been closed due to an error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9761 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"14" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: SQL Server Service Broker cryptographic operation failed"
    description                   = "The rule triggers an alert when the SQL Server Service Broker cryptographic operation fails."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9641 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"15" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Attempt to fetch logical page that belongs to different object"
    description                   = "This error occurs when SQL Server detects that the allocation unit as stored on a database page does not match the allocation unit associated with a specific operation, such as running a SELECT statement against a table."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=605 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"16" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not use Address Windowing Extensions because 'lock pages in memory' privilege was not granted"
    description                   = "The rule triggers an alert when SQL Server cannot use Address Windowing Extensions because the 'lock pages in memory' privilege was not granted."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=17179 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"17" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Backup device failed - Operating system error"
    description                   = "This message indicates that the operating system was unable to open or close a backup device (disk, tape, or pipe) specified as part of a BACKUP or RESTORE command. For more information on backup devices, refer to the Docs Online topics, 'Backup Devices' and 'BACKUP.'"
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=18204 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"18" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Database log file is full. Back up the transaction log for the database to free up some log space"
    description                   = "The specified transaction log file has run out of free space."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9002 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"19" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not open tempdb. Cannot continue"
    description                   = "The tempdb database could not be opened."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=1619 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"20" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Cannot create file"
    description                   = "SQL Server cannot create a file because the file already exists."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=5123 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"21" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Cannot start service broker activation manager"
    description                   = "The rule triggers an alert when service broker fails to start the activation manager."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9701 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"22" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Cannot start service broker manager"
    description                   = "The rule triggers an alert when SQL Server cannot start the service broker manager."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9694 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"23" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Cannot start service broker manager due to operating system error"
    description                   = "The rule triggers an alert when SQL Server cannot start the service broker manager due to the operating system error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=28002 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"24" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Cannot start service broker security manager"
    description                   = "Service Broker security manager could not start."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9698 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"25" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Cannot start SQL Server Service Broker on a database"
    description                   = "The rule triggers an alert when SQL Server cannot start Service Broker on a database."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9697 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"26" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: CHECKTABLE terminated. A failure was detected while collecting facts."
    description                   = "Possibly tempdb out of space or a system table is inconsistent. Check previous errors."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8921 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"27" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Checksum failure while page in cache"
    description                   = "It is detected that a database page has been unexpectedly modified while in cache (by verifying the page checksum)."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=832 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"28" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: XML: FOR XML EXPLICIT stack overflow occurred."
    description                   = "The XML is not well-formed because the element tag nesting level has exceeded the number of columns in the table, one or more tags is self-referencing, or both. For more information about FOR XML EXPLICIT, see 'Using EXPLICIT Mode' in Docs Online."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6805 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"29" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Common Language Runtime (CLR) not installed properly"
    description                   = "This installation of the Common Language Runtime (CLR) is corrupted. The CLR is installed with the Microsoft .NET Framework."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6510 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"30" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Conflict table does not exist"
    description                   = "This error occurs when you try to add or drop a column to a merge article, but the conflict table specified in sysmergearticles for the modified article does not actually exist in the database."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=21286 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"31" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: CREATE DATABASE failed. Could not allocate enough disk space for a new database on the named disks"
    description                   = "This error occurs when there is not enough space on the device to create the model database."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=1803 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"32" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not allocate space for object in database because the Filegroup is full"
    description                   = "The specified Filegroup has run out of free space."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=1105 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"33" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not create AppDomain manager"
    description                   = "The rule triggers an alert when SQL Server fails to create an application domain manager."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=10303 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"34" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to open primary database file"
    description                   = "An operating system error occurred when opening the primary file of a database. The error message contains the specific operating system error encountered."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=17204 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"35" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not open error log file"
    description                   = "When installing Microsoft SQL Server on an NTFS partition, make sure that the NTFS file permissions allow read/write access. Otherwise, this error message may appear in the Microsoft Windows NT application log."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=17058 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"36" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Invalid reference to File ID"
    description                   = "This error occurs when SQL Server uses an invalid file ID while performing some operation. This error can occur for several different scenarios."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=5180 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"37" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not read and latch page"
    description                   = "The page read failed for some reason, or a latch could not be taken."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8966 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"38" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not recover database due to unresolved transaction outcomes"
    description                   = "The recovery process found pending transactions for the specified database. These transactions were either distributed transactions that used Microsoft Distributed Transaction Coordinator (MS DTC), or the transactions were single instance cross-database transactions."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3431 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"39" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not write a CHECKPOINT record in database because the log is out of space"
    description                   = "The transaction log for the specified database has reached its capacity."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3619 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"40" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: CREATE FILE encountered operating system error"
    description                   = "CREATE FILE encountered operating system error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=5123 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"41" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failure occurred during database recovery"
    description                   = "This error occurs when SQL Server fails to recover a database successfully when it is brought online."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3414 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"42" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Database consistency errors found"
    description                   = "This message indicates a database consistency check has encountered errors and none or not all of the errors were repaired."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID =8957 AND  message LIKE '%error% ' AND  message LIKE '%Database consistency errors found and repaired%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"43" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Database consistency errors found and repaired"
    description                   = "This message indicates a database consistency check has encountered errors and all of the errors were repaired."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID =8957 AND  message LIKE '%error% ' AND  message LIKE '%Database consistency errors found%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"44" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not mark database as suspect. Getnext NC scan on sysdatabases.dbid failed"
    description                   = "The SQL Server recovery process tried to turn on the suspect flag for the specified database, but it could not find the appropriate row in sysdatabases or could not update the database information in memory."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3413 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"45" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Descriptor for object in database not found in the hash table during attempt to unhash it"
    description                   = "A temporary table could not be found. The specific object ID will be available in the Windows application log as event ID 617."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=617 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"46" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: XML: Failed to load Msxml2.dll"
    description                   = "The Msxml2.dll file is missing from the computer where SQL Server is installed, or it could not be loaded from the system directory while processing an XML feature such as sp_xml_preparedocument."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6610 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"47" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: XML: Failed to instantiate class. Make sure Msxml2.dll exists in the SQL Server installation"
    description                   = "The Msxml2.dll file is missing from the computer where SQL Server is installed, or it could not be loaded from the system directory while processing an XML feature such as sp_xml_preparedocument."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6608 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"48" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Cannot recover the master database. Exiting."
    description                   = "The master database is not in a recoverable state."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3417 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"49" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to add column to table"
    description                   = "sp_repladdcolumn failed to add the specified column to the table in the publication database. If another error is reported along with this one, the other error should indicate the reason the column could not be added."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=21285 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"50" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to allocate memory for Common Language Runtime (CLR)"
    description                   = "The rule triggers an alert when SQL Server is unable to allocate memory for CLR."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6289 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"51" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to create AppDomain"
    description                   = "The rule triggers an alert when an application tried to create an application domain, but failed. This may be caused when there is not enough memory to start the application domain."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6517 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"52" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to drop column from table"
    description                   = "sp_repldropcolumn failed to drop the specified column on the publication database. The error could result from a failed system table update or from a failure of the underlying ALTER TABLE statement."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=21284 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"53" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to initialize the Common Language Runtime (CLR) due to memory pressure"
    description                   = "Windows could not allocate memory for the Microsoft Common Language Runtime (CLR) to initialize."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6513 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"54" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to initialize the Common Language Runtime (CLR) with HRESULT (6511)"
    description                   = "The rule triggers an alert when an assembly or application fails to start and logs an HRESULT error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6511 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"55" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to initialize the Common Language Runtime (CLR) with HRESULT (6512)"
    description                   = "The rule triggers an alert when an assembly or an application fails to start and logs an HRESULT error. The Windows application log may contain an information about specific HRESULT."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6512 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"56" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Full Text Search: Full-text catalog lacks sufficient disk space to complete this operation"
    description                   = "There is not enough disk space to hold the full-text catalog."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=7622 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"57" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Full Text Search: Search on full-text catalog failed with unknown result"
    description                   = "The full-text query failed for an unspecified reason."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=7607 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"58" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Internal Query Processor Error: The query processor encountered an unexpected error during execution"
    description                   = "This is an internal query processor error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8630 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"59" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Internal Query Processor Error: The query processor encountered an unexpected error during the processing of a remote query phase"
    description                   = "This is an internal query processor error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8680 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"60" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Internal Query Processor Error: The query processor ran out of stack space during query optimization"
    description                   = "The Query Processor is using a large but limited memory stack when optimizing queries. In some extreme situations the stack size may become a limit for a given very large query."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8621 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"61" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Invalid reference to LOB page"
    description                   = "This error occurs when SQL Server uses an invalid reference to a LOB page in an operation. This error may occur due to several different reasons."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=7105 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"62" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Logical consistency error after performing I/O on page"
    description                   = "A consistency check failed when reading or writing a database page or transaction log block. The error message contains the specific type of consistency check that failed."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=824 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"63" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Cannot open user default database. Login failed"
    description                   = "When a client connects to a SQL Server instance without specifying a database context, the default database defined for its login is used. If that database is unavailable for any reason, the above message appears."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=4064 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"64" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: A fatal error occurred in .NET Framework runtime"
    description                   = "The rule triggers an alert when the .NET Framework shuts down due to an error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6536 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"65" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: .NET Framework runtime was shut down by user code"
    description                   = "The rule triggers an alert when a user defined type, user defined-function, or user-defined property in an assembly contains faulty code."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6537 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"66" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: No slots are free to keep buffers for table"
    description                   = "This is raised when SQL Server has an internal error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=654 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"67" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: One or more indexes are damaged and must be repaired or dropped"
    description                   = "This error provides more details about the problem described in error 8952. See that error for an explanation."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8956 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"68" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to open database or transaction log file"
    description                   = "An operating system error occurred when opening a transaction log file or a secondary database file of a database. The error message contains the specific operating system error encountered."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=17207 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"69" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Operating system error on a device"
    description                   = "The backup device cannot be opened."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=17218 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"70" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: OS Error occurred while performing I/O on page"
    description                   = "An operating system error occurred when reading or writing a database page. The error message contains the specific operating system error encountered."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=823 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"71" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: Cross object linkage. Page PGID->next is not in the same index"
    description                   = "Page P_ID is linked to page P_ID2 but the two pages are allocated to different indexes and/or objects."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8982 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"72" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Potential deadlocks exist on all schedulers on Node"
    description                   = "This message is raised when the server fails to respond to new queries within a certain time limit."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=17884 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"73" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Service Broker was not able to allocate memory for cryptographic operations"
    description                   = "The rule triggers an alert when SQL Server Service Broker is not able to allocate memory for cryptographic operations."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9634 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"74" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Failed to restore master database. Shutting down SQL Server"
    description                   = "The backup of the master database that you are restoring is not usable. The file itself may have been corrupted, or the original master database from which the backup was taken may have data integrity problems."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3151 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"75" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: Object, index, page Test failed. Slot - Offset is invalid"
    description                   = "The slot specified has an invalid offset (ADDRESS) in the page, according to the slot array."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8941 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"76" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Could not allocate new page for database. There are no more pages available in Filegroup"
    description                   = "Space can be created by dropping objects, adding additional files, or allowing file growth."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=1101 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"77" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: SQL Server cannot start the Service Broker event handler"
    description                   = "SQL Server Service Broker cannot start the Service Broker event handler."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9696 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"78" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: SQL Server could not allocate enough memory to start Service Broker task manager"
    description                   = "SQL Server Service Broker cannot start the Service Broker task manager."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9695 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"79" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: SQL Server Out Of Memory"
    description                   = "SQL Server has failed to allocate the sufficient amount of memory to run the query."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=701 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"80" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: SQL Server Service Broker cannot use RC4 encryption algorithm when running in FIPS compliance mode"
    description                   = "SQL Server Service Broker has a conversation where at least one endpoint has been configured to use RC4 encryption and the server is set for Federal Information Processing Standard (FIPS) compliance mode. RC4 encryption is not supported when running in FIPS compliance mode."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=28078 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"81" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: SQL Server Service Broker could not query the FIPS compliance mode flag from the registry"
    description                   = "SQL Server Service Broker could not query the FIPS compliance mode flag from the registry."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=28076 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"82" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: SQL Server Service Broker or Database Mirror cryptographic call failed"
    description                   = "SQL Server Service Broker or Database Mirror attempted to call an operating system cryptographic function. The cryptographic function returned an error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9650 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"83" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: SQL Server Service Broker attempted to use an unsupported encryption algorithm"
    description                   = "SQL Server Service Broker tries to use an unsupported encryption algorithm."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=28060 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"84" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: Allocation page has invalid page header values."
    description                   = "The page specified has an invalid page header."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8946 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"85" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: B-tree chain linkage mismatch."
    description                   = "There is a break in the logical page chain at some level in the B-tree specified."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8936 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"86" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: B-tree level mismatch, page does not match level from parent"
    description                   = "There are two pages linked as parent (P_ID2) and child (P_ID1) in a B-tree. The level (LEVEL1) in the child page (P_ID1) does not comply with the level rules for B-trees, given the level (LEVEL2) in the parent page (P_ID2)."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8931 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"87" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: B-tree page has two parent nodes"
    description                   = "The B-tree structure is corrupt because page P_ID1 is referenced as a child page by slots in two pages higher in the B-tree, P_ID2 and P_ID3. A page can only be referenced by a single parent."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8937 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"88" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: cross-object chain linkage"
    description                   = "The first phase of a DBCC CHECKDB is to do primitive checks on the data pages of critical system tables. If any errors are found, they cannot be repaired and so the DBCC CHECKDB terminates immediately."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8930 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"89" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: Cross object linkage"
    description                   = "The page P_ID1 points, in a parent-child manner, to a page (P_ID2) in a different object."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8925 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"90" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: Cross object linkage: Parent page in object next refer to page not in the same object"
    description                   = "The next page pointer of page P_ID2 and a child page pointer of page P_ID1 in a B-tree of the specified object points to a page (P_ID3) in a different object. Furthermore, pages P_ID1 and P_ID2 may themselves be in different objects."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8926 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"91" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: IAM chain linkage error"
    description                   = "There is a break in the IAM chain for the index specified. A page P_ID2 is pointed to by the next page pointer of page P_ID1, but page P_ID2's previous page pointer points to a different page, P_ID3. Both error states mean the same, and only differ in where the corruption was discovered."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8969 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"92" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: The text, ntext, or image node has wrong type"
    description                   = "The text node is on the wrong text page type. If the parent (owner) of the node can be found, there will be an accompanying 8929 message providing details about the owner."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8963 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"93" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table error: Unexpected page type"
    description                   = "Page P_ID had a page type that was unexpected by the code trying to interpret it. The page is marked allocated, however, which is why the DBCC code is trying to interpret it."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8938 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"94" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Table: No columns without statistics found"
    description                   = "There are no eligible columns in the current database on which to create statistics using sp_createstats. Computed columns and columns of the ntext, text, or image data types cannot be specified as statistics columns. Columns already having statistics are not touched (for example, the first column of an index or a column with explicitly created statistics)."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=15013 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"95" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: The MSSQLServer service terminated unexpectedly"
    description                   = "The error is reported by the SQL Server Agent service when it auto restarts SQL Server. SQL Server Agent will only auto restart SQL Server if SQL Server stopped for some reason other than an explicit stop command from a user or application, and if the 'Auto restart SQL Server if it stops unexpectedly' option is selected in SQL Server Agent Advanced properties. During the restart of SQL Server, SQL Server Agent will write this message to the application event log on the computer hosting SQL Server."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=14265 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"96" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: The provider reported an unexpected catastrophic failure"
    description                   = "The provider reported an unexpected catastrophic failure."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=10001 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"97" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: The server is too busy to perform the backup or restore operation"
    description                   = "Failed to start a sub-process (a parallel query or parallel I/O) because no threads are available or too many sub-processes executing."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3627 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"98" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: The Service Broker/Database Mirroring transport cannot listen on port because it is in use"
    description                   = "When you create a Service Broker or Database Mirroring endpoint, SQL Server should be able to accept TCP/IP connections on the port that is specified in the endpoint configuration. The transport security requires authorization for connections to the port. If the server has a firewall enabled, the firewall configuration must allow both incoming and outgoing connections for the port that is used by the endpoint."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9692 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"99" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: The Service Broker/Database Mirroring Transport could not listen for connections due to an error"
    description                   = "The rule triggers an alert when Service Broker cannot listen on the specified port."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=9693 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"100" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Login failed. The workstation licensing limit for SQL Server access has already been reached"
    description                   = "SQL Server will not provide connections to workstations after the licensing limit has been reached."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=18459 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"101" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Indexed view does not contain all rows that the view definition produces."
    description                   = "Refer to Docs Online for more information on this error. This does not necessarily represent an integrity issue with the data in this database."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8908 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"102" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Unable to open the physical file"
    description                   = "SQL Server has failed to open the physical file."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=5120 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"103" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Unique table computation failed"
    description                   = "Unique tables are used by the database client drivers, like Microsoft Access driver for SQL Server, to build updateable queries. For a given SELECT statement, the unique table identifies the table whose row values appear at most once in the result set. This error is raised when the server is unable to compute the unique table."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=16959 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"104" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Full Text Search: Full-Text Search is not enabled for the current database"
    description                   = "You have attempted to perform a full-text indexing in a database that is not enabled for full-text indexing. The database may have never been enabled for full-text, or it may have been restored or attached, which will automatically disable full-text indexing."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=15601 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"105" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: XML: Size of data chunk requested from the stream exceeds allowed limit"
    description                   = "SQL Server received an XML document that exceeds the allowed limit."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6627 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"106" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: XML: XML parsing error"
    description                   = "This message passes through XML parsing errors. The text after 'XML parsing error:' will vary. The cause will depend on the exact XML parsing error passed through."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=6603 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"107" = { 
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Monitoring error"
    description                   = "The rule traces monitoring workflows errors and generates error alerts."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=4221 AND message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"108" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Log Backup Failed to Complete"
    description                   = "This error indicates that SQL Server could not complete the BACKUP of the specified database due to a previous error. The BACKUP command that failed is given at the end of the error message. This message also appears in the Windows application log."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3041 AND  message LIKE '%error%' AND  message LIKE '%Log Backup Failed to Complete%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"109" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Database Backup Failed To Complete"
    description                   = "BACKUP failed to complete the command."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=3041 AND  message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"110" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Internal Query Processor Error: The query processor encountered an internal limit overflow"
    description                   = "This is an internal query processor error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8620 AND  message LIKE '%error%' FACET hostname"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

"111" = {
    type                          = "static"
    account_id                    = 4411834
    name                          = "MSSQL on Windows: Internal Query Processor Error: The query processor encountered an internal limit overflow"
    description                   = "This is an internal query processor error."
    runbook_url                   = "https://www.example.com"
    enabled                       = false
    violation_time_limit_seconds  = 3600
    aggregation_window            = 300
    aggregation_method            = "event_flow"
    aggregation_delay             = 120
    baseline_direction            = "upper_only"
    query                         = "FROM Log SELECT uniqueCount(message) WHERE EventID=8670 AND  message LIKE '%error%' FACET hostName"
    warning                       = true
    critical                      = false
    warning_operator              = "above_or_equals"
    warning_threshold             = 1
    warning_threshold_duration    = 300
    warning_threshold_occurrences = "all"
}

}