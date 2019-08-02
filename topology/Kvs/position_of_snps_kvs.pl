#!/usr/bin/perl -w

open (IN,'kv_snps.txt');
open (IN1,'human_kvs_uniprot.txt');

@name=();
@start=();
@end=();
@topology=();
@gn=();
@ac=();
@normaa=();
@position=();
@changeaa=();
@clinsig=();
$i=0;

%kvs=("KCNA1" => "Kv1.1","KCNA2" => "Kv1.2","KCNA3" => "Kv1.3","KCNA4" => "Kv1.4","KCNA5" => "Kv1.5","KCNA6" => "Kv1.6",
      "KCNA7" => "Kv1.7","KCNA10" => "Kv1.8","KCNB1" => "Kv2.1","KCNB2" => "Kv2.2","KCNC1" => "Kv3.1","KCNC2" => "Kv3.2",
      "KCNC3" => "Kv3.3","KCNC4" => "Kv3.4","KCND1" => "Kv4.1","KCND2" => "Kv4.2","KCND3" => "Kv4.3","KCNF1" => "Kv5.1",
      "KCNG1" => "Kv6.1","KCNG2" => "Kv6.2","KCNG3" => "Kv6.3","KCNG4" => "Kv6.4","KCNQ1" => "Kv7.1","KCNQ2" => "Kv7.2",
      "KCNQ3" => "Kv7.3","KCNQ4" => "Kv7.4","KCNQ5" => "Kv7.5","KCNV1" => "Kv8.1","KCNV2" => "Kv8.2","KCNS1" => "Kv9.1",
      "KCNS2" => "Kv9.2","KCNS3" => "Kv9.3","KCNH1" => "Kv10.1","KCNH5" => "Kv10.2","KCNH2" => "Kv11.1","KCNH6" => "Kv11.2",
      "KCNH7" => "Kv11.3","KCNH8" => "Kv12.1","KCNH3" => "Kv12.2","KCNH4" => "Kv12.3");

#KCNH2	Q12809	R	912	W	Unclassified
#KCNH2	Q12809	R	92	C	Pathogenic

while (<IN>)
{
	if ($_=~/^(\w+)\t(\S+)\t(\w{1})\t(\d+)\t(\S{1})\t(.*)/g)#parsarei thn plhroforia poy einai se paren8esh stoys pinakes
	{
		push (@gn,$1);#gene name
		push (@ac,$2);#uniprot ac
		push (@normaa,$3); #normal aa
		push (@position,$4); #position of snp
		push (@changeaa,$5); #snp
		push (@clinsig,$6); #clinical significance
	}
}
#print $#normaa."\n";

while (<IN1>)#diavazei apo multitest arxeio me kvs ths uniprot
{
	if ($_=~/^GN\s{3}Name\=(\w+)\;*/mg)
	{
		push (@name,$1);
		@start=();
		@end=();
		@topology=();
	}
	while ($_=~/^FT\s+TRANSMEM\s+(\d+)\s+(\d+).*/mg)#arxika parsarei se pinakes arxh,telos kai onomasia topologikoy domain
	{
		push (@start, $1);
		push (@end, $2);
		#print $2."\n";
	}
	if ($_=~/^\/\//mg)
	{
		#print $i."\n";
		$all_tm_start[$i]=[@start];#σε δισδιαστατους πινακες περναει η πληροφορια για αρχη και τελος καθε τοπολογικης περιοχης σε καθε καναλι Kv
		$all_tm_end[$i]=[@end];
		$all_topology[$i][0]="N-terminal";#διατηρειται σε πινακα το ονομα καθε τοπολογικης περιοχης για καθε καναλι 
		$all_topology[$i][1]="S1";
		$all_topology[$i][2]="EL1";
		$all_topology[$i][3]="S2";
		$all_topology[$i][4]="IL2prox";
		$all_topology[$i][5]="IL2";
		$all_topology[$i][6]="S3";
		$all_topology[$i][7]="EL2";
		$all_topology[$i][8]="S4";
		$all_topology[$i][9]="IL3prox";
		$all_topology[$i][10]="IL3";
		$all_topology[$i][11]="S5";
		$all_topology[$i][12]="PL";
		$all_topology[$i][13]="S6";
		$all_topology[$i][14]="C-terminal";
		#print "@start\n";
		$i++;
	}
	if ($_=~/^SQ\s+SEQUENCE\s+(\d+).*/mg)
	{
		push (@length, $1);
	}
}

#print "@$_", "\n" foreach ( @all_start );
#print "@$_", "\n" foreach ( @all_end );
#print "@$_", "\n" foreach ( @all_topology );

for($j=0;$j<=$#all_tm_end;$j++)#δουλευουμε με δισδιαστατους πινακες οπου ο counter $j δηλωνει στην ουσια και το διαφορετικο καναλι (επομενως θα φτανει μεχρι τον αριθμο 40,γιατι τοσα ειναι και τα Kvs). Στη for loop που ακολουθει φτιαχνεται η κοινη μορφολογια για τις τοπολογικες περιοχες
{
	$all_loop_start[$j][0]=1;#N-terminal <--εδω κραταει σε πινακα την αρχη καθε λουπας και των ακρων
	$all_loop_start[$j][1]=$all_tm_end[$j][0]+1;#EL1
	$all_loop_start[$j][2]=$all_tm_end[$j][1]+1;#ILprox
	$all_loop_start[$j][3]=$all_tm_end[$j][1]+6;#IL2
	$all_loop_start[$j][4]=$all_tm_end[$j][2]+1;#EL2
	$all_loop_start[$j][5]=$all_tm_end[$j][3]+1;#ILprox
	$all_loop_start[$j][6]=$all_tm_end[$j][3]+6;#IL3
	$all_loop_start[$j][7]=$all_tm_end[$j][4]+1;#Pore loop
	$all_loop_start[$j][8]=$all_tm_end[$j][5]+1;#C-terminal

	$all_loop_end[$j][0]=$all_tm_start[$j][0]-1;#N-terminal<--εδω κραταει σε πινακα το τελος καθε λουπας και των ακρων
	$all_loop_end[$j][1]=$all_tm_start[$j][1]-1;#EL1
	$all_loop_end[$j][2]=$all_tm_end[$j][1]+5;#ILprox
	$all_loop_end[$j][3]=$all_tm_start[$j][2]-1;#IL2
	$all_loop_end[$j][4]=$all_tm_start[$j][3]-1;#EL2
	$all_loop_end[$j][5]=$all_tm_end[$j][3]+5;#ILprox
	$all_loop_end[$j][6]=$all_tm_start[$j][4]-1;#IL3
	$all_loop_end[$j][7]=$all_tm_start[$j][5]-1;#Pore loop
	$all_loop_end[$j][8]=$length[$j];#C-terminal

	$all_start[$j][0]=$all_loop_start[$j][0];#N-terminal<--εδω κραταει σε πινακα την αρχη καθε τοπολογικης περιοχης
	$all_start[$j][1]=$all_tm_start[$j][0];#S1
	$all_start[$j][2]=$all_loop_start[$j][1];#EL1
	$all_start[$j][3]=$all_tm_start[$j][1];#S2
	$all_start[$j][4]=$all_loop_start[$j][2];#ILprox
	$all_start[$j][5]=$all_loop_start[$j][3];#IL2
	$all_start[$j][6]=$all_tm_start[$j][2];#S3
	$all_start[$j][7]=$all_loop_start[$j][4];#EL2
	$all_start[$j][8]=$all_tm_start[$j][3];#S4
	$all_start[$j][9]=$all_loop_start[$j][5];#ILprox
	$all_start[$j][10]=$all_loop_start[$j][6];#IL3
	$all_start[$j][11]=$all_tm_start[$j][4];#S5
	$all_start[$j][12]=$all_loop_start[$j][7];#Pore loop
	$all_start[$j][13]=$all_tm_start[$j][5];#S6
	$all_start[$j][14]=$all_loop_start[$j][8];#C-terminal

	$all_end[$j][0]=$all_loop_end[$j][0];#N-terminal<--εδω κραταει σε πινακα το τελος καθε τοπολογικης περιοχης
	$all_end[$j][1]=$all_tm_end[$j][0];#S1
	$all_end[$j][2]=$all_loop_end[$j][1];#EL1
	$all_end[$j][3]=$all_tm_end[$j][1];#S2
	$all_end[$j][4]=$all_loop_end[$j][2];#ILprox
	$all_end[$j][5]=$all_loop_end[$j][3];#IL2
	$all_end[$j][6]=$all_tm_end[$j][2];#S3
	$all_end[$j][7]=$all_loop_end[$j][4];#EL2
	$all_end[$j][8]=$all_tm_end[$j][3];#S4
	$all_end[$j][9]=$all_loop_end[$j][5];#ILprox
	$all_end[$j][10]=$all_loop_end[$j][6];#IL3
	$all_end[$j][11]=$all_tm_end[$j][4];#S5
	$all_end[$j][12]=$all_loop_end[$j][7];#Pore loop
	$all_end[$j][13]=$all_tm_end[$j][5];#S6
	$all_end[$j][14]=$all_loop_end[$j][8];#C-terminal
}

for ($j=0;$j<=$#name;$j++) #συγκριση της πληροφοριας που απομονωθηκε απο το IN και το IN1
{
	for ($x=0;$x<=$#gn;$x++)
	{
		if ($gn[$x] eq $name[$j])#αν κανει match στο ονομα της πρωτεΐνης
		{
			for ($y=0;$y<=14;$y++)
			{
				if ($position[$x] >= $all_start[$j][$y] && $position[$x] <= $all_end[$j][$y] )#εντοπισμος της ακριβης θεσης του καθε snp
				{
					$len = $all_end[$j][$y] - $all_start[$j][$y] + 1;
					print "$ac[$x]\t$gn[$x]\t$kvs{$gn[$x]}\t$normaa[$x]\t$position[$x]\t$changeaa[$x]\t$all_start[$j][$y]-$all_end[$j][$y]\t$len\t$all_topology[$j][$y]\t$clinsig[$x]\n";
				}
				else
				{
					next;
				}
			}
		}
	}
}