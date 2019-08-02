#!/usr/bin/perl -w

open (IN2,'unclassified_snps.txt');
open (IN1,'vgics.txt');

@topodom=();
@gn=();
@vgics=();
@name=();
$k=0;
$l=0;
$m=0;
$n=0;
$o=0;
$p=0;
$q=0;
$r=0;

print "GeneName\tProteinName\tN-terminal\tVSD\tS5\tPoreLoop\tS6\tELs\tILs\tC-terminal\n";

#CACNA1B	Cav2.2

while (<IN1>)
{
	if ($_=~/^(\S+)\t(\S+)/mg)
	{
		push (@name,$1);
		push (@vgics,$2);
	}
}

#Q09470	KCNA1	Kv1.1	R	443	G	416-495	C-terminal	Unclassified

while (<IN2>)
{
	if ($_=~/^\w+\t(\w+)\t\S+\t\S\t\d+\t\S\t\S+\t(\S+)\tUnclassified/g)
	{
		push (@gn,$1);
		push (@topodom,$2);
	}
}

for ($j=0;$j<=$#name;$j++)
{
	for ($i=0;$i<=$#topodom;$i++)
	{
		if ($name[$j] eq $gn[$i])
		{
			if ($topodom[$i]=~/N-terminal/)#NH2-akro
			{
				$k++;
			}
			elsif ($topodom[$i]=~/S[1,2,3,4]\S*/)#VSD
			{
				$l++;
			}
			elsif ($topodom[$i]=~/S5\S*/)#S5
			{
				$r++;
			}
			elsif ($topodom[$i]=~/PL\d*/)#pore loop
			{
				$m++;
			}
			elsif ($topodom[$i]=~/S6\S*/)#S6
			{
				$q++;
			}
			elsif ($topodom[$i]=~/EL\d*/)#extracellular loops
			{
				$n++;
			}
			elsif ($topodom[$i]=~/IL\d*/)#intracellular loops
			{
				$o++;
			}
			elsif ($topodom[$i]=~/C-terminal/)#C-akro
			{
				$p++;
			}
		}
	}
		print "$name[$j]\t$vgics[$j]\t$k\t$l\t$r\t$m\t$q\t$n\t$o\t$p\n";
		$k=0;
		$l=0;
		$m=0;
		$n=0;
		$o=0;
		$p=0;
		$q=0;
		$r=0;
}

