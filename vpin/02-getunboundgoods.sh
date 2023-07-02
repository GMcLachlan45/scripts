#!/bin/sh

# echo "Retrieving the Unbound example, remove when you're done"
# wget https://raw.githubusercontent.com/NLnetLabs/unbound/master/doc/example.conf.in -O unbound.example.conf

echo "server:
        interface: 0.0.0.0
        interface: ::0
        interface: 127.0.0.1
        interface: ::1

        do-ip4: yes
        do-ip6: yes
	
	# Allow DNS for localhost
        access-control: 127.0.0.0/8 allow
        access-control: ::1 allow
	access-control: 196.168.0.0/24 allow
	access-control: 196.168.1.0/24 allow

        hide-identity: yes
        hide-version: yes

	include: "/var/unbound/etc/unbound.whitelist.conf"
        include: "/var/unbound/etc/unbound.ads.conf"
        # include: "/var/unbound/etc/unbound.block.conf"
	local-zone: "local." static

forward-zone:
        name: \".\"
        forward-addr: 1.1.1.3
	forward-addr: 1.0.0.3" > /tmp/unbound.conf

mv /tmp/unbound.conf /var/unbound/etc/


rcctl enable unbound
rcctl -d start unbound
