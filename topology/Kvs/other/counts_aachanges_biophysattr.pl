#!/usr/bin/perl -w 

#for_kvs_with_snps:discriminates_pathogenic(1)_and_non-pathogenic(0)_snps+counts_aachanges

open (IN, 'kvs_aachanges_+_pathogenicity.txt');

@gns = ("KCNA1","KCNA10","KCNA2","KCNA3","KCNA4","KCNA5","KCNA6","KCNA7","KCNB1","KCNB2","KCNC1","KCNC2","KCNC3",
"KCNC4","KCND1","KCND2","KCND3","KCNF1","KCNG1","KCNG2","KCNG3","KCNG4","KCNH1","KCNH2","KCNH3","KCNH4","KCNH5",
"KCNH6","KCNH7","KCNH8","KCNQ1","KCNQ2","KCNQ3","KCNQ4","KCNQ5","KCNS1","KCNS2","KCNS3","KCNV1","KCNV2",);

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


#Q09470	KCNA1	Kv1.1	non-polar	400	non-polar	387-415	S6	Unclassified

print "gene_name\tpathogenicity\tpolar to polar\tpolar to non-polar\tpolar to charged\tnon-polar to polar\tnon-polar to non-polar\tnon-polar to charged\tcharged to polar\tcharged to non-polar\tcharged to charged\n";

while(<IN>)
{
	if ($_=~/^\S+\t(\S+)\t\S+\t(\S+)\t\d+\t(\S+)\t\S+\t\S+\t(.*)/g)
	{
		push (@pathogenicity, $4);
		push (@gene, $1);
		push (@normaatosnp, "$2-$3");
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
				elsif($normaatosnp[$i]=~/^polar\-non\-polar/g)
				{
					$l++;
				}
				elsif($normaatosnp[$i]=~/^polar\-charged/g)
				{
					$m++;
				}
				elsif($normaatosnp[$i]=~/^non\-polar\-polar/g)
				{
					$n++;
				}
				elsif($normaatosnp[$i]=~/^non\-polar\-non\-polar/g)
				{
					$o++;
				}
				elsif($normaatosnp[$i]=~/^non\-polar\-charged/g)
				{
					$p++;
				}
				elsif($normaatosnp[$i]=~/^charged\-polar/g)
				{
					$q++;
				}
				elsif($normaatosnp[$i]=~/^charged\-non\-polar/g)
				{
					$r++;
				}
				elsif($normaatosnp[$i]=~/^charged\-charged/g)
				{
					$s++;
				}
			}
			elsif ($pathogenicity[$i]=~/^Polymorphism/g)
			{
				if ($normaatosnp[$i]=~/^polar\-polar/g)
				{
					$ki++;
				}
				elsif($normaatosnp[$i]=~/^polar\-non\-polar/g)
				{
					$li++;
				}
				elsif($normaatosnp[$i]=~/^polar\-charged/g)
				{
					$mi++;
				}
				elsif($normaatosnp[$i]=~/^non\-polar\-polar/g)
				{
					$ni++;
				}
				elsif($normaatosnp[$i]=~/^non\-polar\-non\-polar/g)
				{
					$oi++;
				}
				elsif($normaatosnp[$i]=~/^non\-polar\-charged/g)
				{
					$pi++;
				}
				elsif($normaatosnp[$i]=~/^charged\-polar/g)
				{
					$qi++;
				}
				elsif($normaatosnp[$i]=~/^charged\-non\-polar/g)
				{
					$ri++;
				}
				elsif($normaatosnp[$i]=~/^charged\-charged/g)
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