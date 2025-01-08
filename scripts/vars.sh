# PostgreSQL DB connection parameters

export DB_HOST=placeholder.akamaidb.net
export DB_PORT=27108
export DB_USER=akmadmin
export DB_PASSWORD=placeholder
export DB_NAME=defaultdb

# pgbench load/scale parameters

export PGBENCH_SCALE=10        # scale factor (keep it higher or equal to concurrent clients)
export PGBENCH_CLIENTS=10      # clients or concurrent db sessions
export PGBENCH_RATE=50         # rate limit, number of transactions per second
export PGBENCH_THREADS=2       # number of threads to run to manage connections (recommended to set same as # of vCPUs)
export PGBENCH_DURATION=300    # test duration

# pgbench script to use (options are: tpcb-like, simple-update, select-only) with optional weight

export PGBENCH_SCRIPT=tpcb-like