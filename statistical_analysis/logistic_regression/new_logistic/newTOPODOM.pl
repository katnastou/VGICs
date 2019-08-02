#!/usr/bin/perl -w

open (IN2,'snps_total.txt');
open (IN1,'vgicsWITHsnps.txt');

@topodom=();
@gn=();
@vgics=();
@name=();

$np=0;
$s1p=0;
$s2p=0;
$s3p=0;
$s4p=0;
$s5p=0;
$plp=0;
$s6p=0;
$elp=0;
$ilp=0;
$cp=0;
$nnp=0;
$s1np=0;
$s2np=0;
$s3np=0;
$s4np=0;
$s5np=0;
$plnp=0;
$s6np=0;
$elnp=0;
$ilnp=0;
$cnp=0;

print "GeneName\tProteinName\tPathogenicity\tN-terminal\tS1\tS2\tS3\tS4\tS5\tPoreLoop\tS6\tELs\tILs\tC-terminal\n";
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
				if ($topodom[$i]=~/N\-terminal/)#N-akro
				{
					$np++;
				}
				elsif ($topodom[$i]=~/S1.*/)#S1
				{
					$s1p++;
				}
				elsif ($topodom[$i]=~/S2.*/)#S2
				{
					$s2p++;
				}
				elsif ($topodom[$i]=~/S3.*/)#S3
				{
					$s3p++;
				}
				elsif ($topodom[$i]=~/S4.*/)#S4
				{
					$s4p++;
				}
				elsif ($topodom[$i]=~/S5.*/)#S5
				{
					$s5p++;
				}
				elsif ($topodom[$i]=~/PL.*/)#pore loop
				{
					$plp++;
				}
				elsif ($topodom[$i]=~/S6.*/)#S6
				{
					$s6p++;
				}
				elsif ($topodom[$i]=~/EL.*/)#extracellular loops
				{
					$elp++;
				}
				elsif ($topodom[$i]=~/IL.*/)#intracellular loops
				{
					$ilp++;
				}
				else #C-akro
				{
					$cp++;
				}
			}
			elsif ($clinsig[$i]=~/Polymorphism/)
			{
				if ($topodom[$i]=~/N\-terminal/)#N-akro
				{
					$nnp++;
				}
				elsif ($topodom[$i]=~/S1.*/)#S1
				{
					$s1np++;
				}
				elsif ($topodom[$i]=~/S2.*/)#S2
				{
					$s2np++;
				}
				elsif ($topodom[$i]=~/S3.*/)#S3
				{
					$s3np++;
				}
				elsif ($topodom[$i]=~/S4.*/)#S4
				{
					$s4np++;
				}
				elsif ($topodom[$i]=~/S5.*/)#S5
				{
					$s5np++;
				}
				elsif ($topodom[$i]=~/PL.*/)#pore loop
				{
					$plnp++;
				}
				elsif ($topodom[$i]=~/S6.*/)#S6
				{
					$s6np++;
				}
				elsif ($topodom[$i]=~/EL.*/)#extracellular loops
				{
					$elnp++;
				}
				elsif ($topodom[$i]=~/IL.*/)#intracellular loops
				{
					$ilnp++;
				}
				else #C-akro
				{
					$cnp++;
				}
			}
		}
	}
		print "$name[$j]\t$vgics[$j]\t1\t$np\t$s1p\t$s2p\t$s3p\t$s4p\t$s5p\t$plp\t$s6p\t$elp\t$ilp\t$cp\n\t\t0\t$nnp\t$s1np\t$s2np\t$s3np\t$s4np\t$s5np\t$plnp\t$s6np\t$elnp\t$ilnp\t$cnp\n";
		$np=0;
		$s1p=0;
		$s2p=0;
		$s3p=0;
		$s4p=0;
		$s5p=0;
		$plp=0;
		$s6p=0;
		$elp=0;
		$ilp=0;
		$cp=0;
		$nnp=0;
		$s1np=0;
		$s2np=0;
		$s3np=0;
		$s4np=0;
		$s5np=0;
		$plnp=0;
		$s6np=0;
		$elnp=0;
		$ilnp=0;
		$cnp=0;
}

