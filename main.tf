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

    widget_table {
      title  = "Instance Average Wait time By Type"
      row    = 1
      column = 4
      width  = 9
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
      row    = 3
      column = 1
      width  = 12
      height = 3

      nrql_query {
        query = "SELECT timestamp,DatabaseStatus,DatabaseName,customer,hostname,hostStatus FROM MssqlCustomQuerySample  WHERE label.query='dbstate' WHERE  DatabaseStatus IS NOT NULL AND DatabaseStatus !='ONLINE' AND environment IN ({{Environment}}) AND instance IN ({{Instance}})"
      }
    }

    widget_table {
      title  = "Summary - DB State Online"
      row    = 2
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
        query = "From MssqlCustomQuerySample select count(*) AS 'New DB Created' where label.query = 'newdb' and environment IN (Environment) and instance IN (Instance) SINCE 1 year ago LIMIT MAX"
      }
    }

    widget_billboard {
      title  = "DB Log Backup Status"
      row    = 4
      column = 1
      width  = 3
      height = 3

      nrql_query {
        query = "FROM MssqlCustomQuerySample SELECT latest(LogBackupStatus) WHERE label.query='logbackup' AND environment IN ({{environment}}) AND instance IN ({{Instance}}) FACET DatabaseName"
      }
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
      title  = "SQL Event 17063"
      row    = 2
      column = 1
      width  = 12
      height = 4

      nrql_query {
        query = "FROM Log SELECT timestamp, EventID, message, hostname WHERE EventID IN (3041, 20554, 9642, 9645, 8405, 9644, 28072, 9643, 9646, 9789, 9004, 9736, 6291, 9649, 9761, 9641, 605, 17179, 18204, 9002, 1619, 5123, 9701, 9694, 28002, 9698, 9697, 8921, 832, 6805, 6510, 21286, 1803, 1105, 10303, 17204, 17058, 5180, 8966, 3431, 3619, 5123, 3414, 8957, 3413, 617, 6610, 6608, 3417, 21285, 6289, 6517, 21284, 6513, 6511, 6512, 7622, 7607, 8620, 8670, 8630, 8680, 8621, 7105, 824, 4064, 6536, 6537, 654, 8956, 17207, 17218, 823, 8982, 17884, 9634, 3151, 8941, 1101, 9696, 9695, 701, 28078, 28076, 9650, 28060, 8946, 8936, 8931, 8937, 8930, 8925, 8926, 8969, 8963, 8938, 15013, 14265, 10001, 3627, 9692, 9693, 18459, 8908, 5120, 16959, 15601, 6627, 6603, 4221) AND EventID IS NOT NULL"
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
    # widget_markdown {
    #     title  = ""
    #     row    = 3
    #     column = 1
    #     width  = 3
    #     height = 3
    #     text   = " ![New Relic logo](https://newrelic.com/static-assets/images/icons/avatar-newrelic.png)"
    # }
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
