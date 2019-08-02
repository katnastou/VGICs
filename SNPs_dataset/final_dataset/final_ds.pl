#!usr/bin/perl -w

open (IN,'clinvar_ds.txt');
open (IN1,'uniprot_ds.txt');

#CACNA1A	O00555	I	1810	L	Pathogenic
#CACNA1A	O00555	R	1661	H	Pathogenic
while (<IN>)
{
	if ($_=~/(\S+\t\S+\t\w{1}\t\d+\t\w{1}).*/)
	{
		push (@all, $_);#ολη η γραμμη σαν value του πινακα
		push (@clinvar, $1);#εδω δεν τραβαμε το clinical significance,ωστε να γινει η ανιχνευση των κοινων snp μετα
	}
}
#print "$#clinvar\t$#all";

#KCNA1	Q09470	V	408	A	Disease
#KCNA1	Q09470	I	400	V	Unclassified
while (<IN1>)
{
	if ($_=~/(\S+\t\S+\t\w{1}\t\d+\t\w{1}).*/)
	{
		push (@alles, $_);
		push (@uniprot, $1);
	}
}
#print "$#uniprot\t$#alles";


for ($i=0;$i<=$#uniprot;$i++)
{
	for ($j=0;$j<=$#clinvar;$j++)
	{
		if ($clinvar[$j]=~/$uniprot[$i]/)
		{
			push (@unique, $clinvar[$j]); #κρατας σε πινακα τις κοινες εγγραφες μεταξυ των δυο βασεων.Στη συνεχεια θα απαλοιφθουν απο τη UniProt και θα μεινουν μονο οι αναφορες της ClinVar
			push (@unique_info, $all[$j]);
		}
	}
}
#print $#unique; 

for ($i=0;$i<=$#uniprot;$i++)
{
	for ($j=0;$j<=$#unique;$j++)
	{
		if ($uniprot[$i]=~/$unique[$j]/)
		{
			undef $alles[$i];#σε περιπτωση που κανει match, κανει undef τη γραμμη στον πινακα alles
		}
	}
}
@uniqueUniProt = grep { defined($_)}@alles; #εδω κραταει σε νεο πινακα μονο τις defined εγγραφες που εχουν απομεινει απο τον πινακα alles. Στην ουσια ειναι και οι εγγραφες που ειναι μοναδικες στη βαση UniProt
#print $#uniqueUniProt."\n"; 

for ($a=0;$a<=$#uniqueUniProt;$a++)
{
	$uniqueUniProt[$a]=~s/Disease/Pathogenic/;
	print $uniqueUniProt[$a];
}

for ($i=0;$i<=$#clinvar;$i++)
{
	for ($j=0;$j<=$#unique;$j++)
	{
		if ($clinvar[$i]=~/$unique[$j]/)
		{
			undef $all[$i];#σε περιπτωση που κανει match, κανει undef τη γραμμη στον πινακα all
		}
	}
}

@uniqueClinVar = grep { defined($_)}@all; #εδω κραταει σε νεο πινακα μονο τις defined εγγραφες που εχουν απομεινει απο τον πινακα all. Στην ουσια ειναι και οι εγγραφες που ειναι μοναδικες στη βαση ClinVar
#print $#uniqueClinVar."\n"; 

for ($b=0;$b<=$#uniqueClinVar;$b++)
{
	$uniqueClinVar[$b]=~s/Likely\spathogenic/Pathogenic/;
	$uniqueClinVar[$b]=~s/Likely\sbenign/Polymorphism/;
	$uniqueClinVar[$b]=~s/Benign/Polymorphism/;
	$uniqueClinVar[$b]=~s/risk\sfactor/Polymorphism/;
	$uniqueClinVar[$b]=~s/not\sprovided/Unclassified/;
	$uniqueClinVar[$b]=~s/not\sreported/Unclassified/;
	$uniqueClinVar[$b]=~s/Uncertain\ssignificance/Unclassified/;
	$uniqueClinVar[$b]=~s/Conflicting\sinterpretations\sof\spathogenicity/Unclassified/;
	$uniqueClinVar[$b]=~s/no interpretation for the single variant/Unclassified/;
	print $uniqueClinVar[$b];
}

for ($b=0;$b<=$#unique_info;$b++)
{
	$unique_info[$b]=~s/Likely\spathogenic/Pathogenic/;
	$unique_info[$b]=~s/Likely\sbenign/Polymorphism/;
	$unique_info[$b]=~s/Benign/Polymorphism/;
	$unique_info[$b]=~s/risk\sfactor/Polymorphism/;
	$unique_info[$b]=~s/not\sprovided/Unclassified/;
	$unique_info[$b]=~s/not\sreported/Unclassified/;
	$unique_info[$b]=~s/Uncertain\ssignificance/Unclassified/;
	$unique_info[$b]=~s/Conflicting\sinterpretations\sof\spathogenicity/Unclassified/;
	$unique_info[$b]=~s/no interpretation for the single variant/Unclassified/;
	print $unique_info[$b];
}

#το output 8elei sortasisma (entolh sort -u sth grammh entolwn)