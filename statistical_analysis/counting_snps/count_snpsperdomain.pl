#!usr/bin/perl -w

open (IN,"snps_total.txt");


$i=0;
$j=0;
$h=0;
$k=0;
$l=0;
$m=0;
$n=0;

while (<IN>)
{
	if ($_!~/\tUnclassified/)
	{
		if ($_=~/\tN\-terminal/)
		{
			$n++;
			if($_=~/\tPathogenic/)
			{
				$y++;
			}
			else
			{
				$z++;
			}
		}
		elsif ($_=~/\tS1\w*\t/)
		{
			$i++;
			if($_=~/\tPathogenic/)
			{
				$a++;
			}
			else
			{
				$b++;
			}
		}
		elsif ($_=~/\tS2\w*\t/)
		{
			$x++;
			if($_=~/\tPathogenic/)
			{
				$ff++;
			}
			else
			{
				$gg++;
			}
		}
		elsif ($_=~/\tS3\w*\t/)
		{
			$u++;
			if($_=~/\tPathogenic/)
			{
				$hh++;
			}
			else
			{
				$ii++;
			}
		}
		elsif ($_=~/\tS4\w*\t/)
		{
			$w++;
			if($_=~/\tPathogenic/)
			{
				$jj++;
			}
			else
			{
				$kk++;
			}
		}
		elsif ($_=~/\tPL\w*/)
		{
			$j++;
			if($_=~/\tPathogenic/)
			{
				$c++;
			}
			else
			{
				$d++;
			}
		}
		elsif ($_=~/\tS5/)
		{
			$h++;
			if($_=~/\tPathogenic/)
			{
				$e++;
			}
			else
			{
				$f++;
			}
		}
		elsif ($_=~/\tS6/)
		{
			$t++;
			if($_=~/\tPathogenic/)
			{
				$ll++;
			}
			else
			{
				$mm++;
			}
		}
		elsif ($_=~/\tIL\d{1,2}\t/)
		{
			$k++;
			if($_=~/\tPathogenic/)
			{
				$g++;
			}
			else
			{
				$aa++;
			}
		}
		elsif($_=~/EL\w*/)
		{
			$l++;
			if($_=~/\tPathogenic/)
			{
				$bb++;
			}
			else
			{
				$cc++;
			}
		}
		elsif($_=~/C\-terminal/)
		{
			$m++;
			if($_=~/\tPathogenic/)
			{
				$dd++;
			}
			else
			{
				$ee++;
			}
		}
	}
}

$path=$a+$ff+$hh+$jj+$e+$c+$ll+$g+$bb+$dd+$y;
$pol=$b+$gg+$ii+$kk+$f+$d+$mm+$aa+$cc+$ee+$z;
$tots=$t+$w+$u+$x+$i+$j+$h+$k+$l+$m+$n;

print  "N-termainal\t$n\t$y\t$z\n".
"S1\t$i\t$a\t$b\n".
"S2\t$x\t$ff\t$gg\n".
"S3\t$u\t$hh\t$ii\n".
"S4\t$w\t$jj\t$kk\n".
"S5\t$h\t$e\t$f\n".
"pore loop\t$j\t$c\t$d\n".
"S6\t$t\t$ll\t$mm\n".
"ILs\t$k\t$g\t$aa\n".
"ELs\t$l\t$bb\t$cc\n".
"C-terminal\t$m\t$dd\t$ee\n".
"TOTAL\t$tots\t$path\t$pol";