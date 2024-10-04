#!/bin/bash

az backup policy create \
  --resource-group MyResourceGroup \
  --vault-name MyRecoveryVault \
  --name MyCustomPolicy \
  --policy '{"policyType":"V2","schedulePolicy":{"schedulePolicyType":"SimpleSchedulePolicyV2","scheduleRunFrequency":"Daily","scheduleRunTimes":["2024-10-04T23:00:00Z"]},"retentionPolicy":{"retentionPolicyType":"LongTermRetentionPolicyV2","dailySchedule":{"retentionDuration":{"count":30,"durationType":"Days"}}}}'


az backup protection update-for-vm \
  --resource-group MyResourceGroup \
  --vault-name MyRecoveryVault \
  --vm MyVM1 \
  --policy-name MyCustomPolicy