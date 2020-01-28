#!/usr/bin/perl
#title			:sftpCheck.pl
#description	:This script will monitor remote ftpServer.
#author			:Pardha Kaikala
#date           :20200128
#version 		:1.0
#usage			:./sftpCheck.pl <FTPSERVER> <ftp_user> <ftp_password>
#notes			: Perl with Net::SFTP is required
#==============================================================================

use strict;
use warnings;
use Net::SFTP::Foreign;

open my $ssherr, '>', '/dev/null' or die "unable to open /dev/null";

my ($host, $user, $password, $cwd) = @ARGV;

$host //= 'localhost';
$user //= 'anonymous';
$password //= '-anonymous@';

sub checksftp{
	my $sftp = Net::SFTP::Foreign->new($user.'@'.$host, 
					password => $password, 
					more => [-o => 'StrictHostKeyChecking no'], 
					stderr_fh => $ssherr);
	my $SftpConnStatus =$sftp->status;
	if( $SftpConnStatus ==0 ){
		#print $SftpConnStatus;
    	$sftp->disconnect;
    	return 1;
	}
	else
	{
		return 2;
	}
}

my $status = checksftp();
print "$status";
