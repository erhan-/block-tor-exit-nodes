# Block TOR exit nodes

A small script which downloads exit node addresses from https://check.torproject.org/cgi-bin/TorBulkExitList.py?exit and blocks them using nftables. Compatible with Red Hat 8. Add a cron job to get daily updates!

Inspired by @jkullick:
https://gist.github.com/jkullick/62695266273608a968d0d7d03a2c4185
