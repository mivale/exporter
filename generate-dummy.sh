#!/usr/bin/env bash
#
# cronjob test - generate dummy metrics
#
cd $(dirname $0)

# Generate a random number between 0 and 500
job_restic_test_numfiles=$((RANDOM % 501))

# Generate a random number between 1000 and 5000
job_restic_test_duration_ms=$((RANDOM % 4001 + 1000))

# Generate a random number between 10000 and 50000
job_restic_test_processed_size=$((RANDOM % 100001 + 40000))

METRICS_PATH=./metrics

# write the metrics
# all these metrics will be prepended by cron_
# because they are read using the inputs.file plugin with data_format = "prometheus"
cat <<EOF >$METRICS_PATH/job_restic_test.metric
# TYPE job_restic_test_numfiles gauge
# HELP job_restic_test_numfiles Number of files processed in this job
job_restic_test_numfiles{instance="restic@$(hostname -s)"} $job_restic_test_numfiles

# TYPE job_restic_test_processed_size gauge
# HELP job_restic_test_processed_size Duration in ms of this job
job_restic_test_processed_size{instance="restic@$(hostname -s)"} $job_restic_test_processed_size

# TYPE job_restic_test_duration_ms gauge
# HELP job_restic_test_duration_ms Duration in ms of this job
job_restic_test_duration_ms{instance="restic@$(hostname -s)"} $job_restic_test_duration_ms
EOF
