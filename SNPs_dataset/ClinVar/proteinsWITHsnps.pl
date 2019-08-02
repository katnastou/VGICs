#!/usr/bin/perl -w

open (IN,'GRCh38_variants.txt');

@proteins=();
@name=();
@clinsig=();
$k=0;
$l=0;
$m=0;
$a=0;
$b=0;
$c=0;

while (<IN>)
{
	if ($_=~/\tPathogenic|Likely\spathogenic|Benign|Likely\sbenign|Uncertain\ssignificance|not\sprovided|not\sreporteds/g)#κραταει εγγραφες με κλινικο χαρακτηρισμο εναν απο αυτους που χρησιμοποιουνται και για την περιγραφη των SNPs στα VGICs
	{
		push (@proteins, $_);
	}
}

foreach $a (@proteins)#κραταει σε πινακες ολα τα SNPs 
{
	if ($a=~/\d+\tsingle\snucleotide\svariant\t\wM_\S+\s\S+\t(\d+|\-1)\t(\S+)\t\S+\t(\w+\s{0,1}\D*)\t/)
	{
		push (@name, $2);
		push (@clinsig, $3);
	}
}
#print $#name;
foreach $n (@name)
{
	$n=~s/\;\S*//;
}

foreach $b (@clinsig)#μορφοποιηση του κλινικου χαρακτηρισμου οπως και στο συνολο δεδομενων των SNPs, δλδ: Pathogenic, Polymorphism και Unclassified
{
	$b=~s/\;.*//;
	$b=~s/Likely\spathogenic/Pathogenic/;
	$b=~s/Likely\sbenign/Polymorphism/;
	$b=~s/Benign/Polymorphism/;
	$b=~s/risk\sfactor/Polymorphism/;
	$b=~s/not\sprovided/Unclassified/;
	$b=~s/not\sreported/Unclassified/;
	$b=~s/Uncertain\ssignificance/Unclassified/;
	#print "$b\n";
}

for ($i=0;$i<=$#name;$i++)
{
	if ($clinsig[$i]=~/Pathogenic/)
	{
		$k++;
		if ($name[$i] ne $name[$i+1])#για καθε εγγραφη τσεκαρει αν το ονομα του γονιδιου ειναι ιδιο με την επομενη.
		{
			$a++;#εφοσον δεν ειναι ιδιο το ονομα προσθετει ενα στον counter που μετραει το συνολο των γονιδιων που εχουν αναφορα για pathogenic snps.
		}
		else
		{
			next;
		}
	}
	elsif ($clinsig[$i]=~/Polymorphism/)
	{
		$l++;
		if ($name[$i] ne $name[$i+1])#εδω για polymorphisms
		{
			$b++;
		}
		else
		{
			next;
		}
	}
	elsif ($clinsig[$i]=~/Unclassified/)#eδω για unclassified snps
	{
		$m++;
		if ($name[$i] ne $name[$i+1])
		{
			$c++;
		}
		else
		{
			next;
		}
	}
}
print "NumberOFgenesWITHpathogenicSNPs\tnumberOFrecords\n$a\t$k\n
NumberOFgenesWITHpolymorphisms\tnumberOFrecords\n$b\t$l\n
NumberOFgenesWITHunclassifedSNPs\tnumberOFrecords\n$c\t$m";