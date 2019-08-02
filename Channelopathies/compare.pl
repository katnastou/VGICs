#!/usr/bin/perl -w

open (IN,'fullrecordOFdiseases.txt');

#KCNH1	O95259	K	217	N	ND	Temple-Baraitser syndrome

while (<IN>)
{
	if ($_=~/CACNA\w+\t\S+\t\w{1}\t\d+\t\w{1}\t\S+\t(.*)/)
	{
		chomp $_;
		push (@Cav1, $1);
		push (@Cav2, $1);
	}
	elsif ($_=~/KCN\w+\t\S+\t\w{1}\t\d+\t\w{1}\t\S+\t(.*)/)
	{
		chomp $_;
		push (@Kv1, $1);
		push (@Kv2, $1);
	}
	elsif ($_=~/SCN\w+\t\S+\t\w{1}\t\d+\t\w{1}\t\S+\t(.*)/)
	{
		chomp $_;
		push (@Nav1, $1);
		push (@Nav2, $1);
	}
}

sub unique #subroutine gia afairesh pollaplwn timwn apo pinaka
{
my %disease;
grep !$disease{$_}++,@_;
}

@Kvdis = unique(@Kv1);
@allKvs = unique(@Kv2);
@Cavdis = unique(@Cav1);
@allCavs = unique(@Cav2);
@Navdis = unique(@Nav1);
@allNavs = unique(@Nav2);

#print "$#Cavdis\t$#Kvdis\t$#Navdis\n";
#foreach $q (@Kvdis){print "$q\n";} <-- h afairesh twn duplicates ginetai swsta

#Εδω βρισκουμε κοινες ασθενειες στις 3 οικογενειες#
print "#KoinesAs8eneiesTwn3Oikogeneiwn#\n";
for ($i=0;$i<=$#Navdis;$i++)
{
	for ($j=0;$j<=$#Kvdis;$j++)
	{
		for ($k=0;$k<=$#Cavdis;$k++)
		{
			if ($Navdis[$i] eq $Kvdis[$j] && $Navdis[$i] eq $Cavdis[$k] && $Cavdis[$k] eq $Kvdis[$j]) 
			{
			print "$Navdis[$i]\n";
			}
		}
	}
}

#Εδω βρισκουμε κοινες ασθενειες ανα 2 οικογενειες#

#κοινες ασθενειες μεταξυ KVs και CAVs#
print "\n#KoinesAs8eneiesKVs-CAVs#\n";

for ($k=0;$k<=$#Kvdis;$k++)
{
	for($j=0;$j<=$#Cavdis;$j++)
	{
		if ($Kvdis[$k] eq $Cavdis[$j])
		{
			print "$Kvdis[$k]\n";
		}
	}
}
#κοινες ασθενειες μεταξυ KVs και NAVs#
print "\n#KoinesAs8eneiesKVs-NAVs#\n";

for ($k=0;$k<=$#Kvdis;$k++)
{
	for($j=0;$j<=$#Navdis;$j++)
	{
		if ($Kvdis[$k] eq $Navdis[$j])
		{
			print "$Kvdis[$k]\n";
		}
	}
}
#κοινες ασθενειες μεταξυ NAVs και CAVs#
print "\n#KoinesAs8eneiesNAVs-CAVs#\n";

for ($k=0;$k<=$#Navdis;$k++)
{
	for($j=0;$j<=$#Cavdis;$j++)
	{
		if ($Navdis[$k] eq $Cavdis[$j])
		{
			print "$Navdis[$k]\n";
			next;
		}
	}
}


#KVs μοναδικες ασθενειες#

print "\n#UniqueKvDiseases#\n";

for ($b=0;$b<=$#Kvdis;$b++)
{
	for ($h=0,$k=0;$h<=$#Navdis && $k<=$#Cavdis;$h++,$k++)
	{
		if ($Kvdis[$b] eq $Navdis[$h])
		{
			undef $allKvs[$b];
		}
		elsif ($Kvdis[$b] eq $Cavdis[$k])
		{
			undef $allKvs[$b];
		}
		else
		{
			next;
		}
	}
}

@uniqueKvs = grep { defined($_)}@allKvs;

for ($b=0;$b<=$#uniqueKvs;$b++)
{
	print "$uniqueKvs[$b]\n";
}


#CAVs μοναδικες ασθενειες#

print "\n#UniqueCavDiseases#\n";

for ($b=0;$b<=$#Cavdis;$b++)
{
	for ($h=0,$k=0;$h<=$#Kvdis && $k<=$#Navdis;$h++,$k++)
	{
		if ($Cavdis[$b] eq $Kvdis[$h])
		{
			undef $allCavs[$b];
		}
		elsif ($Cavdis[$b] eq $Navdis[$k])
		{
			undef $allCavs[$b];
		}
		else
		{
			next;
		}
	}
}

@uniqueCavs = grep { defined($_)}@allCavs;

for ($b=0;$b<=$#uniqueCavs;$b++)
{
	print "$uniqueCavs[$b]\n";
}


#NAVs μοναδικες ασθενειες#

print "\n#UniqueNavDiseases#\n";

for ($b=0;$b<=$#Navdis;$b++)
{
	for ($h=0,$k=0;$h<=$#Kvdis && $k<=$#Cavdis;$h++,$k++)
	{
		if ($Navdis[$b] eq $Kvdis[$h])
		{
			undef $allNavs[$b];
		}
		elsif ($Navdis[$b] eq $Cavdis[$k])
		{
			undef $allNavs[$b];
		}
		else
		{
			next;
		}
	}
}

@uniqueNavs = grep { defined($_)}@allNavs;

for ($b=0;$b<=$#uniqueKvs;$b++)
{
	print "$uniqueNavs[$b]\n";
}



##########################################