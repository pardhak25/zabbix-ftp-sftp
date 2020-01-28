#!/usr/bin/perl
#title			:ftpCheck.pl
#description	:This script will monitor remote ftpServer.
#author			:Pardha Kaikala
#date           :20200128
#version 		:1.0
#usage			:./ftpCheck.pl <FTPSERVER> <ftp_user> <ftp_password>
#notes			: Perl with Net::FTP is required
#==============================================================================

use strict;
use warnings;
use Net::FTP;


my ($host, $user, $password, $cwd) = @ARGV;

$host //= 'localhost';
$user //= 'anonymous';
$password //= '-anonymous@';

sub checkftp{
	my $ftp;
	if($ftp=Net::FTP->new($host)){
		if($ftp->login($user, $password)){
			$ftp->quit;
		}else{
			return 3;
		}
		return 1;
	};
	return 2;
}
my $status = checkftp();
print "$status";
