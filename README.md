# NZBget-workaround-for-looping-unpack

Script to be run from within binhex-nzbget docker, on a schedule
Script will restart nzbget if a postprocessing job is in the queue for more that he limit amount of minutes
This normally indicates a "looping" unpack job
For background of the problem that lead to this workaround, see https://github.com/nzbget/nzbget/issues/558
