#!usr/bin/perl -w

#normalization_of_snps'_dataset

open (IN,'dataset_for_normalization_navs.txt');

#SCN1A	Nav1.1	4	0	4	124	0	0	0	23	2	0	2	4	2	0	2	19	0	0	0	12	2	0	2	18	0	0	0	5	1	0	1	19	0	0	0	15	1	1	0	23	0	0	0	100	2	0	2	25	5	1	4	259	0	0	0	24	0	0	0	10	1	0	1	23	0	0	0	7	0	0	0	19	0	0	0	5	1	0	1	19	0	0	0	15	1	1	0	20	1	0	1	53	0	0	0	25	9	0	9	256	0	0	0	23	1	0	1	12	1	0	1	25	0	0	0	5	0	0	0	21	0	0	0	3	1	0	1	21	1	0	1	18	1	1	0	27	1	0	1	79	0	0	0	26	1	0	1	52	0	0	0	23	0	0	0	10	1	0	1	23	0	0	0	5	2	0	2	23	0	0	0	11	0	0	0	21	0	0	0	14	0	0	0	22	2	0	2	64	1	0	1	24	1	0	1	233	2	30	32	1956


while (<IN>)
{
	$a = 0;
	for ($i=0;$i<60;$i++)
	{
		if ($_=~/^(\w+)\t(\S+)\t(\d+\t\d+\t\d+\t\d+\t){$a}\d+\t(\d+)\t(\d+)\t(\d+).*/g)
		{
			$gn = $1;
			$uniprotac = $2;
			$path = $4;#sunolo twn pathologikwn SNPs sthn topologikh perioxh i
			$nonpath = $5;#sunolo twn polymorphisms sthn topologikh perioxh i
			$length = $6;#mhkos topologikhs perioxhs i
			#NORMALIZATION
			$pathnorm = ($path*100)/$length;#αναγωγη σε μηκος 100 καταλοιπων...πχ 5snps/20καταλοιπα -> 25snps/100 καταλοιπα
			$nonpathnorm = ($nonpath*100)/$length;
			$totnorm = $pathnorm + $nonpathnorm;#εδω συνολο ανα τοπολογικη περιοχη
			$totpath += $pathnorm;#συνολο pathogenic για καθε πρωτεινη
			$totnonpath +=$nonpathnorm;#συνολο polymorphisms για καθε πρωτεινη
			$totnormalized += $nonpathnorm + $pathnorm;#συνολο path + pol  για καθε πρωτεινη
		}
		print "$totnorm\t$pathnorm\t$nonpathnorm\t",100,"\t";#το 4900 προκυπτει ως 49 τοπολογικες περιοχες x 100 καταλοιπα η καθε μια
		$a++;
	}
	print "$totnormalized\t$totpath\t$totnonpath\t4900\t$gn\t$uniprotac\n";
	$totpath = 0;
	$totnonpath = 0;
	$totnormalized = 0;
}