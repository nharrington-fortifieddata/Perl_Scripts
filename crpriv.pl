# script: crpriv.pl
# Tasks: Removing Kurt Haberkamp and updating other privileges.
#
#------------------- Revision History -------------------------------------
# Date by Changes
# 05-29-2008 nlharrington Initial Release
#


use strict;
use warnings;


open FILEIN, "C:\\DATABASE.txt";
while (<FILEIN>)
{
	my($line) = $_; 
	chomp($line);

	open FILEOUT, ">crpriv.cmd";
        print FILEOUT "cd \\";
	print FILEOUT "\n";
	print FILEOUT 'SQLPLUS RMAN_BKUP/RMAN'.chr(64).$line." as sysdba \@grants.sql";
	print FILEOUT "\n";
	print FILEOUT "EXIT";
	
	`cmd /k crpriv.cmd >> C:\\crpriv.log`;
		
}

close FILEIN;
