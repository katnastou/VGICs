#!usr/bin/perl -w

open (IN,'normalizedNavs.txt');

#katametrhsh snps ana topologikh perioxh se kanonikopoihmena dedomena (koinh klimaka mhkous = 100 kai anagwgh snps)se ola ta print typwnontai prwta ta non pathogenic kai epeita pathogenic snps

#gn	uniprotAC	IL1:total	pathogenic	non pathogenic	S1DI:total	pathogenic	non pathogenic ... IL13:total	pathogenic	non pathogenic
#SCN1A	Nav1.1	14	1	13	100	12	6	6	100	12	6	6	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	50	39	11	100	6	6	0	100	32	16	16	100	6	3	3	100	21	17	4	100	3	1	2	100	6	0	6	100	7	0	7	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	17	17	0	100	0	0	0	100	11	11	0	100	4	2	2	100	21	17	4	100	3	0	3	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	10	0	10	100	11	11	0	100	0	0	0	100	11	11	0	100	4	3	1	100	12	8	4	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	17	17	0	100	22	0	22	100	16	5	11	100	2	1	1	100	0	0	0	100	1	0	1	100	331	198	133	4900

print "Gene(Protein Name)	Pathogenicity	TM	ILproximal	ILdistant	ELs	Other	TM	ILproximal	ILdistant	ELs	Other\n";

while (<IN>)
{
	for ($i=0;$i<60;$i++)
	{
		if ($_=~/^(\w+)\t(\S+)\t(\S+\t\S+\t\S+\t100\t){$i}\S+\t(\S+)\t(\S+)\t100.*/)
		{
			$gn = $1;
			$name = $2;
			if ($i == 0 || $i == 12 || $i == 27 || $i == 42 || $i == 57 || $i == 59) #N,C,PL
			{
				$otherpath = $4;
				$otherpol =$5;
			}
			elsif ($i == 4 || $i == 9 || $i == 14 || $i == 19 || $i == 24 || $i == 29 || $i == 34 || $i == 39 || $i == 44 || $i == 49 || $i == 54) #IL prox
			{
				$proxpath += $4; 
				$proxpol += $5;
			}
			elsif ($i == 5 || $i == 10 || $i == 15 || $i == 20 || $i == 25 || $i == 30 || $i == 35 || $i == 40 || $i == 45 || $i == 50 || $i == 55) #ILs
			{
				$ilpath += $4;
				$ilpol += $5;
			}
			elsif ($i == 2 || $i == 7 || $i == 17 || $i == 22 || $i == 32 || $i == 37 || $i == 47 || $i == 52) #ELs
			{
				$elpath += $4;
				$elpol += $5;
			}
			else
			{
				$tmpath += $4;
				$tmpol += $5;
			}
		}
	}
	print $gn,'(',$name,')',"\tPathogenic\t$tmpath\t$ilpath\t$proxpath\t$elpath\t$otherpath\n\tPolymorphism\t$tmpol\t$ilpol\t$proxpol\t$elpol\t$otherpol\n";
	$tmpath=0;
	$tmpol=0;
	$proxpath=0;
	$proxpol=0;
	$ilpath=0;
	$ilpol=0;
	$elpath=0;
	$elpol=0;
}
close IN;

open (IN1,'normalizedCavs.txt');

#working_on_kvs_normalized_dataset:counting snps per topodom (vsd,s5-s6,pl,il,el)

#gn	uniprotAC	IL1:total	pathogenic	non pathogenic	S1DI:total	pathogenic	non pathogenic ... IL13:total	pathogenic	non pathogenic
#CACNA1I	Cav3.3	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	6	0	6	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	6	0	6	49000

while (<IN1>)
{
	for ($i=0;$i<60;$i++)
	{
		if ($_=~/^(\w+)\t(\S+)\t(\S+\t\S+\t\S+\t100\t){$i}\S+\t(\S+)\t(\S+)\t100.*/)
		{
			$gn = $1;
			$name = $2;
			if ($i == 0 || $i == 12 || $i == 27 || $i == 42 || $i == 57 || $i == 59) #N,C,PL
			{
				$otherpath = $4;
				$otherpol =$5;
			}
			elsif ($i == 4 || $i == 9 || $i == 14 || $i == 19 || $i == 24 || $i == 29 || $i == 34 || $i == 39 || $i == 44 || $i == 49 || $i == 54) #IL prox
			{
				$proxpath += $4; 
				$proxpol += $5;
			}
			elsif ($i == 5 || $i == 10 || $i == 15 || $i == 20 || $i == 25 || $i == 30 || $i == 35 || $i == 40 || $i == 45 || $i == 50 || $i == 55) #ILs
			{
				$ilpath += $4;
				$ilpol += $5;
			}
			elsif ($i == 2 || $i == 7 || $i == 17 || $i == 22 || $i == 32 || $i == 37 || $i == 47 || $i == 52) #ELs
			{
				$elpath += $4;
				$elpol += $5;
			}
			else
			{
				$tmpath += $4;
				$tmpol += $5;
			}
		}
	}
	print $gn,'(',$name,')',"\tPathogenic\t$tmpath\t$ilpath\t$proxpath\t$elpath\t$otherpath\n\tPolymorphism\t$tmpol\t$ilpol\t$proxpol\t$elpol\t$otherpol\n";
	$tmpath=0;
	$tmpol=0;
	$proxpath=0;
	$proxpol=0;
	$ilpath=0;
	$ilpol=0;
	$elpath=0;
	$elpol=0;
}

close IN1;

open (IN2,'normalizedKvs.txt');

#working_on_kvs_normalized_dataset

#gn	uniprotAC	IL1:total	pathogenic	non pathogenic	S1:total	pathogenic	non pathogenic ... IL4:total	pathogenic	non pathogenic
#KCNA1	Kv1.1	0	0	0	100	18.18181818	18.18181818	0	100	0	0	0	100	27.27272727	27.27272727	0	100	20	20	0	100	16.66666667	16.66666667	0	100	4.761904762	4.761904762	0	100	0	0	0	100	4.761904762	4.761904762	0	100	0	0	0	100	10	10	0	100	13.63636364	13.63636364	0	100	0	0	0	100	24.13793103	24.13793103	0	100	0	0	0	100	139.4193163	139.4193163	0	1300
#KCNA2	Kv1.2	0.625	0.625	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	4.761904762	4.761904762	0	100	0	0	0	100	14.28571429	14.28571429	0	100	0	0	0	100	20	20	0	100	9.090909091	9.090909091	0	100	7.317073171	7.317073171	0	100	10.34482759	10.34482759	0	100	0	0	0	100	66.4254289	66.4254289	0	1300


while (<IN2>)
{
	for ($i=0;$i<15;$i++)
	{
		if ($_=~/^(\w+)\t(\S+)\t(\S+\t\S+\t\S+\t100\t){$i}\S+\t(\S+)\t(\S+)\t100.*/)
		{
			$gn = $1;
			$name = $2;
			if ($i == 0 || $i == 12 || $i == 14)
			{
				$otherpath = $4;
				$otherpol =$5;
			}
			elsif ($i == 1 || $i == 3 || $i == 6 || $i == 8 || $i == 11 || $i == 13)
			{
				$tmpath += $4;
				$tmpol += $5;

			}
			elsif ($i == 4 || $i == 9)
			{
				$proxpath += $4;
				$proxpol += $5;

			}
			elsif ($i == 5 || $i == 10)
			{
				$ilpath += $4;
				$ilpol += $5;
			}
			else
			{
				$elpath += $4;
				$elpol += $5;
			}
		}
	}
	print $gn,'(',$name,')',"\tPathogenic\t$tmpath\t$ilpath\t$proxpath\t$elpath\t$otherpath\n\tPolymorphism\t$tmpol\t$ilpol\t$proxpol\t$elpol\t$otherpol\n";
	$tmpath=0;
	$tmpol=0;
	$proxpath=0;
	$proxpol=0;
	$ilpath=0;
	$ilpol=0;
	$elpath=0;
	$elpol=0;
}

close IN2;
