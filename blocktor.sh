#!/bin/bash
# Block tor exit nodes with nftables

# add table filter
nft add table ip filter

# Add input chain to filter table
nft add chain ip filter input { type filter hook input priority 0 \; }

# Add named set
nft add set ip filter torexitnodes { type ipv4_addr \; flags dynamic, timeout \; timeout 5m \; }

# Download list of exit nodes and add to named set
curl -sSL "https://check.torproject.org/cgi-bin/TorBulkExitList.py?exit" | sed '/^#/d' | while read IP; do
  nft add element ip filter torexitnodes { $IP } 
done

# Block ip addresses in the named set
nft add rule ip filter input ip saddr @torexitnodes drop
