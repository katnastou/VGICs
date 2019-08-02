#!/usr/bin/perl -w 

#convert_any_amino_acid_to_polar_non-polar_or_charged_based_on_biophysical_attributes

open (IN,'navs_snp_position.txt');

%definition = (
"A" => "non-polar",
"V" => "non-polar",
"L" => "non-polar",
"I" => "non-polar",
"P" => "non-polar",
"G" => "non-polar",
"F" => "non-polar",
"K" => "charged",
"R" => "charged",
"E" => "charged",
"D" => "charged",
"Q" => "polar",
"N" => "polar",
"S" => "polar",
"T" => "polar",
"Y" => "polar",
"C" => "polar",
"M" => "polar",
"W" => "polar",
"H" => "polar",
);

#Q9UI33	SCN11A	Nav1.9	A	582	T	573-596	S1DII	Polymorphism
#Q9UI33	SCN11A	Nav1.9	A	681	D	668-687	S4DII	Polymorphism

while(<IN>)
{
	if($_=~/^(\S+)\t(\S+)\t(\S+)\t(\w)\t(\d+)\t(\w)\t(\d+\-\d+)\t(\S+)\t(.*)/g)
	{
		$ac = $1;
		$gn = $2;
		$member = $3;
		$normaa = $4;
		$position = $5;
		$snp = $6;
		$stend= $7;
		$topology = $8;
		$pathogenicity = $9;
		print "$ac\t$gn\t$member\t$definition{$normaa}\t$position\t$definition{$snp}\t$stend\t$topology\t$pathogenicity\n";
	}
}