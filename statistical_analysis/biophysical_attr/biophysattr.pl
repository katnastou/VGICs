#!/usr/bin/perl -w 

#convert_any_amino_acid_to_polar_non-polar_or_charged_based_on_biophysical_attributes

open (IN,'snps_total.txt');

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

#Q13698	CACNA1S	Cav1.1	R	528	G	524-542	S4DII	Pathogenic
#Q13698	CACNA1S	Cav1.1	R	1086	C	1066-1118	IL10	Unclassified

while(<IN>)
{
	if($_!~/Unclassified/g)
	{
		if ($_=~/(\S+\t\S+\t\S+\t)(\w)(\t\d+\t)(\w)(.*)/)
		{
			$name = $1;
			$normaa = $2;
			$position = $3;
			$snp = $4;
			$clinsig = $5;
			print "$name$definition{$normaa}$position$definition{$snp}$clinsig";
		}
	}
	else
	{
		next;
	}
}