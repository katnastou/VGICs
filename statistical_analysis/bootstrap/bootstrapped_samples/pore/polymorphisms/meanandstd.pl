#!/usr/bin/perl 


for ($i=1;$i<=1000;$i++)#διαβαζει τα 100 θεωτητικα συνολα του φακελου
{
	@changes =();
	@counts =();
	open (IN,"<porenonp.$i\.txt");
	while(<IN>)
	{
		if ($_=~/^\S+\t\S(\w)\s(\w)\S+\t(\d+)/g)
		{
			$aa = "$1$2";
			$count = $3;
			push (@changes,"$aa");
			push (@counts,$count);
			#print "$count,";
		}
		$all_changes[$i-1]=[@changes];#κραταει σε δισδιαστατους πινακες: την αμινοξικη αλλαγη
		$all_counts[$i-1]=[@counts];#και τη συχνοτητα εμφανισης της
	}
}
#print "@$_", "\n" foreach ( @all_changes );
@original_changes = (	"AA", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AK", "AL", "AM", "AN", "AP", "AQ", "AR", "AS", "AT", 
						"AV", "AW", "AY", "CA", "CC", "CD", "CE", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CP", "CQ", "CR", "CS", "CT", "CV", 
						"CW", "CY", "DA", "DC", "DD", "DE", "DF", "DG", "DH", "DI", "DK", "DL", "DM", "DN", "DP", "DQ", "DR", "DS", "DT", "DV", "DW", 
						"DY", "EA", "EC", "ED", "EE", "EF", "EG", "EH", "EI", "EK", "EL", "EM", "EN", "EP", "EQ", "ER", "ES", "ET", "EV", "EW", "EY", 
						"FA", "FC", "FD", "FE", "FF", "FG", "FH", "FI", "FK", "FL", "FM", "FN", "FP", "FQ", "FR", "FS", "FT", "FV", "FW", "FY", "GA", 
						"GC", "GD", "GE", "GF", "GG", "GH", "GI", "GK", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GV", "GW", "GY", "HA", "HC", 
						"HD", "HE", "HF", "HG", "HH", "HI", "HK", "HL", "HM", "HN", "HP", "HQ", "HR", "HS", "HT", "HV", "HW", "HY", "IA", "IC", "ID", 
						"IE", "IF", "IG", "IH", "II", "IK", "IL", "IM", "IN", "IP", "IQ", "IR", "IS", "IT", "IV", "IW", "IY", "KA", "KC", "KD", "KE", 
						"KF", "KG", "KH", "KI", "KK", "KL", "KM", "KN", "KP", "KQ", "KR", "KS", "KT", "KV", "KW", "KY", "LA", "LC", "LD", "LE", "LF", 
						"LG", "LH", "LI", "LK", "LL", "LM", "LN", "LP", "LQ", "LR", "LS", "LT", "LV", "LW", "LY", "MA", "MC", "MD", "ME", "MF", "MG", 
						"MH", "MI", "MK", "ML", "MM", "MN", "MP", "MQ", "MR", "MS", "MT", "MV", "MW", "MY", "NA", "NC", "ND", "NE", "NF", "NG", "NH", 
						"NI", "NK", "NL", "NM", "NN", "NP", "NQ", "NR", "NS", "NT", "NV", "NW", "NY", "PA", "PC", "PD", "PE", "PF", "PG", "PH", "PI", 
						"PK", "PL", "PM", "PN", "PP", "PQ", "PR", "PS", "PT", "PV", "PW", "PY", "QA", "QC", "QD", "QE", "QF", "QG", "QH", "QI", "QK", 
						"QL", "QM", "QN", "QP", "QQ", "QR", "QS", "QT", "QV", "QW", "QY", "RA", "RC", "RD", "RE", "RF", "RG", "RH", "RI", "RK", "RL", 
						"RM", "RN", "RP", "RQ", "RR", "RS", "RT", "RV", "RW", "RY", "SA", "SC", "SD", "SE", "SF", "SG", "SH", "SI", "SK", "SL", "SM", 
						"SN", "SP", "SQ", "SR", "SS", "ST", "SV", "SW", "SY", "TA", "TC", "TD", "TE", "TF", "TG", "TH", "TI", "TK", "TL", "TM", "TN", 
						"TP", "TQ", "TR", "TS", "TT", "TV", "TW", "TY", "VA", "VC", "VD", "VE", "VF", "VG", "VH", "VI", "VK", "VL", "VM", "VN", "VP", 
						"VQ", "VR", "VS", "VT", "VV", "VW", "VY", "WA", "WC", "WD", "WE", "WF", "WG", "WH", "WI", "WK", "WL", "WM", "WN", "WP", "WQ", 
						"WR", "WS", "WT", "WV", "WW", "WY", "YA", "YC", "YD", "YE", "YF", "YG", "YH", "YI", "YK", "YL", "YM", "YN", "YP", "YQ", "YR", 
						"YS", "YT", "YV", "YW", "YY");#πινακας με ολες τις αα-αλλαγες που συμβαινουν στο αρχικο συνολο μας
#print $#all_changes;

#calculates mean of 1000 samples and fixes the array of counts#
$g=0;
for ($x=0;$x<=$#all_changes;$x++)
{
	$a=scalar(@{ $all_changes[$x] });
	for ($y=0,$j=0; $y<=$#original_changes || $j<=$a; $y++,$j++)
	{
			if ($original_changes[$y] eq $all_changes[$x][$j-$g])#εφοσον κανει match η θεωρητικη με την πραγματικη αλλαγη
			{
				$mean[$y] += $all_counts[$x][$j-$g]/1000;#σπρωχνει σε πινακα τον μεσο ορο της θεωρητικης αλλαγης
				$fixed_counts[$x][$y]=$all_counts[$x][$j-$g];#και σε αλλο πινακα ( ο οποιος γεμιζει με ολες τις αα-αλλαγες που υπαρχουν στο πραγματικο συνολο) τις αα-αλλαγες
				next;
			}
			else #αν δεν κανει match η θεωρητικη με την πραγματικη αλλαγη 
			{
				$mean[$y] += 0;#παρσαρει στον πινακα των μεσων ορων την τιμη 0 
				$fixed_counts[$x][$y]=0;# και στον πινακα των αλλαγων την πραγματικη αλλαγη
				$g++;
				next;
			}
			#print "$original_changes[$y] $count[$y]\n";
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
	push (@totsqdiff, $se/999); #SE = Σ(x-μ)^2/n-1 
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
	if ($j == 20)
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
	if ($j == 20)
	{
		print "\n";
		$j=0;
	}
}

#Η ιδια διαδικασια με την ιδια σειρα πραγματοποιεται και στα υπολοιπα προγραμματα που υπολογιζουν
# θεωρητικο μεσο ορο και τυπικη αποκλιση στα υπολοιπα θεωρητικα συνολα