#!/usr/bin/perl -w

open (IN,'snpsANDdisease.clinvar');

@vgics=("CACNA1A","CACNA1B","CACNA1C","CACNA1D","CACNA1E","CACNA1F","CACNA1G","CACNA1H","CACNA1I","CACNA1S",
"KCNA1","KCNA10","KCNA2","KCNA3","KCNA4","KCNA5","KCNA6","KCNA7","KCNB1","KCNB2","KCNC1","KCNC2","KCNC3","KCNC4",
"KCND1","KCND2","KCND3","KCNF1","KCNG1","KCNG2","KCNG3","KCNG4","KCNH1","KCNH2","KCNH3","KCNH4","KCNH5","KCNH6",
"KCNH7","KCNH8","KCNQ1","KCNQ2","KCNQ3","KCNQ4","KCNQ5","KCNS1","KCNS2","KCNS3","KCNV1","KCNV2","SCN10A","SCN11A",
"SCN1A","SCN2A","SCN3A","SCN4A","SCN5A","SCN8A","SCN9A");

%genes=("CACNA1S" => "Q13698","CACNA1C" => "Q13936","CACNA1D" => "Q01668","CACNA1F" => "O60840","CACNA1A" => "O00555",
"CACNA1B" => "Q00975","CACNA1E" => "Q15878","CACNA1G" => "O43497","CACNA1H" => "O95180","CACNA1I" => "Q9P0X4","KCNA1" => "Q09470",
"KCNA2" => "P16389","KCNA3" => "P22001","KCNA4" => "P22459","KCNA5" => "P22460","KCNA6" => "P17658","KCNA7" => "Q96RP8","KCNA10" => "Q16322",
"KCNB1" => "Q14721","KCNB2" => "Q92953","KCNC1" => "P48547","KCNC2" => "Q96PR1","KCNC3" => "Q14003","KCNC4" => "Q03721","KCND1" => "Q9NSA2",
"KCND2" => "Q9NZV8","KCND3" => "Q9UK17","KCNF1" => "Q9H3M0","KCNG1" => "Q9UIX4","KCNG2" => "Q9UJ96","KCNG3" => "Q8TAE7","KCNG4" => "Q8TDN1",
"KCNQ1" => "P51787","KCNQ2" => "O43526","KCNQ3" => "O43525","KCNQ4" => "P56696","KCNQ5" => "Q9NR82","KCNV1" => "Q6PIU1","KCNV2" => "Q8TDN2",
"KCNS1" => "Q96KK3","KCNS2" => "Q9ULS6","KCNS3" => "Q9BQ31","KCNH1" => "O95259","KCNH5" => "Q8NCM2","KCNH2" => "Q12809","KCNH6" => "Q9H252",
"KCNH7" => "Q9NS40","KCNH8" => "Q96L42","KCNH3" => "Q9ULD8","KCNH4" => "Q9UQ05","SCN1A" => "P35498","SCN2A" => "Q99250","SCN3A" => "Q9NY46",
"SCN4A" => "P35499","SCN5A" => "Q14524","SCN8A" => "Q9UQD0","SCN9A" => "Q15858","SCN10A" => "Q9Y5Y9","SCN11A" => "Q9UI33");

%AA = ('Ala'=>'A','Tyr'=>'Y','Met'=>'M','Leu'=>'L','Cys'=>'C','Gly'=>'G',
'Arg'=>'R','Asn'=>'N','Asp'=>'D','Gln'=>'Q','Glu'=>'E','His'=>'H','Trp'=>'W',
'Lys'=>'K','Phe'=>'F','Pro'=>'P','Ser'=>'S','Thr'=>'T','Ile'=>'I','Val'=>'V');


#15043	single nucleotide variant	NM_014630.2(ZNF592):c.3136G>A (p.Gly1046Arg)	Uncertain significance	Galloway-Mowat syndrome 1
#15044	single nucleotide variant	NM_017547.3(FOXRED1):c.694C>T (p.Gln232Ter)	Pathogenic	Mitochondrial complex I deficiency;not provided

while (<IN>)
{
	if ($_=~/\d+\tsingle\snucleotide\svariant\t\wM_\d+\.\d+\((\S+)\)\:\S+\s\Sp\.(\D+)(\d+)(\w+)\S\t(Pathogenic|Likely\spathogenic)\t(.*)/g)
	{
		push (@gn,$1);#κραταει gene name
		push (@normaa,$2);#φυσιολογικο aa
		push (@position,$3);#θεση πολυμορφισμου
		push (@snp,$4);#snp
		push (@disease, $6); #αναφορα/-ες σε ασθενεια/-ες
	}
}

for ($i=0;$i<=$#vgics;$i++)
	{
	for ($j=0;$j<=$#gn;$j++)
	{
		if ($gn[$j]=~/$vgics[$i]/)#εφοσον κανει match καποιο VGIC προχωραει παρακατω
		{
			if ($snp[$j]!~/Ter/)#κανει print μονο εφοσον δεν εντυπωζει ως αλλαγη κωδικονιο ληξης(Τer)
			{
				if ($disease[$j]!~/(^not\sprovided|not\sspecified)/)#εφοσον στο πεδιο της ασθενειας ΔΕΝ εχει αναφορα not provided ή not specified
				{
					$disease[$j]=~s/\;not\sprovided//; #σε εγγραφες με πολλαπλες αναφορες,αν μετα απο ασθενεια εχει χαρακτηρισμο not provided, αφαιρειται
					@split = split (/;/, $disease[$j]);#διαχωριζει καθε αναφορα σε ασθενεια που υπαρχει στις πολλαπλες αναφορες αναφορες => σε διαφορετικες εγγραφες
					$dis[$j] = [@split];
					for ($k=0;$k<=$#split;$k++)
					{
						print "$vgics[$i]\t";
						print "$genes{$vgics[$i]}\t";
						print "$AA{$normaa[$j]}\t";
						print "$position[$j]\t";
						print "$AA{$snp[$j]}\t";
						print "$dis[$j][$k]\n";
					}
				}
			}
			elsif ($snp[$j]=~/Ter/)
			{
				next;
			}
		}
	}
}