resource "newrelic_alert_policy" "policy" {
  name                = var.alert_policy
  incident_preference = var.incident_preference
}

resource "newrelic_nrql_alert_condition" "alert_condition" {
  for_each                     = var.nrql_alert_condition_details
  type                         = each.value.type
  account_id                   = each.value.account_id
  name                         = each.value.name
  policy_id                    = newrelic_alert_policy.policy.id
  description                  = each.value.description
  enabled                      = each.value.enabled
  runbook_url                  = each.value.runbook_url
  violation_time_limit_seconds = each.value.violation_time_limit_seconds
  aggregation_window           = each.value.aggregation_window
  aggregation_method           = each.value.aggregation_method
  aggregation_delay            = each.value.aggregation_delay

  # baseline type only
  baseline_direction = each.value.baseline_direction

  nrql {
    query = each.value.query
  }

  dynamic "critical" {
    for_each = each.value.critical ? [each.value] : []
    content {
      operator              = each.value.critical_operator
      threshold             = each.value.critical_threshold
      threshold_duration    = each.value.critical_threshold_duration
      threshold_occurrences = each.value.critical_threshold_occurrences
    }
  }


  dynamic "warning" {
    for_each = each.value.warning ? [each.value] : []
    content {
      operator              = each.value.warning_operator
      threshold             = each.value.warning_threshold
      threshold_duration    = each.value.warning_threshold_duration
      threshold_occurrences = each.value.warning_threshold_occurrences
    }
  }
}