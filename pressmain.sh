#!/bin/bash
#
# Title:      PlexGuide (Reference Title File)
# Author(s):  Admin9705
# URL:        https://plexguide.com - http://github.plexguide.com
# GNU:        General Public License v3.0
################################################################################
mainbanner () {
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 PG Press                            📓 Reference: pgpress.plexguide.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[1] Instance: Deploy a New Instance    [NOT READY]
[2] Instance: View Deployed Containers [NOT READY]
[3] Instance: Backup & Restore         [NOT READY]
[4] Instance: Set an Instance as TLD   [NOT READY]
[5] Instance: Destroy an Instance      [NOT READY]
[Z] Exit

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

read -p 'Type a Selection | Press [ENTER]: ' typed < /dev/tty

case $typed in
    1 )
        deploywp ;;
    z )
        exit ;;
    Z )
        exit ;;
    * )
        mainbanner ;;
esac
}

deploywp () {

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 Setting a WordPress ID / SubDomain
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Type the name for the subdomain wordpress instance. Instance can later be
turned to operate at the TLD (Top Level Domain). Keep it all lowercase and
with no breaks in space.

EOF

read -p '↘️  Type Subdomain | Press [ENTER]: ' subdomain < /dev/tty

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 Setting a Port
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

What port do you want your server to utilize? Type a 5 digit port that is
greater than 10000, but less than 60000. Ensure the port is not blocked
and/or is not in use!

EOF

read -p '↘️  Type a Port Number | Press [ENTER]: ' port < /dev/tty

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 Deploying WordPress Instance: $subdomain
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

What port should the server utilize? Type a 5 digit port that is greater
than 10000, but less than 60000. Ensure the port is not blocked and/or is
not in use!

EOF

echo "$subdomain" > /tmp/wp_port
echo "$port" > /tmp/wp_port

ansible-playbook /opt/pgpress/db.yml
ansible-playbook /opt/pgpress/wordpress.yml

}

mainbanner
