#!/usr/bin/perl -w

#normalization_of_snps'_dataset

open (IN,'dataset_for_normalization_kvs.txt');

#KCNA1	Κv1.1	0	0	0	164	4	4	0	22	1	0	1	34	6	6	0	22	2	2	0	11	1	1	0	21	0	0	0	13	0	0	0	21	0	0	0	15	3	3	0	22	0	0	0	41	6	5	1	29	1	0	1	80	21	3	24	495

while (<IN>)
{
	$j=0;
	for ($i=0;$i<15;$i++)
	{
		if ($_=~/^(\w+)\t(\S+)\t(\d+\t\d+\t\d+\t\d+\t){$j}\d+\t(\d+)\t(\d+)\t(\d+).*/)
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
		#print $j,"\n";
		print "$totnorm\t$pathnorm\t$nonpathnorm\t",100,"\t";
		$j++;
	}
	print "$totnormalized\t$totpath\t$totnonpath\t1300\t$gn\t$uniprotac\n";#το 1300 προκυπτει ως 13 τοπολογικες περιοχες x 100 καταλοιπα η καθε μια
	$totpath = 0;
	$totnonpath = 0;
	$totnormalized = 0;
}