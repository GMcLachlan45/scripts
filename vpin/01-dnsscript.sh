#!/bin/sh
echo "Now downloading & Parsing Blacklist"

URL=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
   #https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

# block from Steven's List 
wget -q $URL -O - --no-check-certificate | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" redirect\nlocal-data: \""$2" A 0.0.0.0\"\n"}' > /tmp/adblock-unbound

# block ipv6 as well
wget -q $URL -O - --no-check-certificate | grep '^0\.0\.0\.0' | awk '{print "local-data: \""$2" AAAA ::\"\n"}' >> /tmp/adblock-unbound

cat /tmp/adblock-unbound > /var/unbound/etc/unbound.ads.conf 
rm /tmp/adblock-unbound

# MRL=https://dns.ontothenorth.com 

# block from my list
# wget -q $MRL -O - --no-check-certificate | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" redirect\nlocal-data: \""$2" A 0.0.0.0\"\n"}' > /tmp/blocklist-unbound

# block ipv6 as well
# wget -q $MRL -O - --no-check-certificate | grep '^0\.0\.0\.0' | awk '{print "local-data: \""$2" AAAA ::\"\n"}' >> /tmp/blocklist-unbound

# cat /tmp/blocklist-unbound > /var/unbound/etc/unbound.block.conf
# rm /tmp/blocklist-unbound
