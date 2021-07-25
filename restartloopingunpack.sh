#!/bin/bash
## Version 0.1
## Script to be run from within binhex-nzbget docker, on a schedule
## Script will restart nzbget if a postprocessing job is in the queue for more that he limit amount of minutes
## This normally indicates a "looping" unpack job
## For background of the problem that lead to this workaround, see https://github.com/nzbget/nzbget/issues/558

## Specify how long, in minutes, a post-processing job can be running before beign considered in a hung state
PPlimit="5"

/usr/local/bin/nzbget/nzbget -c /config/nzbget.conf -L O
