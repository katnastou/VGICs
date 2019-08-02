#!/usr/bin/perl -w

#creates_a_full_record_for_all_cavs_which_contains_infos_about:1)gn_name,2)uniprot_ac,3)familiy_member_name,4)rs_code,5)snp_position,6)protein_segment,7)topological_domain,8)normaa,9)snp,10)pathogenicity

open (IN,'cav_final_dataset.txt');
open (IN1,'human_cavs_uniprot.txt');

@name=();
@start=();
@end=();
@gn=();
@ac=();
@normaa=();
@position=();
@changeaa=();
@clinsig=();
$i=0;

%cavs=("CACNA1S" => "Cav1.1","CACNA1C" => "Cav1.2","CACNA1D" => "Cav1.3","CACNA1F" => "Cav1.4","CACNA1A" => "Cav2.1",
"CACNA1B" => "Cav2.2","CACNA1E" => "Cav2.3","CACNA1G" => "Cav3.1","CACNA1H" => "Cav3.2","CACNA1I" => "Cav3.3");

#CACNA1S	Q13698	L	132	M	Polymorphism
while (<IN>)
{
	if ($_=~/^(\w+)\t(\S+)\t(\w{1})\t(\d+)\t(\S{1})\t(.*)/g)
	{
		push (@gn,$1);
		push (@ac,$2);
		push (@normaa,$3);
		push (@position,$4);
		push (@changeaa,$5);
		push (@clinsig,$6);
	}
}
#print $#gn;

while (<IN1>)
{
	if ($_=~/^GN\s{3}Name\=(\w+)\;/mg)
	{
		push (@name,$1);
		@start=();
		@end=();
	}
	while ($_=~/^FT\s+(TRANSMEM|TOPO_DOM)\s+(\d+)\s+(\d+)\s+.*/mg)
	{
		push (@start, $2);
		push (@end, $3);
		#print $2."\n";
	}
	if ($_=~/^\/\//g)
	{
		#print $i."\n";
		$all_start[$i]=[@start];
		$all_end[$i]=[@end];
		#print "@start\n";
		$i++;
	}
}

$topology[0]="N-terminal";
$topology[1]="S1DI";
$topology[2]="EL1";
$topology[3]="S2DI";
$topology[4]="IL2";
$topology[5]="S3DI";
$topology[6]="EL2";
$topology[7]="S4DI";
$topology[8]="IL3";
$topology[9]="S5DI";
$topology[10]="PL1";
$topology[11]="S6DI";
$topology[12]="IL4";
$topology[13]="S1DII";
$topology[14]="EL4";
$topology[15]="S2DII";
$topology[16]="IL5";
$topology[17]="S3DII";
$topology[18]="EL5";
$topology[19]="S4DII";
$topology[20]="IL6";
$topology[21]="S5DII";
$topology[22]="PL2";
$topology[23]="S6DII";
$topology[24]="IL7";
$topology[25]="S1DIII";
$topology[26]="EL7";
$topology[27]="S2DIII";
$topology[28]="IL8";
$topology[29]="S3DIII";
$topology[30]="EL8";
$topology[31]="S4DIII";
$topology[32]="IL9";
$topology[33]="S5DIII";
$topology[34]="PL3";
$topology[35]="S6DIII";
$topology[36]="IL10";
$topology[37]="S1DIV";
$topology[38]="EL10";
$topology[39]="S2DIV";
$topology[40]="IL11";
$topology[41]="S3DIV";
$topology[42]="EL11";
$topology[43]="S4DIV";
$topology[44]="IL12";
$topology[45]="S5DIV";
$topology[46]="PL4";
$topology[47]="S6DIV";
$topology[48]="C-terminal";

#print $all_topology[2][5]."\n"; --->8elei fi3arisma to @all_topology
#print "@$_", "\n" foreach ( @all_start );
#print "@$_", "\n" foreach ( @all_end );


for ($j=0;$j<=$#name;$j++)
{
	for ($x=0;$x<=$#gn;$x++)
	{
		if ($gn[$x] eq $name[$j])
		{
			for ($y=0;$y<=$#topology;$y++)
			{
				if ($y % 4 == 0 && $y != 0 && $y != 48)
				{
					$end = $all_start[$j][$y] + 4;
					$loop_start = $all_start[$j][$y] + 5;
					if ($position[$x] >= $all_start[$j][$y] && $position[$x] <= $end)
					{
						print "$ac[$x]\t$gn[$x]\t$cavs{$gn[$x]}\t$normaa[$x]\t$position[$x]\t$changeaa[$x]\t$all_start[$j][$y]-$end\t$topology[$y]prox\t$clinsig[$x]\n";
					}
					elsif ($position[$x] >= $all_start[$j][$y] + 6 && $position[$x] <= $all_end[$j][$y])
					{
						print "$ac[$x]\t$gn[$x]\t$cavs{$gn[$x]}\t$normaa[$x]\t$position[$x]\t$changeaa[$x]\t$loop_start-$all_end[$j][$y]\t$topology[$y]\t$clinsig[$x]\n";
					}
				}
				else
				{
					if ($position[$x] >= $all_start[$j][$y] && $position[$x] <= $all_end[$j][$y] )
					{
						print "$ac[$x]\t$gn[$x]\t$cavs{$gn[$x]}\t$normaa[$x]\t$position[$x]\t$changeaa[$x]\t$all_start[$j][$y]-$all_end[$j][$y]\t$topology[$y]\t$clinsig[$x]\n";
					}
				}
			}
		}
	}
}


