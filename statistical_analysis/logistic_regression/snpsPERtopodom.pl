#!/usr/bin/perl -w

open (IN2,'snps_total.txt');
open (IN1,'vgicsWITHsnps.txt');

@topodom=();
@gn=();
@vgics=();
@name=();

$l=0;
$n=0;
$p=0;
$r=0;
$t=0;
$v=0;
$x=0;
$y=0;
$z=0;

print "GeneName\tProteinName\tPathogenicity\tVSD\tPoreLoop\tELs\tILs\tother\n";
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
	if ($_=~/^\S+\t(\S+)\t\S+\t\w\t\d+\t\w\t\S+\t(\S+)\t(.*)/g)
	{
		push (@gn,$1);
		push (@topodom,$2);
		push (@clinsig,$3);
	}
}

for ($j=0;$j<=$#name;$j++)
{
	for ($i=0;$i<=$#topodom;$i++)
	{
		if ($name[$j] eq $gn[$i])
		{
			if ($clinsig[$i]=~/Pathogenic/)
			{
				if ($topodom[$i]=~/S[1,2,3,4].*/)#VSD
				{
					$l++;
				}
				elsif ($topodom[$i]=~/PL.*/)#pore loop
				{
					$n++;
				}
				elsif ($topodom[$i]=~/EL.*/)#extracellular loops
				{
					$p++;
				}
				elsif ($topodom[$i]=~/IL.*/)#intracellular loops
				{
					$q++;
				}
				else #N-akro,S5,S6,C-akro
				{
					$r++;
				}
			}
			elsif ($clinsig[$i]=~/Polymorphism/)
			{
				if ($topodom[$i]=~/S[1,2,3,4].*/)#VSD
				{
					$t++;
				}
				elsif ($topodom[$i]=~/PL.*/)#pore loop
				{
					$v++;
				}
				elsif ($topodom[$i]=~/EL.*/)#extracellular loops
				{
					$x++;
				}
				elsif ($topodom[$i]=~/IL.*/)#intracellular loops
				{
					$y++;
				}
				else#N-akro,S5,S6,C-akro
				{
					$z++;
				}
			}
		}
	}
		print "$name[$j]\t$vgics[$j]\t1\t$l\t$n\t$p\t$q\t$r\n\t\t0\t$t\t$v\t$x\t$y\t$z\n";
		$l=0;
		$n=0;
		$p=0;
		$q=0;
		$r=0;
		$t=0;
		$v=0;
		$x=0;
		$y=0;
		$z=0;
}

