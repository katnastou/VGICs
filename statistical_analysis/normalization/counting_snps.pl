#!usr/bin/perl -w

open (IN,'normalizedNavs.txt');

#katametrhsh snps ana topologikh perioxh se kanonikopoihmena dedomena (koinh klimaka mhkous = 100 kai anagwgh snps)se ola ta print typwnontai prwta ta non pathogenic kai epeita pathogenic snps

#gn	uniprotAC	IL1:total	pathogenic	non pathogenic	S1DI:total	pathogenic	non pathogenic ... IL13:total	pathogenic	non pathogenic
#SCN1A	Nav1.1	14	1	13	100	12	6	6	100	12	6	6	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	50	39	11	100	6	6	0	100	32	16	16	100	6	3	3	100	21	17	4	100	3	1	2	100	6	0	6	100	7	0	7	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	17	17	0	100	0	0	0	100	11	11	0	100	4	2	2	100	21	17	4	100	3	0	3	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	10	0	10	100	11	11	0	100	0	0	0	100	11	11	0	100	4	3	1	100	12	8	4	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	17	17	0	100	22	0	22	100	16	5	11	100	2	1	1	100	0	0	0	100	1	0	1	100	331	198	133	4900

print "	POLYMORPHISMS								PATHOGENIC SNPS							
Gene(Protein Name)	N-terminal	VSD	S5	Pore loop	S6	Ils	Els	C-terminal	N-terminal	VSD	S5	Pore loop	S6	Ils	Els	C-terminal
";

while (<IN>)
{
	if ($_=~/^(\w+)\t(\S+)\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+.*/)
	{
		$gn = $1;
		$name = $2;
		$Nterpath = $3;
		$Nternonpath = $4;
		$VSDpath = $5 + $9 + $13 + $17 + $29 + $33 + $37 + $41 + $51 + $55 + $59 + $63 + $75 + $79 + $81 + $85;
		$VSDnonpath = $6 + $10 + $14 + $18 + $30 + $34 + $38 + $42 + $52 + $56 + $60 + $64 + $76 + $80 + $82 + $86;
		$S5path = $21 + $45 + $67 + $89;
		$S5nonpath = $22 + $46 + $68 + $90;
		$S6path = $25 + $49 + $71 + $93;
		$S6nonpath = $26 + $50 + $72 + $94;
		$PLpath = $23 + $47 + $71 + $95;
		$PLnonpath = $24 + $48 + $72 + $96;
		$ILpath = $11 + $19 + $27 + $35 + $43 + $51 + $59 + $67 + $75 + $83 + $91;
		$ILnonpath = $12 + $20 + $28 + $36 + $44 + $52 + $60 + $68 + $76 + $84 + $92;
		$ELpath = $7 + $15 + $31 + $39 + $55 + $63 + $79 + $87;
		$ELnonpath = $8 + $16 + $32 + $40 + $56 + $64 + $80 + $88;
		$Cterpath = $99;
		$Cternonpath = $100;
	}
	print $gn,'(',$name,')',"\t$Nternonpath\t$VSDnonpath\t$S5nonpath\t$PLnonpath\t$S6nonpath\t$ILnonpath\t$ELnonpath\t$Cternonpath\t$Nterpath\t$VSDpath\t$S5path\t$PLpath\t$S6path\t$ILpath\t$ELpath\t$Cterpath\n";
}

close IN;
#!usr/bin/perl -w

open (IN1,'normalizedCavs.txt');

#working_on_kvs_normalized_dataset:counting snps per topodom (vsd,s5-s6,pl,il,el)

#gn	uniprotAC	IL1:total	pathogenic	non pathogenic	S1DI:total	pathogenic	non pathogenic ... IL13:total	pathogenic	non pathogenic
#CACNA1I	Cav3.3	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	6	0	6	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	6	0	6	49000

while (<IN1>)
{
	if ($_=~/^(\w+)\t(\S+)\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+.*/)
	{
		$gn = $1;
		$name = $2;
		$Nterpath = $3;
		$Nternonpath = $4;
		$VSDpath = $5 + $9 + $13 + $17 + $29 + $33 + $37 + $41 + $51 + $55 + $59 + $63 + $75 + $79 + $81 + $85;
		$VSDnonpath = $6 + $10 + $14 + $18 + $30 + $34 + $38 + $42 + $52 + $56 + $60 + $64 + $76 + $80 + $82 + $86;
		$S5path = $21 + $45 + $67 + $89;
		$S5nonpath = $22 + $46 + $68 + $90;
		$S6path= $25 + $49 + $71 + $93;
		$S6nonpath= $26 + $50 + $72 + $94;
		$PLpath = $23 + $47 + $71 + $95;
		$PLnonpath =$24 + $48 + $72 + $96;
		$ILpath = $11 + $19 + $27 + $35 + $43 + $51 + $59 + $67 + $75 + $83 + $91;
		$ILnonpath = $12 + $20 + $28 + $36 + $44 + $52 + $60 + $68 + $76 + $84 + $92;
		$ELpath = $7 + $15 + $31 + $39 + $55 + $63 + $79 + $87;
		$ELnonpath = $8 + $16 + $32 + $40 + $56 + $64 + $80 + $88;
		$Cterpath = $99;
		$Cternonpath = $100;
	}
print $gn,'(',$name,')',"\t$Nternonpath\t$VSDnonpath\t$S5nonpath\t$PLnonpath\t$S6nonpath\t$ILnonpath\t$ELnonpath\t$Cternonpath\t$Nterpath\t$VSDpath\t$S5path\t$PLpath\t$S6path\t$ILpath\t$ELpath\t$Cterpath\n";

}

close IN1;

open (IN2,'normalizedKvs.txt');

#working_on_kvs_normalized_dataset

#gn	uniprotAC	IL1:total	pathogenic	non pathogenic	S1:total	pathogenic	non pathogenic ... IL4:total	pathogenic	non pathogenic
#KCNV2	Kv8.2	3	1	2	100	5	5	0	100	5	4	1	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	0	0	0	100	2	2	0	100	0	0	0	100	2	0	2	100	17	12	5	1300

while (<IN2>)
{
	if ($_=~/^(\w+)\t(\S+)\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+\t\S+\t(\S+)\t(\S+)\t\S+.*/)
	{
		$gn = $1;
		$name = $2;
		$Nterpath = $3;
		$Nternonpath = $4;
		$VSDpath = $5 + $9 + $13 + $17;
		$VSDnonpath = $6 + $10 + $14 + $18;
		$ILpath = $11 + $19;
		$ILnonpath = $12 + $20;
		$ELpath = $7 + $15;
		$ELnonpath = $8 + $16;
		$PLpath = $23;
		$PLnonpath = $24;
		$S5path = $21;
		$S5nonpath = $22;
		$S6path = $25;
		$S6nonpath = $26;
		$Cterpath = $27;
		$Cternonpath = $28;
	}
	print $gn,'(',$name,')',"\t$Nternonpath\t$VSDnonpath\t$S5nonpath\t$PLnonpath\t$S6nonpath\t$ILnonpath\t$ELnonpath\t$Cternonpath\t$Nterpath\t$VSDpath\t$S5path\t$PLpath\t$S6path\t$ILpath\t$ELpath\t$Cterpath\n";
}

close IN2;
