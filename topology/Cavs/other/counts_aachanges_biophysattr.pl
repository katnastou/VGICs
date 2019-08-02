#!/usr/bin/perl -w 

open (IN, 'cavs_aachanges_+_pathogenicity.txt');

@gns = ("CACNA1A","CACNA1B","CACNA1C","CACNA1D","CACNA1E","CACNA1F","CACNA1G","CACNA1H","CACNA1I","CACNA1S");

$k=0;
$l=0;
$m=0;
$n=0;
$o=0;
$p=0;
$q=0;
$r=0;
$s=0;
$ki=0;
$li=0;
$mi=0;
$ni=0;
$oi=0;
$pi=0;
$qi=0;
$ri=0;
$si=0;

#O95180	CACNA1H	Cav3.2	non-polar	2173	polar	1864-2353	C-terminal	Polymorphism

print "gene_name\tpathogenicity\tpolar to polar\tpolar to non-polar\tpolar to charged\tnon-polar to polar\tnon-polar to non-polar\tnon-polar to charged\tcharged to polar\tcharged to non-polar\tcharged to charged\n";

while(<IN>)
{
	if ($_=~/^(\S+)\t(\S+)\t(\S+)\t(\S+)\t\d+\t(\S+)\t(\S+)\t(\S+)\t(.*)/g)
	{
		push (@pathogenicity, $8);
		push (@gene, $2);
		push (@normaatosnp, "$4-$5");
	}
}

for ($j=0;$j<=$#gns;$j++)
{
	for ($i=0;$i<=$#normaatosnp;$i++)
	{
		if ($gns[$j] eq $gene[$i])
		{
			if ($pathogenicity[$i]=~/^Pathogenic/g)
			{
				if ($normaatosnp[$i]=~/^polar\-polar/g)
				{
					$k++;
				}
				if($normaatosnp[$i]=~/^polar\-non\-polar/g)
				{
					$l++;
				}
				if($normaatosnp[$i]=~/^polar\-charged/g)
				{
					$m++;
				}
				if($normaatosnp[$i]=~/^non\-polar\-polar/g)
				{
					$n++;
				}
				if($normaatosnp[$i]=~/^non\-polar\-non\-polar/g)
				{
					$o++;
				}
				if($normaatosnp[$i]=~/^non\-polar\-charged/g)
				{
					$p++;
				}
				if($normaatosnp[$i]=~/^charged\-polar/g)
				{
					$q++;
				}
				if($normaatosnp[$i]=~/^charged\-non\-polar/g)
				{
					$r++;
				}
				if($normaatosnp[$i]=~/^charged\-charged/g)
				{
					$s++;
				}
			}
			if ($pathogenicity[$i]=~/^Polymorphism/g)
			{
				if ($normaatosnp[$i]=~/^polar\-polar/g)
				{
					$ki++;
				}
				if($normaatosnp[$i]=~/^polar\-non\-polar/g)
				{
					$li++;
				}
				if($normaatosnp[$i]=~/^polar\-charged/g)
				{
					$mi++;
				}
				if($normaatosnp[$i]=~/^non\-polar\-polar/g)
				{
					$ni++;
				}
				if($normaatosnp[$i]=~/^non\-polar\-non-polar/g)
				{
					$oi++;
				}
				if($normaatosnp[$i]=~/^non\-polar\-charged/g)
				{
					$pi++;
				}
				if($normaatosnp[$i]=~/^charged\-polar/g)
				{
					$qi++;
				}
				if($normaatosnp[$i]=~/^charged\-non\-polar/g)
				{
					$ri++;
				}
				if($normaatosnp[$i]=~/^charged\-charged/g)
				{
					$si++;
				}
			}
		}
	}
		print "$gns[$j]\t"."1"."\t$k\t$l\t$m\t$n\t$o\t$p\t$q\t$r\t$s\n\t0\t$ki\t$li\t$mi\t$ni\t$oi\t$pi\t$qi\t$ri\t$si\n";
		$k=0;
		$l=0;
		$m=0;
		$n=0;
		$o=0;
		$p=0;
		$q=0;
		$r=0;
		$s=0;
		$ki=0;
		$li=0;
		$mi=0;
		$ni=0;
		$oi=0;
		$pi=0;
		$qi=0;
		$ri=0;
		$si=0;
}