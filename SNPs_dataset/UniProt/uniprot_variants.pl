#!/usr/bin/perl -w

open (IN,'humsavar.txt');

@vgics =("Q09470","P16389","P22001","P22459","P22460",
         "P17658","Q96RP8","Q16322","Q14721","Q92953","P48547",
         "Q96PR1","Q14003","Q03721","Q9NSA2","Q9NZV8","Q9UK17",
         "Q9H3M0","Q9UIX4","Q9UJ96","Q8TAE7","Q8TDN1","P51787",
         "O43526","O43525","P56696","Q9NR82","Q6PIU1","Q8TDN2",
         "Q96KK3","Q9ULS6","Q9BQ31","O95259","Q8NCM2","Q12809",
         "Q9H252","Q9NS40","Q96L42","Q9ULD8","Q9UQ05","Q13698",
         "Q13936","Q01668","O60840","O00555","Q00975","Q15878",
         "O43497","O95180","Q9P0X4","P35498","Q99250","Q9NY46",
         "P35499","Q14524","Q9UQD0","Q15858","Q9Y5Y9","Q9UI33");

%AA = ('Ala'=>'A','Tyr'=>'Y','Met'=>'M','Leu'=>'L','Cys'=>'C','Gly'=>'G',
'Arg'=>'R','Asn'=>'N','Asp'=>'D','Gln'=>'Q','Glu'=>'E','His'=>'H','Trp'=>'W',
'Lys'=>'K','Phe'=>'F','Pro'=>'P','Ser'=>'S','Thr'=>'T','Ile'=>'I','Val'=>'V');

while (<IN>)
{
	while ($_=~/^(\S+)\s+(\S+)\s+\S+\s{2}p\.(\w{3})(\d+)(\w{3})\s+(\S+)/mg)
	{
		push (@gn,$1);#κραταει κωδικο γονιδιου
		push (@uniprot_ac,$2);
		push (@normaa,$3);#φυσιολογικο aa
		push (@position,$4);#θεση snp
		push (@snp,$5);#snp
		push (@clinsig,$6);#κλινικος χαρακτηρισμος
	}
}

for ($y=0; $y<=$#vgics;$y++)
{
for ($j=0;$j<=$#uniprot_ac;$j++)
	{
		if ($vgics[$y] eq $uniprot_ac[$j])
		{
			print "$gn[$j]\t$uniprot_ac[$j]\t$AA{$normaa[$j]}\t$position[$j]\t$AA{$snp[$j]}\t$clinsig[$j]\n";
		}
		else 
		{
			next;
		}
	}
}

close IN;
