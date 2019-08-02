#!/usr/bin/perl -w 

#convert_any_amino_acid_to_polar_non-polar_or_charged_based_on_biophysical_attributes

open (IN,'cavs_snp_position.txt');

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

#Q13698	CACNA1S	Cav1.1	R	1086	S	1066-1118	IL10	Unclassified
#Q13698	CACNA1S	Cav1.1	R	1239	G	1232-1250	S4DIV	Pathogenic

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