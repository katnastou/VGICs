#!usr/bin/perl -w

open (IN, 'diseases.clinvar');
open (IN1, 'diseases.uniprot');

#CACNA1C	Q13936	V	2011	I	Cardiac arrhythmia
#CACNA1C	Q13936	G	406	R	Timothy syndrome

while (<IN>)
{
	if ($_=~/^\S+\t\S+\t\w{1}\t\d+\t\w{1}\t.*/)
	{
		chomp $_;
		push (@all, $_);
		push (@clinvar, $_);
	}
}

#print $#clinvar;

#SCN10A	Q9Y5Y9	L	554	P	Episodic pain syndrome, familial, 2

while (<IN1>)
{
	if ($_=~/^\S+\t\S+\t\w{1}\t\d+\t\w{1}\t\N/)
	{
		chomp $_;
		push (@alles, $_);
		push (@uniprot, $_);
	}
}


for ($c=0;$c <= $#clinvar; $c++)#εδω διορθωνουμε την ονομασια ορισμενων ασθενειων που καταγραφονται με διαφορετικο τροπο στις 2 βασεις, ωστε να υπαρχει κοινος κωδικας αναφορας
{
	$clinvar[$c]=~s/Congenital stationary night blindness, type 2A, severe/Congenital stationary night blindness, type 2A/;
	$clinvar[$c]=~s/Myokymia 1 with hypomagnesemia/Myokymia 1/;
	$clinvar[$c]=~s/Congenital myasthenic syndrome, acetazolamide-responsive/Congenital  myasthenic syndrome/;
	$clinvar[$c]=~s/Hyperkalemic Periodic Paralysis Type 1/Periodic paralysis hyperkalemic/;
	$clinvar[$c]=~s/Normokalemic periodic paralysis, potassium-sensitive/Periodic paralysis hyperkalemic/;
	$clinvar[$c]=~s/Hypokalemic periodic paralysis 1/Periodic paralysis hypokalemic 1/;
	$clinvar[$c]=~s/Hypokalemic periodic paralysis, type 2/Periodic paralysis hypokalemic 2/;
	$clinvar[$c]=~s/DFNA 2 Nonsyndromic Hearing Loss/Non-syndromic genetic deafness/;
	$clinvar[$c]=~s/Small fiber neuropathy/Primary erythromelalgia/;
	$clinvar[$c]=~s/EPILEPSY, FAMILIAL FOCAL, WITH VARIABLE FOCI 4/Epilepsy, familial focal, with variable foci 4/;
	$all[$c]=~s/Congenital stationary night blindness, type 2A, severe/Congenital stationary night blindness, type 2A/;
	$all[$c]=~s/Myokymia 1 with hypomagnesemia/Myokymia 1/;
	$all[$c]=~s/Congenital myasthenic syndrome, acetazolamide-responsive/Congenital myasthenic syndrome/;
	$all[$c]=~s/Hyperkalemic Periodic Paralysis Type 1/Periodic paralysis hyperkalemic/;
	$all[$c]=~s/Normokalemic periodic paralysis, potassium-sensitive/Periodic paralysis hyperkalemic/;
	$all[$c]=~s/Hypokalemic periodic paralysis 1/Periodic paralysis hypokalemic 1/;
	$all[$c]=~s/Hypokalemic periodic paralysis, type 2/Periodic paralysis hypokalemic 2/;
	$all[$c]=~s/DFNA 2 Nonsyndromic Hearing Loss/Non-syndromic genetic deafness/;
	$all[$c]=~s/Small fiber neuropathy/Primary erythromelalgia/;
	$all[$c]=~s/EPILEPSY, FAMILIAL FOCAL, WITH VARIABLE FOCI 4/Epilepsy, familial focal, with variable foci 4/;
}



for ($a=0;$a <= $#uniprot; $a++)#εδω διορθωνουμε την ονομασια ορισμενων ασθενειων που καταγραφονται με διαφορετικο τροπο στις 2 βασεις, ωστε να υπαρχει κοινος κωδικας αναφορας
{
	$uniprot[$a]=~s/Epileptic encephalopathy, early infantile, 11/Early infantile epileptic encephalopathy 11/;
	$uniprot[$a]=~s/Epileptic encephalopathy, early infantile, 62/Early infantile epileptic encephalopathy 62/;
	$uniprot[$a]=~s/\tencephalopathy, early infantile, 11/\tEarly infantile epileptic encephalopathy 11/;
	$uniprot[$a]=~s/Epileptic encephalopathy, early infantile, 13/Early infantile epileptic encephalopathy 13/;
	$uniprot[$a]=~s/\tencephalopathy, early infantile, 13/\tEarly infantile epileptic encephalopathy 13/;
	$uniprot[$a]=~s/Epileptic encephalopathy, early infantile, 7/Early infantile epileptic encephalopathy 7/;
	$uniprot[$a]=~s/\tencephalopathy, early infantile, 7/\tEarly infantile epileptic encephalopathy 7/;
	$uniprot[$a]=~s/\tencephalopathy, early infantile, 6/\tEpileptic encephalopathy, early infantile, 6/;
	$uniprot[$a]=~s/Febrile seizures, familial, 3B/Febrile seizures, familial, 3b/;
	$uniprot[$a]=~s/Generalized epilepsy with febrile seizures plus 2/Generalized epilepsy with febrile seizures plus, type 2/;
	$uniprot[$a]=~s/Neuropathy, hereditary sensory and autonomic, 7/Neuropathy, hereditary sensory and autonomic, type VII/;
	$uniprot[$a]=~s/Generalized epilepsy with febrile seizures plus 7/Generalized epilepsy with febrile seizures plus, type 7/;
	$uniprot[$a]=~s/Episodic ataxia 1/Episodic ataxia type 1/;
	$uniprot[$a]=~s/Episodic ataxia 2/Episodic ataxia type 2/;
	$uniprot[$a]=~s/Primary erythermalgia/Primary erythromelalgia/;
	$uniprot[$a]=~s/Night blindness, congenital stationary, 2A/Congenital stationary night blindness, type 2A/;
	$uniprot[$a]=~s/Deafness, autosomal dominant, 2A/Non-syndromic genetic deafness/;
	$uniprot[$a]=~s/Myokymia isolated 1/Myokymia 1/;
	$uniprot[$a]=~s/Myasthenic syndrome, congenital, 16/Congenital myasthenic syndrome/;
	$uniprot[$a]=~s/Migraine, familial hemiplegic, 1/Familial hemiplegic migraine type 1/;
	$uniprot[$a]=~s/Migraine, familial hemiplegic, 3/Familial hemiplegic migraine type 3/;
	$uniprot[$a]=~s/Periodic paralysis normokalemic/Periodic paralysis hyperkalemic/;
	$uniprot[$a]=~s/\tbenign familial infantile, 3/\tSeizures benign familial infantile, 3/;
	$uniprot[$a]=~s/\tbenign familial neonatal 1/\tSeizures benign familial neonatal 1/;
	$uniprot[$a]=~s/\tcongenita of von Eulenburg/\tParamyotonia congenita of von Eulenburg/;
	$uniprot[$a]=~s/\tepilepsy with febrile seizures plus 2/\tGeneralized epilepsy with febrile seizures plus, type 2/;
	$uniprot[$a]=~s/\tto pain, congenital, autosomal, recessive/\tIndifference to pain, congenital, autosomal, recessive/;
	$uniprot[$a]=~s/\textreme pain disorder/\tParoxymal extreme pain disorder/;
	$uniprot[$a]=~s/\tretardation, autosomal dominant 46/\tMENTAL RETARDATION, AUTOSOMAL DOMINANT 46/;
	$uniprot[$a]=~s/\tsyndrome 1/\tBrugada syndrome 1/;
	$alles[$a]=~s/Epileptic encephalopathy, early infantile, 11/Early infantile epileptic encephalopathy 11/;
	$alles[$a]=~s/Epileptic encephalopathy, early infantile, 62/Early infantile epileptic encephalopathy 62/;
	$alles[$a]=~s/\tencephalopathy, early infantile, 11/\tEarly infantile epileptic encephalopathy 11/;
	$alles[$a]=~s/Epileptic encephalopathy, early infantile, 13/Early infantile epileptic encephalopathy 13/;
	$alles[$a]=~s/\tencephalopathy, early infantile, 13/\tEarly infantile epileptic encephalopathy 13/;
	$alles[$a]=~s/Epileptic encephalopathy, early infantile, 7/Early infantile epileptic encephalopathy 7/;
	$alles[$a]=~s/\tencephalopathy, early infantile, 7/\tEarly infantile epileptic encephalopathy 7/;
	$alles[$a]=~s/\tencephalopathy, early infantile, 6/\tEpileptic encephalopathy, early infantile, 6/;
	$alles[$a]=~s/Febrile seizures, familial, 3B/Febrile seizures, familial, 3b/;
	$alles[$a]=~s/Generalized epilepsy with febrile seizures plus 2/Generalized epilepsy with febrile seizures plus, type 2/;
	$alles[$a]=~s/Neuropathy, hereditary sensory and autonomic, 7/Neuropathy, hereditary sensory and autonomic, type VII/;
	$alles[$a]=~s/Generalized epilepsy with febrile seizures plus 7/Generalized epilepsy with febrile seizures plus, type 7/;
	$alles[$a]=~s/Episodic ataxia 1/Episodic ataxia type 1/;
	$alles[$a]=~s/Episodic ataxia 2/Episodic ataxia type 2/;
	$alles[$a]=~s/Primary erythermalgia/Primary erythromelalgia/;
	$alles[$a]=~s/Night blindness, congenital stationary, 2A/Congenital stationary night blindness, type 2A/;
	$alles[$a]=~s/Deafness, autosomal dominant, 2A/Non-syndromic genetic deafness/;
	$alles[$a]=~s/Myokymia isolated 1/Myokymia 1/;
	$alles[$a]=~s/Myasthenic syndrome, congenital, 16/Congenital myasthenic syndrome/;
	$alles[$a]=~s/Migraine, familial hemiplegic, 1/Familial hemiplegic migraine type 1/;
	$alles[$a]=~s/Migraine, familial hemiplegic, 3/Familial hemiplegic migraine type 3/;
	$alles[$a]=~s/Periodic paralysis normokalemic/Periodic paralysis hyperkalemic/;
	$alles[$a]=~s/\tbenign familial infantile, 3/\tSeizures benign familial infantile, 3/;
	$alles[$a]=~s/\tbenign familial neonatal 1/\tSeizures benign familial neonatal 1/;
	$alles[$a]=~s/\tcongenita of von Eulenburg/\tParamyotonia congenita of von Eulenburg/;
	$alles[$a]=~s/\tepilepsy with febrile seizures plus 2/\tGeneralized epilepsy with febrile seizures plus, type 2/;
	$alles[$a]=~s/\tto pain, congenital, autosomal recessive/\tIndifference to pain, congenital, autosomal, recessive/;
	$alles[$a]=~s/\textreme pain disorder/\tParoxymal extreme pain disorder/;
	$alles[$a]=~s/\tretardation, autosomal dominant 46/\tMENTAL RETARDATION, AUTOSOMAL DOMINANT 46/;
	$alles[$a]=~s/\tsyndrome 1/\tBrugada syndrome 1/;
	#print "$uniprot[$a]\n";
}

for ($i=0;$i<=$#uniprot;$i++)
{
	for ($j=0;$j<=$#clinvar;$j++)
	{
		if ($clinvar[$j]=~/$uniprot[$i]/)
		{
			push (@unique, $clinvar[$j]); #κρατας σε πινακα τις κοινες εγραφφες μεταξυ των δυο βασεων.Στη συνεχεια θα απαλοιφθουν απο τη UniProt και θα μεινουν μονο οι αναφορες της ClinVar
		}
	}
}

for ($i=0;$i<=$#clinvar;$i++)
{
	for ($j=0;$j<=$#unique;$j++)
	{
		if ($clinvar[$i]=~/$unique[$j]/)
		{
			undef $all[$i];#σε περιπτωση που κανει match, κανει undef τη γραμμη στον πινακα alles
		}
	}
}

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

@uniqueClinVar = grep { defined($_)}@all; #εδω κραταει σε νεο πινακα μονο τις defined εγγραφες που εχουν απομεινει απο τον πινακα alles. Στην ουσια ειναι και οι εγγραφες που ειναι μοναδικες στη βαση UniProt
#print $#uniqueUniProt."\n";
@uniqueUniProt = grep { defined($_)}@alles;
#print "$#uniqueClinVar\t$#uniqueUniProt\t$#unique";


foreach $k (@uniqueUniProt)
{
	print "$k\n";
}

foreach $i (@uniqueClinVar)
{
	print "$i\n";
}

foreach $l (@unique)
{
	print "$l\n";
}
 #sortarisma to output (sort -u output > recordOFsnpsANDdisease.txt)