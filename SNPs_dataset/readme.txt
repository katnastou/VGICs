1.καθε ενας φακελος περιλαμβανει scripts σε γλωσσα perl, αρχεια input και output
με σκοπο να γινει η συλλογη των missense snps για vgics του ανθρωπου απο τις βασεις
UniProtKB και ClinVar.

2.Το τελικο συνολο δεδομενων προκυπτει απο τη συγχωνευση των δεδομενων που συλλεχθηκαν
απο τις παραπανω βασεις.  Για τη σωστη αναλυση του συνολου δεδομενων υιοθετηθηκε κοινος
κωδικας αναφορας για τον κλινικο χαρακτηρισμο, δεδομενου οτι οι δυο βασεις χρησιμοποιουσαν διαφορετικη
ορολογια.  Επομενως, πολυμορφισμοι με χαρακτηρισμο Disease,Pathogenic ή Likely pathogenic => Pathogenic
Oσοι αναφερονταν ως Polymorphism,Benign,Likely benign ή risk factor => Polymorphism και τελος
οσοι χαρακτηριζονταν ως Unclassified, not provided, not reported ή Uncertain significance => Unclassified.
Προκειμενου να μην υπαρχει πλεονασμος στο συνολο εγινε φιλτραρισμα,καθε εγγραφη να ειναι μοναδικη, 
δεδομενου οτι υπηρχαν περιπτωσεις οπου τα δυο συνολα αλληλοεπικαλυπτονταν.

3.vgicsWITHsnps.pl -> προγραμμα σε γλωσσα perl που υπολογιζει ποια καναλια εχουν αναφορα
για Pathogenic snps,Polymorphisms και Unclassified snps.
Αρχεια εισοδου:
α) uniqueDatasetOFnps.txt -> το συνολο των παρερμηνευσιμων SNPs για τα VGICs του ανθρωπου
β) vgicsGENES.txt -> αρχειο με ολους τους κωδικους για τα γονιδια των VGICs που υπαρχουν 
στον ανρθωπο
Αρχειο εξοδου: VGICSwithSNPS.txt (perl vgicsWITHsnps.pl > VGICSwithSNPS.txt) -> μεταφορα σε excel (στον sygentrwtiko pinaka 
στο φυλλο vgicsWITHsnps)

ClinVar
Benign => Polymorphism
Likely benign => Polymorphism
Likely pathogenic => Pathogenic
Pathogenic => Pathogenic
Uncertain significance => Unclassified
not provided => Unclassified
not reported for simple variant => Unclassified
risk factor => Polymorphism
Conflicting interpretations of pathogenicity => Unclassified
no interpretations for the single variant => Unclassified

UniProtKB
Disease => Pathogenic
Polymorphism => Polymorphism
Unclassified => Unclassified