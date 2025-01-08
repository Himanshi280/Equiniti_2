resource "newrelic_one_dashboard" "mssql" {
  name = "MSSQL"

  variable {
    default_values     = ["prd"]
    is_multi_selection = true
    name               = "Environment"
    nrql_query {
      account_ids = [4411834]
      query       = "SELECT uniques(environment) FROM MssqlCustomQuerySample LIMIT MAX WHERE environment IS NOT NULL"
    }

    replacement_strategy = "string"
    title                = "Environment"
    type                 = "nrql"
  }

  variable {
    default_values     = ["*"]
    is_multi_selection = true
    name               = "Instance"
    nrql_query {
      account_ids = [4411834]
      query       = "SELECT uniques(instance) FROM MssqlCustomQuerySample LIMIT MAX WHERE instance IS NOT NULL"
    }

    replacement_strategy = "string"
    title                = "Instance"
    type                 = "nrql"
  }

  page {
    name = "MSSQL"

    widget_billboard {
      title  = "Max Average Wait Time by Monitors"
      row    = 1
      column = 1
      width  = 3
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT max(AverageWaitTimeMs) AS 'Average Wait Time M/s' WHERE label.query='avgwait'  AND environment IN ({{Environment}}) AND instance IN ({{Instance}}) FACET instance"
      }
    }

    widget_area {
      title  = "Average Wait Type Max. By Instance Type"
      row    = 1
      column = 4
      width  = 9
      height = 3

      nrql_query {
        query = "SELECT  max(AverageWaitTimeMs) FROM MssqlCustomQuerySample WHERE label.query = 'avgwait' WHERE environment IN ({{Environment}}) AND instance IN ({{Instance}}) TIMESERIES  FACET wait_type,instance"
      }
    }

    widget_table {
      title  = "Instance Average Wait time By Type"
      row    = 9
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT wait_type,AverageWaitTimeMs, instance  FROM MssqlCustomQuerySample  WHERE label.query='avgwait' WHERE environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

    widget_bar {
      title  = "Total Log File Count by Monitors"
      row    = 2
      column = 1
      width  = 3
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT max(vlf_count) AS 'Virtual Log File Count' WHERE label.query='virfile'  AND environment IN ({{Environment}}) AND instance IN ({{Instance}}) FACET name"
      }
    }

    widget_table {
      title  = "Availability Database Backup State"
      row    = 2
      column = 4
      width  = 9
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT DatabaseName,HoursSinceLastBackup,LastBackupDate WHERE label.query='avbackup'  WHERE environment IN ({{ Environment}}) AND instance IN ({{Instance}})"
      }
    }

    widget_table {
      title  = "Summary Monitor Health"
      row    = 3
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "FROM  MssqlCustomQuerySample SELECT AvailabilityGroupName,ReplicaServerName,SynchronizationHealth,DatabaseState WHERE label.query='grouphealth'  WHERE environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

    widget_table {
      title  = "Replica Health Summary"
      row    = 4
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT AvailabilityMode,ReplicaServerName,FailoverMode,SynchronizationHealth,ReplicaRole,IsLocalReplica WHERE label.query='grouphealth' AND environment IN ({{Environment}}) AND instance IN ({{ Instance}})"
      }
    }

    widget_billboard {
      title  = "Unhealth State Replica Server"
      row    = 5
      column = 1
      width  = 3
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT count(ReplicaServerName) WHERE label.query='grouphealth' AND SynchronizationHealth!='HEALTHY'  AND environment IN ({{Environment}}) AND instance IN ({{ Instance}}) FACET SynchronizationHealth"
      }
    }

    ## name = "SIRIUS SQL"

    widget_table {
      title  = "Tables with identity columns"
      row    = 5
      column = 4
      width  = 9
      height = 3

      nrql_query {
        query = "SELECT IdIndexColumnType, IdIndexMaxActualValue, IdIndexMinActualValue, IdIndexPercentage, IdIndexPercentageSkipped, tablename,instance, fullHostname from MssqlCustomQuerySample where label.query ='identity' AND environment IN ({{Environment}}) AND instance IN ({{ Instance}}) since 1 day ago LIMIT MAX"
      }
    }

    widget_table {
      title  = "Transient tables over their specified row count"
      row    = 6
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT `Current Row Count`, `Current Threshold`, Tablename, instance, fullHostname from MssqlCustomQuerySample where label.query ='transient' AND environment IN ({{Environment}}) AND instance IN ({{ Instance}}) since 1 day ago LIMIT MAX "
      }
    }

    # # name = "sysadmin"

    widget_table {
      title  = "sysadmin"
      row    = 7
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT latest(createdate) AS 'CreateDate', latest(updatedate) AS 'UpdateDate', latest(accdate) AS 'AccDate' from MssqlCustomQuerySample where label.query ='sysadmin' AND environment IN ({{Environment}}) AND instance IN ({{ Instance}}) since 1 day ago LIMIT MAX facet name, instance, fullHostname"
      }
    }

    # # name = "sqlinstance_reboot"

    widget_table {
      title  = "sqlinstance_reboot_prd"
      row    = 8
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT crdate, instance, fullHostname, instanceType from MssqlCustomQuerySample where label.query ='instance_reboot' AND environment IN ({{Environment}}) AND instance IN ({{ Instance}}) since 3 days ago LIMIT MAX"
      }
    }

  }

  page {
    name = "MSSQL Jobs & System Resources"

    widget_table {
      title  = "SQL Job Failed"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "select instance, `JOB NAME`,DESCRIPTION,`RUN STATUS`,`STEP NAME`,`RUN DATE`, `RUN DURATION`, `RUN TIME`, hostname from MssqlCustomQuerySample where label.query ='sqljob' AND `RUN STATUS` =0  AND environment IN ({{Environment}}) AND instance IN ({{ Instance}}) since 1 day ago LIMIT MAX"
      }
    }

    widget_table {
      title  = "SQL Job Cancelled"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        query = "select instance, `JOB NAME`,DESCRIPTION,`RUN STATUS`,`STEP NAME`,`RUN DATE`, `RUN DURATION`, `RUN TIME`, hostname from MssqlCustomQuerySample where label.query ='sqljob' AND `RUN STATUS` =3 AND environment IN ({{Environment}}) AND instance IN ({{ Instance}}) since 1 day ago LIMIT MAX"
      }
    }

    ## name = "Top SQL queries consuming system resources"

    widget_table {
      title  = "Based on CPU"
      row    = 2
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT instance, AvgCPUTime, Text, creation_time, last_execution_time, total_worker_time, execution_count, fullHostname from MssqlCustomQuerySample where label.query ='topsqlcpu' AND environment IN ({{Environment}}) AND instance IN ({{ Instance}})"
      }
    }

    widget_table {
      title  = "Based on Disk I/O"
      row    = 3
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT instance, Text, creation_time, last_execution_time, LogicalReads, LogicalWrites, execution_count, AggIO, AvgIO, database_name, OBJECT_ID, fullHostname from MssqlCustomQuerySample where label.query ='topsqldisk' AND environment IN ({{Environment}}) AND instance IN ({{ Instance}})"
      }
    }


  }

  page {
    name = "DBState"

    widget_table {
      title  = "Summary - DB State Not Online"
      row    = 5
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT timestamp,DatabaseStatus,DatabaseName,customer,hostname,hostStatus FROM MssqlCustomQuerySample  WHERE label.query='dbstate' WHERE  DatabaseStatus IS NOT NULL AND DatabaseStatus !='ONLINE' AND environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

    widget_table {
      title  = "Summary - DB State Online"
      row    = 6
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT timestamp,DatabaseStatus,DatabaseName,customer,hostname,hostStatus FROM MssqlCustomQuerySample  WHERE label.query='dbstate' WHERE  DatabaseStatus IS NOT NULL AND DatabaseStatus ='ONLINE' AND environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

    widget_billboard {
      title  = "Total DBCount"
      row    = 1
      column = 1
      width  = 3
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT uniqueCount(DatabaseName) AS 'Total  DBCount' WHERE label.query='dbstate'  AND environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

    widget_billboard {
      title  = "DB Count Online"
      row    = 1
      column = 4
      width  = 3
      height = 3

      nrql_query {
        query = " FROM MssqlCustomQuerySample SELECT uniqueCount(DatabaseName) AS 'Database Count' WHERE label.query='dbstate'  AND DatabaseStatus ='ONLINE' AND environment IN ({{Environment}}) AND instance IN ({{Instance}}) LIMIT MAX"
      }
    }

    widget_billboard {
      title  = "DB Count Not Online"
      row    = 1
      column = 7
      width  = 3
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT uniqueCount(DatabaseName) AS 'Database Count' WHERE label.query='dbstate' AND environment IN ({{Environment}}) AND instance IN ({{Instance}}) AND DatabaseStatus!='ONLINE'"
      }
    }

    widget_billboard {
      title  = "New DB Created"
      row    = 1
      column = 10
      width  = 3
      height = 3

      nrql_query {
        # query = "from MssqlCustomQuerySample select * where label.query ='newdb' AND environment IN ({{Environment}}) AND instance IN ({{ Instance}}) since 5 weeks ago Limit Max"
        query = "From MssqlCustomQuerySample select count(*) AS 'New DB Created' where label.query = 'newdb' AND environment IN ({{Environment}}) AND instance IN ({{Instance}}) SINCE 1 year ago LIMIT MAX"
      }
    }

    widget_billboard {
      title  = "DB Log Backup Status"
      row    = 2
      column = 1
      width  = 4
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT latest(LogBackupStatus) WHERE label.query='logbackup' AND environment IN ({{environment}}) AND instance IN ({{Instance}}) FACET DatabaseName"
      }
    }

    widget_billboard {
      title  = "DB engine health status"
      row    = 2
      column = 5
      width  = 4
      height = 3

      nrql_query {
        query = "select latest(DBEngineHealthStatus) from MssqlCustomQuerySample WHERE label.query ='dbengine' AND environment IN ({{Environment}}) AND instance IN ({{Instance}}) facet instance"
      }
    }

    widget_billboard {
      title  = "DB backup Status"
      row    = 2
      column = 9
      width  = 4
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT latest(BackupStatus) WHERE label.query='dbbackup' AND environment IN ({{Environment}}) AND instance IN ({{Instance}}) FACET instance"
      }
    }

    widget_table {
      title  = "DB engine Health Summary"
      row    = 3
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "select StartTime,DBEngineHealthStatus from MssqlCustomQuerySample WHERE label.query ='dbengine' AND environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

    widget_table {
      title  = "DB Backup Summary"
      row    = 4
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT DatabaseName,BackupStatus WHERE label.query='dbbackup' AND environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

  }


  page {
    name = "Server Reboot & Account locked Event"
    widget_table {
      title  = "server_reboot_prd"
      row    = 2
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT `Channel`,`EventID`,`ComputerName`,`message` FROM Log WHERE (`EventID` = 1074 OR `EventID` = '1074') AND hostname like '%prd%' SINCE 3 days ago limit max"
      }
    }

    # name = "SQL Account lock"
    widget_table {
      title  = "SQL Account locked event"
      row    = 3
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT message, ComputerName, SourceName, EventID FROM Log WHERE (`EventID` = 18456 OR `EventID` = '18456' OR `EventID` = 18486 OR `EventID` = '18486') AND `environment` = 'prd' AND hostname like '%prd%' since 1 week ago LIMIT MAX"
      }
    }
  }

  page {
    name = "Blocked_Process"

    widget_line {
      title  = "blocked_process_count"
      row    = 2
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT max(`mssql.instance.instance.blockedProcessesCount`) FROM Metric where environment IN ({{Environment}}) AND instance IN ({{ Instance}}) since 1 hour ago FACET entity.name TIMESERIES AUTO"
      }
    }

    widget_billboard {
      title  = "Max Blocked Wait Time By Instance"
      row    = 1
      column = 1
      width  = 4
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT max(wait_time) FACET instance,wait_resource WHERE label.query='blocked' AND environment IN ({{Environment}}) AND ({{Instance}})"
      }
    }

    widget_table {
      title  = "Summary - Blocked Session"
      row    = 1
      column = 5
      width  = 8
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT BlockingSessionID,wait_type,wait_time,wait_resource  WHERE label.query='blocked' AND environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

  }

  page {
    name = "Availability Group"

    widget_billboard {
      title  = "AG Online Monitor DB State"
      row    = 1
      column = 1
      width  = 3
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT latest(DatabaseState) AS 'DATABASE STATE' WHERE label.query='agonline'  AND environment IN ({{Environment}}) AND instance IN ({{Instance}})FACET instance , AvailabilityGroupName"
      }
    }
    widget_billboard {
      title  = "AG Online Monitor Health"
      row    = 1
      column = 4
      width  = 3
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT latest(SynchronizationHealth)  WHERE label.query='agonline'  AND environment IN ({{Environment}}) AND instance IN ({{Instance}})FACET instance , AvailabilityGroupName"
      }
    }
    widget_table {
      title  = "AG Online Monitor Summary"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT AvailabilityGroupName,IsSuspended,PrimaryOrSecondary,SynchronizationHealth,DatabaseState WHERE label.query='agonline' AND environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }
    widget_table {
      title  = "AG Failover Monitor"
      row    = 2
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT AvailabilityGroup,AvailabilityMode,FailoverMode WHERE label.query='agafc' WHERE environment IN ({{environment}}) AND instance IN ({{Instance}})"
      }
    }
    widget_markdown {
        title  = ""
        row    = 3
        column = 1
        width  = 3
        height = 3
        text   = "![New Relic logo](data:image/png;base64,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)"
    }
  }

  page {
    name = "SQL Event Logs"

    widget_table {
      title  = "SQL Event 17063"
      row    = 1
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT `Channel`,`EventID`,`ComputerName`,`message` FROM Log WHERE (`EventID` = 17063 OR `EventID` = '17063') AND message like '% x %' SINCE 7 days ago LIMIT 50"
      }
    }

    widget_table {
      title  = "Rules Monitor Events"
      row    = 2
      column = 1
      width  = 12
      height = 4

      nrql_query {
        query = "FROM Log SELECT timestamp, EventID, message, hostname WHERE EventID IN (3041, 20554, 9642, 9645, 8405, 9644, 28072, 9643, 9646, 9789, 9004, 9736, 6291, 9649, 9761, 9641, 605, 17179, 18204, 9002, 1619, 5123, 9701, 9694, 28002, 9698, 9697, 8921, 832, 6805, 6510, 21286, 1803, 1105, 10303, 17204, 17058, 5180, 8966, 3431, 3619, 5123, 3414, 8957, 3413, 617, 6610, 6608, 3417, 21285, 6289, 6517, 21284, 6513, 6511, 6512, 7622, 7607, 8620, 8670, 8630, 8680, 8621, 7105, 824, 4064, 6536, 6537, 654, 8956, 17207, 17218, 823, 8982, 17884, 9634, 3151, 8941, 1101, 9696, 9695, 701, 28078, 28076, 9650, 28060, 8946, 8936, 8931, 8937, 8930, 8925, 8926, 8969, 8963, 8938, 15013, 14265, 10001, 3627, 9692, 9693, 18459, 8908, 5120, 16959, 15601, 6627, 6603, 4221) AND EventID IS NOT NULL"
      }
    }

  }

}

#######################################################################################################

# resource "newrelic_one_dashboard" "nonmssql" {
#   name = "mssql-nonprod"

#   page {
#     name = "mssql"

#     widget_table {
#       title  = "SQL Job failed"
#       row    = 1
#       column = 1
#       width  = 6
#       height = 3

#       nrql_query {
#         query = "select instance, `JOB NAME`,DESCRIPTION,`RUN STATUS`,`STEP NAME`,`RUN DATE`, `RUN DURATION`, `RUN TIME`, hostname from MssqlCustomQuerySample where label.query ='sqljob' AND `RUN STATUS` =0 and instance NOT LIKE '%prd%' since 1 day ago LIMIT MAX"
#       }
#     }

#     widget_table {
#       title  = "SQL Job Cancelled"
#       row    = 1
#       column = 7
#       width  = 6
#       height = 3

#       nrql_query {
#         query = "select instance, `JOB NAME`,DESCRIPTION,`RUN STATUS`,`STEP NAME`,`RUN DATE`, `RUN DURATION`, `RUN TIME`, hostname from MssqlCustomQuerySample where label.query ='sqljob' AND `RUN STATUS` =3 and instance NOT LIKE '%prd%' since 1 day ago LIMIT MAX"
#       }
#     }

#     widget_table {
#       title  = "New DB Created"
#       row    = 2
#       column = 1
#       width  = 6
#       height = 3

#       nrql_query {
#         query = "from MssqlCustomQuerySample select * where label.query ='newdb' and instance not LIKE '%prd%' since 5 weeks ago Limit Max"
#       }
#     }

#   }

#   page {
#     name = "SQL Account lock"

#     widget_table {
#       title  = "SQL Account locked event"
#       row    = 1
#       column = 1
#       width  = 12
#       height = 12

#       nrql_query {
#         query = "SELECT message, ComputerName, SourceName, EventID FROM Log WHERE (`EventID` = 18456 OR `EventID` = '18456' OR `EventID` = 18486 OR `EventID` = '18486') AND `environment` != 'prd' AND hostname NOT like '%prd%' since 1 week ago LIMIT MAX"
#       }
#     }
#   }

#   page {
#     name = "SIRIUS SQL"

#     widget_table {
#       title  = "Tables with identity columns"
#       row    = 1
#       column = 1
#       width  = 6
#       height = 3

#       nrql_query {
#         query = "SELECT IdIndexColumnType, IdIndexMaxActualValue, IdIndexMinActualValue, IdIndexPercentage, IdIndexPercentageSkipped, tablename,instance, fullHostname from MssqlCustomQuerySample where label.query ='identity' AND instance NOT LIKE '%prd%' since 1 day ago LIMIT MAX"
#       }
#     }

#     widget_table {
#       title  = "Transient tables over their specified row count"
#       row    = 1
#       column = 7
#       width  = 6
#       height = 3

#       nrql_query {
#         query = "SELECT `Current Row Count`, `Current Threshold`, Tablename, instance, fullHostname from MssqlCustomQuerySample where label.query ='transient' AND instance NOT LIKE '%prd%' since 1 day ago LIMIT MAX "
#       }
#     }
#   }

#   page {
#     name = "DBState"

#     widget_table {
#       title  = "DBState not Online"
#       row    = 2
#       column = 1
#       width  = 6
#       height = 3

#       nrql_query {
#         query = "SELECT DBName, STATE, instance, fullHostname FROM MssqlCustomQuerySample where label.query = 'dbstate' and STATE !='ONLINE' AND instance NOT LIKE '%prd%' LIMIT MAX SINCE 15 minutes ago"
#       }
#     }

#     widget_table {
#       title  = "DBState Online"
#       row    = 2
#       column = 7
#       width  = 6
#       height = 3

#       nrql_query {
#         query = "SELECT DBName, STATE, instance, fullHostname FROM MssqlCustomQuerySample where label.query = 'dbstate' AND instance NOT LIKE '%prd%' LIMIT MAX SINCE 15 minutes ago"
#       }
#     }

#   }

#   page {
#     name = "sysadmin"

#     widget_table {
#       title  = "sysadmin"
#       row    = 1
#       column = 1
#       width  = 12
#       height = 6

#       nrql_query {
#         query = "SELECT latest(createdate) AS 'CreateDate', latest(updatedate) AS 'UpdateDate', latest(accdate) AS 'AccDate' from MssqlCustomQuerySample where label.query ='sysadmin' AND instance NOT LIKE '%prd%' since 1 day ago LIMIT MAX facet name, instance, fullHostname"
#       }
#     }

#   }

#   page {
#     name = "server_reboot"

#     widget_table {
#       title  = "server_reboot_nonprod"
#       row    = 1
#       column = 1
#       width  = 12
#       height = 6

#       nrql_query {
#         query = "SELECT `Channel`,`EventID`,`ComputerName`,`message` FROM Log WHERE (`EventID` = 1074 OR `EventID` = '1074') AND hostname not like '%prd%' SINCE 3 days ago limit max"
#       }
#     }
#   }

#   page {
#     name = "sqlinstance_reboot"

#     widget_table {
#       title  = "sqlinstance_reboot_nonprod"
#       row    = 1
#       column = 1
#       width  = 12
#       height = 6

#       nrql_query {
#         query = "SELECT crdate, instance, fullHostname, instanceType from MssqlCustomQuerySample where label.query ='instance_reboot' AND instance not like '%prd%' since 3 days ago LIMIT MAX"
#       }
#     }
#   }

#   page {
#     name = "blocked_process"

#     widget_line {
#       title  = "blocked_process_count"
#       row    = 1
#       column = 1
#       width  = 12
#       height = 6

#       nrql_query {
#         query = "SELECT max(`mssql.instance.instance.blockedProcessesCount`) FROM Metric where entity.name not LIKE '%prd%' since 1 hour ago FACET entity.name TIMESERIES AUTO"
#       }
#     }

#   }

#   page {
#     name = "Top SQL queries consuming system resources"

#     widget_table {
#       title  = "Based on CPU"
#       row    = 1
#       column = 1
#       width  = 6
#       height = 6

#       nrql_query {
#         query = "SELECT instance, AvgCPUTime, Text, creation_time, last_execution_time, total_worker_time, execution_count, fullHostname from MssqlCustomQuerySample where label.query ='topsqlcpu' AND instance NOT LIKE '%prd%'"
#       }
#     }

#     widget_table {
#       title  = "Based on Disk I/O"
#       row    = 1
#       column = 7
#       width  = 6
#       height = 6

#       nrql_query {
#         query = "SELECT instance, Text, creation_time, last_execution_time, LogicalReads, LogicalWrites, execution_count, AggIO, AvgIO, database_name, OBJECT_ID, fullHostname from MssqlCustomQuerySample where label.query ='topsqldisk' AND instance NOT LIKE '%prd%'"
#       }
#     }

#   }

# }
