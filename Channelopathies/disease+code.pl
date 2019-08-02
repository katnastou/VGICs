#!/usr/bin/perl -w 

#a full record of channelopathies

open (IN, 'listOFchannelopathies.txt');
open (IN1, 'recordOFsnpsANDdisease.txt');

@all =();
@disease =();
@category =();
@name =();

#CACNA1A	O00555	C	1869	R	Episodic ataxia 2

while (<IN1>)
{
	if ($_=~/^(\S+\t\S+\t\w\t\d+\t\w)\t(.*)\n/)
	{
		push (@all , $1);
		push (@disease , $2);
	}
}
#print $#disease;


#ND	Aaland island eye disease

while (<IN>)
{
	if ($_=~/(\S+)\t(.*)/)
	{
		push (@category, $1);
		push (@name, $2);
	}
}

#print $#name;

for ($i=0;$i<=$#name;$i++)
{
	for ($j=0;$j<=$#disease;$j++)
	{
		if ($disease[$j] eq $name[$i])
		{
			print "$all[$j]\t$category[$i]\t$disease[$j]\n";
		}
	}
}
