#!/usr/bin/perl -w
#ftp download latest file
#write to output GRCh38_variants.txt
open (IN2,'variant_summary.txt');

while (<IN2>)
{
	if ($_=~/\tGRCh38\t/g)
	{
		print "$_";
	}
}