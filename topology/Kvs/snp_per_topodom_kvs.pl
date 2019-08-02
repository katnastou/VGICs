#!/usr/bin/perl -w

open (IN,'new_topology.txt');
open (IN1,'kv_genes.txt');
open (IN2,'human_kvs_uniprot.txt');

#μετραει σε καθε καναλι και σε καθε τοπολογικη περιοχη τα snps που εχουν χαρακτηρισμο Pathogenic ή Polymorphism
@name=();
@id=();
@gn=();
@ac=();
@topodom=();
$i=0;
$k=0;
$h=0;
$g=0;
$A=0;
$B=0;
$C=0;
$D=0;
$E=0;
$F=0;
$L=0;
$M=0;
$O=0;
$p=0;
$q=0;
$aa=0;
$bb=0;
$cc=0;
$dd=0;
$ee=0;
$ff=0;
$gg=0;
$hh=0;
$ii=0;
$jj=0;
$kk=0;
$ll=0;
$mm=0;
$nn=0;
$oo=0;
$pp=0;
$qq=0;
$rr=0;
$ss=0;
$tt=0;
$uu=0;
$vv=0;
$ww=0;
$xx=0;
$yy=0;
$zz=0;
$Cprox=0;
$Lprox=0;
$iiprox=0;
$jjprox=0;
$rrprox=0;
$qqprox=0;

#Q09470	KCNA1	Kv1.1	F	184	C	165-186	22	S1	Pathogenic
#Q09470	KCNA1	Kv1.1	F	249	I	248-253	6	IL2	Pathogenic

while (<IN>)#κραταει πληροφορια για uniprot ac, gene name, topological domain kai clinical significance
{
	if ($_=~/^(\w+)\t(\w+)\t\S+\t\w{1}\t\d+\t\w{1}\t\S+\t\S+\t(\S+\s*\S*)\t(.*)/g)
	{
		push (@ac,$1);
		push (@gn,$2);
		push (@topodom,$3);
		push (@clinsig,$4);
	}
}

while (<IN2>)
{
	if ($_=~/^GN\s{3}Name\=\w+\;*/mg)
	{
		@start=();
		@end=();
	}
	if ($_=~/^FT\s+(TRANSMEM)\s+(\d+)\s+(\d+)\s+.*/mg)
	{
		push (@start, $2);
		push (@end, $3);
		#print $2."\n";
	}
	if ($_=~/^\/\//mg)
	{
		#print $i."\n";
		$all_tm_start[$i]=[@start];#σε δισδιαστατους πινακες περναει η πληροφορια για αρχη και τελος καθε τοπολογικης περιοχης σε καθε καναλι Kv
		$all_tm_end[$i]=[@end];
		$i++;
	}
	if ($_=~/^SQ\s+SEQUENCE\s+(\d+).*/mg)
	{
		push (@length, $1);
	}
}

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

	$all_length[$j][0]=$all_end[$j][0]-$all_start[$j][0]+1;#N-terminal<--εδω κραταει σε πινακα το μηκος καθε τοπολογικης περιοχης
	$all_length[$j][1]=$all_end[$j][1]-$all_start[$j][1]+1;#S1
	$all_length[$j][2]=$all_end[$j][2]-$all_start[$j][2]+1;#EL1
	$all_length[$j][3]=$all_end[$j][3]-$all_start[$j][3]+1;#S2
	$all_length[$j][4]=$all_end[$j][4]-$all_start[$j][4]+1;#IL2prox
	$all_length[$j][5]=$all_end[$j][5]-$all_start[$j][5]+1;#IL2
	$all_length[$j][6]=$all_end[$j][6]-$all_start[$j][6]+1;#S3
	$all_length[$j][7]=$all_end[$j][7]-$all_start[$j][7]+1;#El2
	$all_length[$j][8]=$all_end[$j][8]-$all_start[$j][8]+1;#S4
	$all_length[$j][9]=$all_end[$j][9]-$all_start[$j][9]+1;#IL3prox
	$all_length[$j][10]=$all_end[$j][10]-$all_start[$j][10]+1;#IL3
	$all_length[$j][11]=$all_end[$j][11]-$all_start[$j][11]+1;#S5
	$all_length[$j][12]=$all_end[$j][12]-$all_start[$j][12]+1;#Pore loop
	$all_length[$j][13]=$all_end[$j][13]-$all_start[$j][13]+1;#S6
	$all_length[$j][14]=$all_end[$j][14]-$all_start[$j][14]+1;#C-terminal
}


while (<IN1>)
{
	if ($_=~/^(\S+)\t(\S+)/g)
	{
		push (@name,$1);
		push (@id,$2);
	}
}

for ($i=0;$i<=$#name;$i++)#εδω υπολογιζονται παθολογικα και μη snps για καθε τοπολογικη περιοχη σε καθε καναλι
{
	for ($j=0;$j<=$#gn;$j++)
	{
		if ($name[$i] eq $gn[$j])
		{
			if ($clinsig[$j]!~/^Unclassified/)
			{
				$k++;
				if ($topodom[$j]=~/^N-terminal/)
				{
					$h++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$aa++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$bb++;
					}
				}
				if ($topodom[$j]=~/^S1/)
				{
					$g++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$cc++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$dd++;
					}
				}
				if ($topodom[$j]=~/^EL1/)
				{
					$A++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ee++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$ff++;
					}
				}
				if ($topodom[$j]=~/^S2/)
				{
					$B++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$gg++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$hh++;
					}
				}
				if ($topodom[$j]=~/^IL2prox/)
				{
					$Cprox++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$iiprox++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$jjprox++;
					}
				}
				if ($topodom[$j]=~/^IL2\b/)
				{
					$C++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ii++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$jj++;
					}
				}
				if ($topodom[$j]=~/^S3/)
				{
					$D++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$kk++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$ll++;
					}
				}
				if ($topodom[$j]=~/^EL2/)
				{
					$E++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$mm++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$nn++;
					}
				}
				if ($topodom[$j]=~/^S4/)
				{
					$F++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$oo++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$pp++;
					}
				}
				if ($topodom[$j]=~/^IL3prox/)
				{
					$Lprox++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$qqprox++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$rrprox++;
					}
				}
				if ($topodom[$j]=~/^IL3\b/)
				{
					$L++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$qq++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$rr++;
					}
				}
				if ($topodom[$j]=~/^S5/)
				{
					$M++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ss++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$tt++;
					}
				}
				if ($topodom[$j]=~/^PL/)
				{
					$O++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$uu++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$vv++;
					}
				}
				if ($topodom[$j]=~/^S6/)
				{
					$p++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ww++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$xx++;
					}
				}
				if ($topodom[$j]=~/^C-terminal/)
				{
					$q++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$yy++;
					}
					elsif ($clinsig[$j]=~/^Polymorphism/)
					{
						$zz++;
					}
				}
			}
		}
	}
	$path=$aa+$cc+$ee+$gg+$ii+$iiprox+$kk+$mm+$oo+$qq+$qqprox+$ss+$uu+$ww+$yy;
	$pol=$bb+$dd+$ff+$hh+$jj+$jjprox+$ll+$nn+$pp+$rr+$rrprox+$tt+$vv+$xx+$zz;
	
	print "$name[$i]"."\t"."$id[$i]"."\t"."$h"."\t"."$aa"."\t"."$bb"."\t"."$all_length[$i][0]".
"\t"."$g"."\t"."$cc"."\t"."$dd"."\t"."$all_length[$i][1]".
"\t"."$A"."\t"."$ee"."\t"."$ff"."\t"."$all_length[$i][2]".
"\t"."$B"."\t"."$gg"."\t"."$hh"."\t"."$all_length[$i][3]".
"\t"."$Cprox"."\t"."$iiprox"."\t"."$jjprox"."\t"."$all_length[$i][4]".
"\t"."$C"."\t"."$ii"."\t"."$jj"."\t"."$all_length[$i][5]".
"\t"."$D"."\t"."$kk"."\t"."$ll"."\t"."$all_length[$i][6]".
"\t"."$E"."\t"."$mm"."\t"."$nn"."\t"."$all_length[$i][7]".
"\t"."$F"."\t"."$oo"."\t"."$pp"."\t"."$all_length[$i][8]".
"\t"."$Lprox"."\t"."$qqprox"."\t"."$rrprox"."\t"."$all_length[$i][9]".
"\t"."$L"."\t"."$qq"."\t"."$rr"."\t"."$all_length[$i][10]".
"\t"."$M"."\t"."$ss"."\t"."$tt"."\t"."$all_length[$i][11]".
"\t"."$O"."\t"."$uu"."\t"."$vv"."\t"."$all_length[$i][12]".
"\t"."$p"."\t"."$ww"."\t"."$xx"."\t"."$all_length[$i][13]".
"\t"."$q"."\t"."$yy"."\t"."$zz"."\t"."$all_length[$i][14]"."\t"."$k"."\t"."$path\t$pol\t$length[$i]\n"; #
	$k=0;
	$h=0;
	$g=0;
	$A=0;
	$B=0;
	$C=0;
	$D=0;
	$E=0;
	$F=0;
	$L=0;
	$M=0;
	$O=0;
	$p=0;
	$q=0;
	$aa=0;
	$bb=0;
	$cc=0;
	$dd=0;
	$ee=0;
	$ff=0;
	$gg=0;
	$hh=0;
	$ii=0;
	$jj=0;
	$kk=0;
	$ll=0;
	$mm=0;
	$nn=0;
	$oo=0;
	$pp=0;
	$qq=0;
	$rr=0;
	$ss=0;
	$tt=0;
	$uu=0;
	$vv=0;
	$ww=0;
	$xx=0;
	$yy=0;
	$zz=0;
	$path=0;
	$pol=0;
	$Cprox=0;
	$Lprox=0;
	$iiprox=0;
	$jjprox=0;
	$rrprox=0;
	$qqprox=0;
}

##########################################################################
