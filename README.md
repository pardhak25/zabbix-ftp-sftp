# zabbix-ftp-sftp

Zabbix FTP and SFTP monitring Template

# Metrics

* Response Code: 1=OK, 2=Failed

# Prerequisites

* perl
* perl::NET::FTP
* perl::NET::SFTP::Foreign

# How to install
* Download the ftpCheck.pl and sftpCheck.pl files to your **Zabbix Server**
  external script directory (Or your proxy if the servers are behind a Zabbix proxy)
  For example ExternalScripts=/usr/lib/zabbix/externalscripts
* Make it executable
* Import the templates for the different check types in your zabbix server
* Assign the templates to the hosts you wish to monitor

# Paramerets
* {$FTP_HOST} - FTP Host
* {$FTP_USER} - FTP Login Username
* {$FTP_PASSWORD} - FTP Password
* {$SFTP_HOST} - (S)FTP Host
* {$SFTP_USER} - (S)FTP Login Username
* {$SFTP_PASSWORD} - (S)FTP Password