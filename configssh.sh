#!/system/bin/sh

ver="v1.0"
released="24 April 2019"
#
divider="======================================================"
#
BL="\e[01;90m"; # Black
R="\e[01;91m"; # Red
G="\e[01;92m"; # Green
Y="\e[01;93m"; # Yellow
B="\e[01;94m"; # Blue
P="\e[01;95m"; # Purple
C="\e[01;96m"; # Cyan
W="\e[01;97m"; # White
N="\e[0m"; # Null
#
# Root checking...
id=`id`; 
id=`echo ${id#*=}`; 
id=`echo ${id%%\(*}`; 
id=`echo ${id%% *}`
if [ "$id" != "0" ] && [ "$id" != "root" ]; then
	clear
	echo $P"$divider"$N
	echo ""
	echo $R"              PLEASE TYPE "$N $G"SU "$N $R"FIRST              "$N
	echo ""
	echo $P"$divider"$N
	exit 0
else
	clear
	echo $P"$divider"$N
	echo ""
	echo $R"                     By Zainal                        "$N
	echo ""
	echo $P"$divider"$N
	sleep 1
fi
while :
do
# Backup Config SSH
backup_config() {
  cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
  }
#  
# Restore Config SSH
restore_config() {
  rm -rf /etc/ssh/sshd_config
  cp /etc/ssh/sshd_config.bak /etc/ssh/sshd_config
  }
#
# Make Config
make_config_22() {
  rm -rf /etc/ssh/sshd_config
  echo "# $OpenBSD: sshd_config,v 1.101 2017/03/14 07:19:07 djm Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/bin:/bin:/usr/sbin:/sbin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
RekeyLimit default none

# Logging
SyslogFacility AUTH
LogLevel INFO

# Authentication:

LoginGraceTime 2m
PermitRootLogin prohibit-password
StrictModes yes
MaxAuthTries 6
MaxSessions 10

PubkeyAuthentication yes

# Expect .ssh/authorized_keys2 to be disregarded by default in future.
AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2

AuthorizedPrincipalsFile none

AuthorizedKeysCommand none
AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication yes
PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no

# Kerberos options
KerberosAuthentication no
KerberosOrLocalPasswd yes
KerberosTicketCleanup yes
KerberosGetAFSToken no

# GSSAPI options
GSSAPIAuthentication no
GSSAPICleanupCredentials yes
GSSAPIStrictAcceptorCheck yes
GSSAPIKeyExchange no

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM yes

AllowAgentForwarding yes
AllowTcpForwarding yes
GatewayPorts no
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes
PermitTTY yes
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
UseLogin no
PermitUserEnvironment no
Compression delayed
ClientAliveInterval 0
ClientAliveCountMax 3
UseDNS no
PidFile /var/run/sshd.pid
MaxStartups 10:30:100
PermitTunnel no
ChrootDirectory none
VersionAddendum none

# no default banner path
Banner none

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

# override default of no subsystems
Subsystem	sftp	/usr/lib/openssh/sftp-server

# Example of overriding settings on a per-user basis
Match User anoncvs
	X11Forwarding no
	AllowTcpForwarding no
	PermitTTY no
	ForceCommand cvs server" >> /etc/ssh/sshd_config
  }
make_config_9022() {
  rm -rf /etc/ssh/sshd_config
  echo "# $OpenBSD: sshd_config,v 1.101 2017/03/14 07:19:07 djm Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/bin:/bin:/usr/sbin:/sbin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Port 9022
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
RekeyLimit default none

# Logging
SyslogFacility AUTH
LogLevel INFO

# Authentication:

LoginGraceTime 2m
PermitRootLogin prohibit-password
StrictModes yes
MaxAuthTries 6
MaxSessions 10

PubkeyAuthentication yes

# Expect .ssh/authorized_keys2 to be disregarded by default in future.
AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2

AuthorizedPrincipalsFile none

AuthorizedKeysCommand none
AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication yes
PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no

# Kerberos options
KerberosAuthentication no
KerberosOrLocalPasswd yes
KerberosTicketCleanup yes
KerberosGetAFSToken no

# GSSAPI options
GSSAPIAuthentication no
GSSAPICleanupCredentials yes
GSSAPIStrictAcceptorCheck yes
GSSAPIKeyExchange no

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM yes

AllowAgentForwarding yes
AllowTcpForwarding yes
GatewayPorts no
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes
PermitTTY yes
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
UseLogin no
PermitUserEnvironment no
Compression delayed
ClientAliveInterval 0
ClientAliveCountMax 3
UseDNS no
PidFile /var/run/sshd.pid
MaxStartups 10:30:100
PermitTunnel no
ChrootDirectory none
VersionAddendum none

# no default banner path
Banner none

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

# override default of no subsystems
Subsystem	sftp	/usr/lib/openssh/sftp-server

# Example of overriding settings on a per-user basis
Match User anoncvs
	X11Forwarding no
	AllowTcpForwarding no
	PermitTTY no
	ForceCommand cvs server" >> /etc/ssh/sshd_config
  }
#
# Setting Permit
set_permit() {
  sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
  }
#
# Set App PUBGMM ...
clear
echo $P"$divider"$N
echo $C" 1. SSH Config Port 22"$N
echo $C" 2. SSH Config Port 9022"$N
echo $C" 3. Setting PermitRootLogin"$N
echo $C" 4. Backup Config"$N
echo $C" 5. Restore Config"$N
echo $C" e. Exit"$N
echo $P"$divider"$N
echo -n $C"[CHOOSE MENU CONFIG SSH][Press 'e' to exit] : "$N
read -r option
case $option in
	1)
	clear
	 make_config_22
	clear
	;;
	2)
	clear
	 make_config_9022
	clear
	;;
	3)
	clear
	 set_permit
	clear
	;;
	4)
	clear
	 backup_config
	clear
	;;
	5)
	clear
	 restore_config
	clear
	;;
	e)
	clear
	echo $P"$divider"$N
	echo ""
	echo $G"                       DONE                           "$N
	echo ""
	echo $G"                     By Zainal                        "$N
	echo ""
	echo $P"$divider"$N
	sleep 1
	exit 0
	;;
esac
#
# Exit ..
clear
echo $P"$divider"$N
echo $C"CURRENT CHOOSE MENU CONFIG SSH:"$R $option $N
echo $P"$divider"$N
echo $C"Bash Version:"$B $ver $N
echo $C"Released:"$B $released $N
echo $P"$divider"$N
echo -n $C"[Press 'e' to exit] : "$N
read -r option
case $option in
	e)
	clear
	echo $P"$divider"$N
	echo ""
	echo $G"                       DONE                           "$N
	echo ""
	echo $G"                     By Zainal                        "$N
	echo ""
	echo $P"$divider"$N
	sleep 1
	exit 0
	;;
esac
done
