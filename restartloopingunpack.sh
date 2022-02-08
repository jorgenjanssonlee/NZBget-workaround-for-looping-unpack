#!/bin/bash
## Version 0.1
## Script to be run from within binhex-nzbget docker, on a schedule
## Script will restart nzbget if a postprocessing job is in the queue for more that he limit amount of minutes
## This normally indicates a "looping" unpack job
## For background of the problem that lead to this workaround, see https://github.com/nzbget/nzbget/issues/558

## Specify how long, in minutes, a post-processing job can be running before beign considered in a hung state
PPlimit="5"

## Check if post-processing queue contains any jobs
if /usr/local/bin/nzbget/nzbget -c /config/nzbget.conf -L O | grep -q "Server has no jobs queued for post-processing"; then
  echo "no queued job, exiting"
  exit 0
elif /usr/local/bin/nzbget/nzbget -c /config/nzbget.conf -L O | grep -q "Post-Processing List"; then
  if [[ ! -e "/config/PPtracking.tmp" ]]; then
    echo "jobs are queued but PPtracking.tmp file does not exist. Write queue to file and exit"
    exit 0
  else
    echo "jobs are queued and PPtracking.tmp file exists.\
     Check if it's the same job in queue and if PPlimit is reached\
     Then restart, othwerwise exit"
  fi
fi
