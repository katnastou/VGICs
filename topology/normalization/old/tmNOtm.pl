#!usr/bin/perl -w
open (IN,'snpsPERtopodom.txt');

#SCN1A(Nav1.1)	0	21	0	1	1	3	9	2	17	316	126	214	273	377	146	15

print "GeneName(ProteinName)\tPathogenicity\tCondition:TM\tValue\n";

while (<IN>)
{
	if ($_=~/^(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)\t(\S+)/)
	{
		$name = $1;
		$TMpol = $3 + $4 + $6;
		$NOTMpol = $2 + $5 + $7 + $8 + $9;
		$TMpath = $11 + $12 + $14;
		$NOTMpath = $10 + $13 + $15 + $16 + $17;
		print "$name\tPathogenic\tTM\t$TMpath\n\tPolymorphism\tTM\t$TMpol\n\tPathogenic\tNOTM\t$NOTMpath\n\tPolymorphism\tNOTM\t$NOTMpol\n";
	}
}