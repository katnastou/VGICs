#!/usr/bin/perl 


for ($i=1;$i<=100;$i++)#διαβαζει τα 100 θεωτητικα συνολα του φακελου
{
	@changes =();
	@counts =();
	open (IN,"<allpol.$i\.txt");
	while(<IN>)
	{
		if ($_=~/^\S+\t\S(\S+\s\S+)\S+\t(\d+)/g)
		{
			push (@changes,"$1");
			push (@counts,$2);
		}
		$all_changes[$i-1]=[@changes];#κραταει σε δισδιαστατους πινακες: την αμινοξικη αλλαγη
		$all_counts[$i-1]=[@counts];#και τη συχνοτητα εμφανισης της
	}
}
#print "@$_", "\n" foreach ( @all_changes );
@original_changes = ("charged charged"
,"charged non-polar"
,"charged polar"
,"non-polar charged"
,"non-polar non-polar"
,"non-polar polar"
,"polar charged"
,"polar non-polar"
,"polar polar");

#calculates mean of 100 samples and fixes the array of counts#
$g=0;
for ($x=0;$x<=$#all_changes;$x++)
{
	$a=scalar(@{ $all_changes[$x] });
	for ($y=0,$j=0; $y<=$#original_changes || $j<=$a; $y++,$j++)
	{
			if ($original_changes[$y] eq $all_changes[$x][$j-$g])#εφοσον κανει match η θεωρητικη με την πραγματικη αλλαγη
			{
				$mean[$y] += $all_counts[$x][$j]/100;#σπρωχνει σε πινακα τον μεσο ορο της θεωρητικης αλλαγης
				$fixed_counts[$x][$y]=$all_counts[$x][$j];#και σε αλλο πινακα ( ο οποιος γεμιζει με ολες τις αα-αλλαγες που υπαρχουν στο πραγματικο συνολο) τις αα-αλλαγες
				next;
			}
			else #αν δεν κανει match η θεωρητικη με την πραγματικη αλλαγη 
			{
				$mean[$y] += 0;#παρσαρει στον πινακα των μεσων ορων την τιμη 0 
				$fixed_counts[$x][$y]=0;# και στον πινακα των αλλαγων την πραγματικη αλλαγη
				$g++;
				next;
			}
			print "$original_changes[$y] $count[$y]\n";
	}
	$g=0;
}

#print "@mean\n";
#print "@$_", "\n" foreach ( @fixed_counts );


#calculates STD#
for ($i=0;$i<=$#fixed_counts;$i++)
{
	for ($k=0;$k<=$#mean;$k++)
	{
		$sqdiff[$k] += (($fixed_counts[$i][$k]-$mean[$k])**2);#υπολογιζεται το τετραγωνο της διαφορας καθε τιμης απο το μεσο ορο, που στη συνεχεια θα αξιοποιηθει για τον υπολογισμου του τυπικου σφ. το τυπικο σφαλμα υπολογιζεται βασει του τυπου SE= Σ(x-μ)^2/n-1, οπου x=η εκαστοτε τιμη του συνολου, μ=ο μεσος ορος και n=το μεγεθος του συνολου
	}
}

foreach $se (@sqdiff)# υπολογισμος του τυπικου σφαλματος
{
	push (@totsqdiff, $se/99); #SE = Σ(x-μ)^2/n-1 
}

#print "@totsqdiff\n";

foreach $std (@totsqdiff)# η τυπικη αποκλιση ειναι η τετραγωνικη ριζα του τυπικου σφαλματος που υπολογιζεται πιο πανω
{
	push (@std, sqrt($std));
}

$j=0;
for ($i=0;$i<=$#original_changes;$i++)
{
	$j++;
	print "$mean[$i]\t";
	if ($j == 3)
	{
		print "\n";
		$j=0;
	}
}

print "\n\n\n";

for ($i=0;$i<=$#original_changes;$i++)
{
	$j++;
	print "$std[$i]\t";
	if ($j == 3)
	{
		print "\n";
		$j=0;
	}
}

#Η ιδια διαδικασια με την ιδια σειρα πραγματοποιεται και στα υπολοιπα προγραμματα που υπολογιζουν
# θεωρητικο μεσο ορο και τυπικη αποκλιση στα υπολοιπα θεωρητικα συνολα