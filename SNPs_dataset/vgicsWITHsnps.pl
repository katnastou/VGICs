#!/usr/bin/perl -w

open (IN,'uniqueDatasetOFsnps.txt');
open (IN1,'vgicsGENES.txt');

#CACNA1A	O00555	A	21	V	Polymorphism
#CACNA1A	O00555	A	405	T	Pathogenic
#CACNA1A	O00555	A	405	T	Unclassified

while (<IN>)
{
	if ($_=~/^(\S+)\t\S+\t\w\t\d+\t\w\tPathogenic/)
	{
		push (@path, $1);
	}
	elsif ($_=~/^(\S+)\t\S+\t\w\t\d+\t\w\tPolymorphism/)
	{
		push (@pol, $1);
	}
	if ($_=~/^(\S+)\t\S+\t\w\t\d+\t\w\tUnclassified/)
	{
		push (@unclass, $1);
	}
}

while (<IN1>)
{
	if ($_=~/^(\S+)/)
	{
		push (@gn, $1);
	}
}
print "VGICsWITHpathogenicSNPs\n";
for ($i=0;$i<=$#gn;$i++)
{
	for ($j=0;$j<=$#path;$j++)
	{
		if ($path[$j] eq $gn[$i])
		{
			$a++;
		}
	}
	if ($a != 0)
	{
		print "$gn[$i]\t$a\n";
		$a=0;
	}
}

print "\nVGICsWITHpolymorphisms\n";
for ($i=0;$i<=$#gn;$i++)
{
	for ($j=0;$j<=$#pol;$j++)
	{
		if ($pol[$j] eq $gn[$i])
		{
			$b++;
		}
	}
	if ($b != 0)
	{
		print "$gn[$i]\t$b\n";
		$b=0;
	}
}
print "\nVGICsWITHunclassifiedSNPs\n";
for ($i=0;$i<=$#gn;$i++)
{
	for ($j=0;$j<=$#unclass;$j++)
	{
		if ($unclass[$j] eq $gn[$i])
		{
			$c++;
		}
	}
	if ($c != 0)
	{
		print "$gn[$i]\t$c\n";
		$c=0;
	}
}
