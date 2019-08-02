#!/usr/bin/perl -w

#navs#counts_snps_for_each_topological_domain

open (IN1,'human_navs_uniprot.txt');
open (IN2,'navs_snp_position.txt');
@name=();
@start=();
@end=();
@length=();
@gn=();
@ac=();

%navs=("SCN1A" => "Nav1.1","SCN2A" => "Nav1.2","SCN3A" => "Nav1.3","SCN4A" => "Nav1.4","SCN5A" => "Nav1.5","SCN8A" => "Nav1.6",
"SCN9A" => "Nav1.7","SCN10A" => "Nav1.8","SCN11A" => "Nav1.9");

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
$Q=0;
$R=0;
$T=0;
$U=0;
$V=0;
$W=0;
$X=0;
$Y=0;
$Z=0;
$II=0;
$IA=0;
$IB=0;
$IC=0;
$AA=0;
$AB=0;
$AC=0;
$AD=0;
$AE=0;
$AF=0;
$AG=0;
$AH=0;
$AI=0;
$AJ=0;
$AK=0;
$AL=0;
$AM=0;
$AN=0;
$AO=0;
$AP=0;
$AQ=0;
$AR=0;
$AS=0;
$AT=0;
$AU=0;
$AV=0;
$AW=0;
$AX=0;
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
$aaa=0;
$bbb=0;
$ccc=0;
$ddd=0;
$eee=0;
$fff=0;
$ggg=0;
$hhh=0;
$iii=0;
$jjj=0;
$kkk=0;
$lll=0;
$mmm=0;
$nnn=0;
$ooo=0;
$ppp=0;
$qqq=0;
$rrr=0;
$sss=0;
$ttt=0;
$uuu=0;
$vvv=0;
$www=0;
$xxx=0;
$yyy=0;
$zzz=0;
$aaaa=0;
$bbbb=0;
$cccc=0;
$dddd=0;
$eeee=0;
$ffff=0;
$gggg=0;
$hhhh=0;
$iiii=0;
$jjjj=0;
$kkkk=0;
$llll=0;
$mmmm=0;
$nnnn=0;
$oooo=0;
$pppp=0;
$qqqq=0;
$rrrr=0;
$ssss=0;
$tttt=0;
$uuuu=0;
$vvvv=0;
$wwww=0;
$xxxx=0;
$yyyy=0;
$zzzz=0;
$aaaaa=0;
$bbbbb=0;
$ccccc=0;
$ddddd=0;
$eeeee=0;
$fffff=0;
$ggggg=0;
$hhhhh=0;
$iiiii=0;
$jjjjj=0;
$kkkkk=0;
$lllll=0;
$mmmmm=0;
$nnnnn=0;
$ooooo=0;
$ppppp=0;
$qqqqq=0;
$rrrrr=0;
$sssss=0;
$ttttt=0;


while (<IN1>)
{
	if ($_=~/^GN\s{3}Name\=(\w+)\;*/mg)
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
	if ($_=~/^SQ\s+SEQUENCE\s+(\d+).*/mg)
	{
		push (@length, $1);
	}
	if ($_=~/^\/\//g)
	{
		#print $i."\n";
		$all_start[$i]=[@start];
		$all_end[$i]=[@end];
		#$all_length[$i]=[@length];
		#print "@start\n";
		$i++;
	}
}
#print $#name."\n";

for($x=0;$x<=$#name;$x++)
{
	for($y=0;$y<=48;$y++)
	{
	$all_length[$x][$y]=$all_end[$x][$y]-$all_start[$x][$y]+1;
	}
}

#Q9Y5Y9	SCN10A	Nav1.8	V	1073	A	891-1147	IL7	Polymorphism
while (<IN2>)
{
	if ($_=~/^(\w+)\t(\w+)\t\S+\t\w\t\d+\t\w\t\S+\t(\S+)\t(.*)/g)
	{
		push (@ac,$1);
		push (@gn,$2);
		push (@topodom,$3);
		push (@clinsig,$4);
	}
}

#print $#length;
#print "@$_", "\n" foreach ( @all_length );
#print "@$_", "\n" foreach ( @all_start );
#print "@$_", "\n" foreach ( @all_end );

for ($i=0;$i<=$#name;$i++)
{
	for ($j=0;$j<=$#gn;$j++)
	{
		if ($name[$i] eq $gn[$j])
		{
			if($clinsig[$j]!~/^Unclassified/)
			{
				$k++;
				if ($topodom[$j]=~/^N-terminal/)
				{
					$h++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$aa++;
					}
					else
					{
						$bb++;
					}
				}
				if ($topodom[$j]=~/^S1DI\b/)
				{
					$g++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$cc++;
					}
					else
					{
						$dd++;
					}
				}
				if ($topodom[$j]=~/^EL1\b/)
				{
					$A++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ee++;
					}
					else
					{
						$ff++;
					}
				}
				if ($topodom[$j]=~/^S2DI\b/)
				{
					$B++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$gg++;
					}
					else
					{
						$hh++;
					}
				}
				if ($topodom[$j]=~/^IL2/)
				{
					$C++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ii++;
					}
					else
					{
						$jj++;
					}
				}
				if ($topodom[$j]=~/^S3DI\b/)
				{
					$D++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$kk++;
					}
					else
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
					else
					{
						$nn++;
					}
				}
				if ($topodom[$j]=~/^S4DI\b/)
				{
					$F++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$oo++;
					}
					else
					{
						$pp++;
					}
				}
				if ($topodom[$j]=~/^IL3/)
				{
					$L++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$qq++;
					}
					else
					{
						$rr++;
					}
				}
				if ($topodom[$j]=~/^S5DI\b/)
				{
					$M++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ss++;
					}
					else
					{
						$tt++;
					}
				}
				if ($topodom[$j]=~/^PL1/)
				{
					$O++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$uu++;
					}
					else
					{
						$vv++;
					}
				}
				if ($topodom[$j]=~/^S6DI\b/)
				{
					$p++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ww++;
					}
					else
					{
						$xx++;
					}
				}
				if ($topodom[$j]=~/^IL4/)
				{
					$q++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$yy++;
					}
					else
					{
						$zz++;
					}
				}
				if ($topodom[$j]=~/^S1DII\b/)
				{
					$R++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$aaa++;
					}
					else
					{
						$bbb++;
					}
				}
				if ($topodom[$j]=~/^EL4/)
				{
					$T++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ccc++;
					}
					else
					{
						$ddd++;
					}
				}
				if ($topodom[$j]=~/^S2DII\b/)
				{
					$U++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$eee++;
					}
					else
					{
						$fff++;
					}
				}
				if ($topodom[$j]=~/^IL5/)
				{
					$V++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ggg++;
					}
					else
					{
						$hhh++;
					}
				}
				if ($topodom[$j]=~/^S3DII\b/)
				{
					$W++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$iii++;
					}
					else
					{
						$jjj++;
					}
				}
				if ($topodom[$j]=~/^EL5/)
				{
					$X++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$kkk++;
					}
					else
					{
						$lll++;
					}
				}
				if ($topodom[$j]=~/^S4DII\b/)
				{
					$Y++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$mmm++;
					}
					else
					{
						$nnn++;
					}
				}
				if ($topodom[$j]=~/^IL6/)
				{
					$Z++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ooo++;
					}
					else
					{
						$ppp++;
					}
				}
				if ($topodom[$j]=~/^S5DII\b/)
				{
					$II++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$qqq++;
					}
					else
					{
						$rrr++;
					}
				}
				if ($topodom[$j]=~/^PL2/)
				{
					$IA++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$sss++;
					}
					else
					{
						$ttt++;
					}
				}
				if ($topodom[$j]=~/^S6DII\b/)
				{
					$IB++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$uuu++;
					}
					else
					{
						$vvv++;
					}
				}
				if ($topodom[$j]=~/^IL7/)
				{
					$IC++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$www++;
					}
					else
					{
						$xxx++;
					}
				}
				if ($topodom[$j]=~/^S1DIII/)
				{
					$AA++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$yyy++;
					}
					else
					{
						$zzz++;
					}
				}
				if ($topodom[$j]=~/^EL7/)
				{
					$AB++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$aaaa++;
					}
					else
					{
						$bbbb++;
					}
				}
				if ($topodom[$j]=~/^S2DIII/)
				{
					$AC++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$cccc++;
					}
					else
					{
						$dddd++;
					}
				}
				if ($topodom[$j]=~/^IL8/)
				{
					$AD++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$eeee++;
					}
					else
					{
						$ffff++;
					}
				}
				if ($topodom[$j]=~/^S3DIII/)
				{
					$AE++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$gggg++;
					}
					else
					{
						$hhhh++;
					}
				}
				if ($topodom[$j]=~/^EL8/)
				{
					$AF++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$iiii++;
					}
					else
					{
						$jjjj++;
					}
				}
				if ($topodom[$j]=~/^S4DIII/)
				{
					$AG++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$kkkk++;
					}
					else
					{
						$llll++;
					}
				}
				if ($topodom[$j]=~/^IL9/)
				{
					$AH++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$mmmm++;
					}
					else
					{
						$nnnn++;
					}
				}
				if ($topodom[$j]=~/^S5DIII/)
				{
					$AI++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$oooo++;
					}
					else
					{
						$pppp++;
					}
				}
				if ($topodom[$j]=~/^PL3/)
				{
					$AJ++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$qqqq++;
					}
					else
					{
						$rrrr++;
					}
				}
				if ($topodom[$j]=~/^S6DIII/)
				{
					$AK++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ssss++;
					}
					else
					{
						$tttt++;
					}
				}
				if ($topodom[$j]=~/^IL10/)
				{
					$AL++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$uuuu++;
					}
					else
					{
						$vvvv++;
					}
				}
				if ($topodom[$j]=~/^S1DIV/)
				{
					$AM++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$wwww++;
					}
					else
					{
						$xxxx++;
					}
				}
				if ($topodom[$j]=~/^EL10/)
				{
					$AN++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$yyyy++;
					}
					else
					{
						$zzzz++;
					}
				}
				if ($topodom[$j]=~/^S2DIV/)
				{
					$AO++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$aaaaa++;
					}
					else
					{
						$bbbbb++;
					}
				}
				if ($topodom[$j]=~/^IL11/)
				{
					$AP++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ccccc++;
					}
					else
					{
						$ddddd++;
					}
				}
				if ($topodom[$j]=~/^S3DIV/)
				{
					$AQ++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$eeeee++;
					}
					else
					{
						$fffff++;
					}
				}
				if ($topodom[$j]=~/^EL11/)
				{
					$AR++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ggggg++;
					}
					else
					{
						$hhhhh++;
					}
				}
				if ($topodom[$j]=~/^S4DIV/)
				{
					$AS++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$iiiii++;
					}
					else
					{
						$jjjjj++;
					}
				}
				if ($topodom[$j]=~/^IL12/)
				{
					$AT++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$kkkkk++;
					}
					else
					{
						$lllll++;
					}
				}
				if ($topodom[$j]=~/^S5DIV/)
				{
					$AU++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$mmmmm++;
					}
					else
					{
						$nnnnn++;
					}
				}
				if ($topodom[$j]=~/^PL4/)
				{
					$AV++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$ooooo++;
					}
					else
					{
						$ppppp++;
					}
				}
				if ($topodom[$j]=~/^S6DIV/)
				{
					$AW++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$qqqqq++;
					}
					else
					{
						$rrrrr++;
					}
				}
				if ($topodom[$j]=~/^C-terminal/)
				{
					$AX++;
					if ($clinsig[$j]=~/^Pathogenic/)
					{
						$sssss++;
					}
					else
					{
						$ttttt++;
					}
				}
			}
		}
	}
	$path=$aa+$cc+$ee+$gg+$ii+$kk+$mm+$oo+$qq+$ss+$uu+$ww+$yy+$aaa+$ccc+$eee+$ggg+$iii+$kkk+$mmm+$ooo+$qqq+$sss+$uuu+$www+$yyy+$aaaa+$cccc+$eeee+$gggg+$iiii+$kkkk+$mmmm+$oooo+$qqqq+$ssss+$uuuu+$wwww+$yyyy+$aaaaa+$ccccc+$eeeee+$ggggg+$iiiii+$kkkkk+$mmmmm+$ooooo+$qqqqq+$sssss;
	$pol=$bb+$dd+$ff+$hh+$jj+$ll+$nn+$pp+$rr+$tt+$vv+$xx+$zz+$bbb+$ddd+$fff+$hhh+$jjj+$lll+$nnn+$ppp+$rrr+$ttt+$vvv+$xxx+$zzz+$bbbb+$dddd+$ffff+$hhhh+$jjjj+$llll+$nnnn+$pppp+$rrrr+$tttt+$vvvv+$xxxx+$zzzz+$bbbbb+$ddddd+$fffff+$hhhhh+$jjjjj+$lllll+$nnnnn+$ppppp+$rrrrr+$ttttt;
	print "$name[$i]\t$navs{$name[$i]}"."\t"
	."$h"."\t"."$aa"."\t"."$bb"."\t"."$all_length[$i][0]"."\t"
	."$g"."\t"."$cc"."\t"."$dd"."\t"."$all_length[$i][1]"."\t"
	."$A"."\t"."$ee"."\t"."$ff"."\t"."$all_length[$i][2]"."\t"
	."$B"."\t"."$gg"."\t"."$hh"."\t"."$all_length[$i][3]"."\t"
	."$C"."\t"."$ii"."\t"."$jj"."\t"."$all_length[$i][4]"."\t"
	."$D"."\t"."$kk"."\t"."$ll"."\t"."$all_length[$i][5]"."\t"
	."$E"."\t"."$mm"."\t"."$nn"."\t"."$all_length[$i][6]"."\t"
	."$F"."\t"."$oo"."\t"."$pp"."\t"."$all_length[$i][7]"."\t"
	."$L"."\t"."$qq"."\t"."$rr"."\t"."$all_length[$i][8]"."\t"
	."$M"."\t"."$ss"."\t"."$tt"."\t"."$all_length[$i][9]"."\t"
	."$O"."\t"."$uu"."\t"."$vv"."\t"."$all_length[$i][10]"."\t"
	."$p"."\t"."$ww"."\t"."$xx"."\t"."$all_length[$i][11]"."\t"
	."$q"."\t"."$yy"."\t"."$zz"."\t"."$all_length[$i][12]"."\t"
	."$R"."\t"."$aaa"."\t"."$bbb"."\t"."$all_length[$i][13]"."\t"
	."$T"."\t"."$ccc"."\t"."$ddd"."\t"."$all_length[$i][14]"."\t"
	."$U"."\t"."$eee"."\t"."$fff"."\t"."$all_length[$i][15]"."\t"
	."$V"."\t"."$ggg"."\t"."$hhh"."\t"."$all_length[$i][16]"."\t"
	."$W"."\t"."$iii"."\t"."$jjj"."\t"."$all_length[$i][17]"."\t"
	."$X"."\t"."$kkk"."\t"."$lll"."\t"."$all_length[$i][18]"."\t"
	."$Y"."\t"."$mmm"."\t"."$nnn"."\t"."$all_length[$i][19]"."\t"
	."$Z"."\t"."$ooo"."\t"."$ppp"."\t"."$all_length[$i][20]"."\t"
	."$II"."\t"."$qqq"."\t"."$rrr"."\t"."$all_length[$i][21]"."\t"
	."$IA"."\t"."$sss"."\t"."$ttt"."\t"."$all_length[$i][22]"."\t"
	."$IB"."\t"."$uuu"."\t"."$vvv"."\t"."$all_length[$i][23]"."\t"
	."$IC"."\t"."$www"."\t"."$xxx"."\t"."$all_length[$i][24]"."\t"
	."$AA"."\t"."$yyy"."\t"."$zzz"."\t"."$all_length[$i][25]"."\t"
	."$AB"."\t"."$aaaa"."\t"."$bbbb"."\t"."$all_length[$i][26]"."\t"
	."$AC"."\t"."$cccc"."\t"."$dddd"."\t"."$all_length[$i][27]"."\t"
	."$AD"."\t"."$eeee"."\t"."$ffff"."\t"."$all_length[$i][28]"."\t"
	."$AE"."\t"."$gggg"."\t"."$hhhh"."\t"."$all_length[$i][29]"."\t"
	."$AF"."\t"."$iiii"."\t"."$jjjj"."\t"."$all_length[$i][30]"."\t"
	."$AG"."\t"."$kkkk"."\t"."$llll"."\t"."$all_length[$i][31]"."\t"
	."$AH"."\t"."$mmmm"."\t"."$nnnn"."\t"."$all_length[$i][32]"."\t"
	."$AI"."\t"."$oooo"."\t"."$pppp"."\t"."$all_length[$i][33]"."\t"
	."$AJ"."\t"."$qqqq"."\t"."$rrrr"."\t"."$all_length[$i][34]"."\t"
	."$AK"."\t"."$ssss"."\t"."$tttt"."\t"."$all_length[$i][35]"."\t"
	."$AL"."\t"."$uuuu"."\t"."$vvvv"."\t"."$all_length[$i][36]"."\t"
	."$AM"."\t"."$wwww"."\t"."$xxxx"."\t"."$all_length[$i][37]"."\t"
	."$AN"."\t"."$yyyy"."\t"."$zzzz"."\t"."$all_length[$i][38]"."\t"
	."$AO"."\t"."$aaaaa"."\t"."$bbbbb"."\t"."$all_length[$i][39]"."\t"
	."$AP"."\t"."$ccccc"."\t"."$ddddd"."\t"."$all_length[$i][40]"."\t"
	."$AQ"."\t"."$eeeee"."\t"."$fffff"."\t"."$all_length[$i][41]"."\t"
	."$AR"."\t"."$ggggg"."\t"."$hhhhh"."\t"."$all_length[$i][42]"."\t"
	."$AS"."\t"."$iiiii"."\t"."$jjjjj"."\t"."$all_length[$i][43]"."\t"
	."$AT"."\t"."$kkkkk"."\t"."$lllll"."\t"."$all_length[$i][44]"."\t"
	."$AU"."\t"."$mmmmm"."\t"."$nnnnn"."\t"."$all_length[$i][45]"."\t"
	."$AV"."\t"."$ooooo"."\t"."$ppppp"."\t"."$all_length[$i][46]"."\t"
	."$AW"."\t"."$qqqqq"."\t"."$rrrrr"."\t"."$all_length[$i][47]"."\t"
	."$AX"."\t"."$sssss"."\t"."$ttttt"."\t"."$all_length[$i][48]"."\t"
	."$k"."\t"."$path\t$pol\t"."$length[$i]"."\n"; #
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
	$Q=0;
	$R=0;
	$T=0;
	$U=0;
	$V=0;
	$W=0;
	$X=0;
	$Y=0;
	$Z=0;
	$II=0;
	$IA=0;
	$IB=0;
	$IC=0;
	$AA=0;
	$AB=0;
	$AC=0;
	$AD=0;
	$AE=0;
	$AF=0;
	$AG=0;
	$AH=0;
	$AI=0;
	$AJ=0;
	$AK=0;
	$AL=0;
	$AM=0;
	$AN=0;
	$AO=0;
	$AP=0;
	$AQ=0;
	$AR=0;
	$AS=0;
	$AT=0;
	$AU=0;
	$AV=0;
	$AW=0;
	$AX=0;
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
	$aaa=0;
	$bbb=0;
	$ccc=0;
	$ddd=0;
	$eee=0;
	$fff=0;
	$ggg=0;
	$hhh=0;
	$iii=0;
	$jjj=0;
	$kkk=0;
	$lll=0;
	$mmm=0;
	$nnn=0;
	$ooo=0;
	$ppp=0;
	$qqq=0;
	$rrr=0;
	$sss=0;
	$ttt=0;
	$uuu=0;
	$vvv=0;
	$www=0;
	$xxx=0;
	$yyy=0;
	$zzz=0;
	$aaaa=0;
	$bbbb=0;
	$cccc=0;
	$dddd=0;
	$eeee=0;
	$ffff=0;
	$gggg=0;
	$hhhh=0;
	$iiii=0;
	$jjjj=0;
	$kkkk=0;
	$llll=0;
	$mmmm=0;
	$nnnn=0;
	$oooo=0;
	$pppp=0;
	$qqqq=0;
	$rrrr=0;
	$ssss=0;
	$tttt=0;
	$uuuu=0;
	$vvvv=0;
	$wwww=0;
	$xxxx=0;
	$yyyy=0;
	$zzzz=0;
	$aaaaa=0;
	$bbbbb=0;
	$ccccc=0;
	$ddddd=0;
	$eeeee=0;
	$fffff=0;
	$ggggg=0;
	$hhhhh=0;
	$iiiii=0;
	$jjjjj=0;
	$kkkkk=0;
	$lllll=0;
	$mmmmm=0;
	$nnnnn=0;
	$ooooo=0;
	$ppppp=0;
	$qqqqq=0;
	$rrrrr=0;
	$sssss=0;
	$ttttt=0;
	$path=0;
	$pol=0;
}
