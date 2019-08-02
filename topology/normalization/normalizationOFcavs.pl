#!usr/bin/perl -w

#normalization_of_snps'_dataset

open (IN,'dataset_for_normalization_cavs.txt');

#CACNA1A	Cav1.1	2	0	2	77	0	0	0	20	1	0	1	20	0	0	0	20	0	0	0	6	0	0	0	19	0	0	0	4	0	0	0	17	0	0	0	19	1	0	1	20	0	0	0	144	0	0	0	20	0	0	0	241	0	0	0	20	0	0	0	14	0	0	0	20	0	0	0	4	0	0	0	18	0	0	0	7	0	0	0	23	0	0	0	10	1	0	1	20	0	0	0	55	0	0	0	20	1	0	1	303	0	0	0	20	0	0	0	21	0	0	0	20	0	0	0	13	0	0	0	20	0	0	0	6	0	0	0	21	0	0	0	9	1	0	1	20	0	0	0	84	0	0	0	20	0	0	0	53	0	0	0	20	1	0	1	15	0	0	0	20	0	0	0	12	0	0	0	20	0	0	0	5	0	0	0	23	0	0	0	13	0	0	0	20	0	0	0	66	0	0	0	20	2	0	2	492	0	5	5	2223


while (<IN>)
{
	$a = 0;
	for ($i=0;$i<60;$i++) #60 topological domains
	{
		if ($_=~/^(\w+)\t(\S+)\t(\d+\t\d+\t\d+\t\d+\t){$a}\d+\t(\d+)\t(\d+)\t(\d+).*/)
		{
			$gn = $1;
			$uniprotac = $2;
			$path = $4; #sunolo twn pathologikwn SNPs sthn topologikh perioxh i
			$nonpath = $5; #sunolo twn polymorphisms sthn topologikh perioxh i
			$length = $6; #mhkos topologikhs perioxhs i
			$length =~s/^0\b/1/;
			#NORMALIZATION
			$pathnorm = ($path*100)/$length;#αναγωγη σε μηκος 100 καταλοιπων...πχ 5snps/20καταλοιπα -> 25snps/100 καταλοιπα
			$nonpathnorm = ($nonpath*100)/$length;
			$totnorm = $pathnorm + $nonpathnorm;#εδω συνολο ανα τοπολογικη περιοχη
			$totpath += $pathnorm;#συνολο pathogenic για καθε πρωτεινη
			$totnonpath +=$nonpathnorm;#συνολο polymorphisms για καθε πρωτεινη
			$totnormalized += $nonpathnorm + $pathnorm;#συνολο path + pol  για καθε πρωτεινη
		}
		print "$totnorm\t$pathnorm\t$nonpathnorm\t",100,"\t";;#το 4900 προκυπτει ως 49 τοπολογικες περιοχες x 100 καταλοιπα η καθε μια
		$a++;
	}
	print "$totnormalized\t$totpath\t$totnonpath\t4900\t$gn\t$uniprotac\n";
	$totpath = 0;
	$totnonpath = 0;
	$totnormalized = 0;
}