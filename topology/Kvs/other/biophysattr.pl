#!/usr/bin/perl -w 

#convert_any_amino_acid_to_polar_non-polar_or_charged_based_on_biophysical_attributes

open (IN,'kv_snp_position_final.txt');

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

#Q09470	KCNA1	Kv1.1	S	342	I	324-345	21	S5	Pathogenic
#Q09470	KCNA1	Kv1.1	R	239	S	221-242	21	S2	Pathogenic

while(<IN>)
{
	if($_=~/^(\S+)\t(\S+)\t(Kv\d+\.\d+)\t(\w)\t(\d+)\t(\w)\t(\d+\-\d+)\t(\S+\s*\S*)\t(.*)/g)
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