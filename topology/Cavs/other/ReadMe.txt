SCRIPTS
1.position_of_snps_cavs.pl -> διαβαζει το αρχειο cav_final dataset που περιεχει πληροφορια για ολα snps
στα Cav καναλια του ανθρωπου και σαν output τυπωνει αρχειο tab-delimited με την εξης πληροφορια:
α)UniProt AC
b)ονομα γονιδιου και πρωτεΐνης
c)Θεση του snp
d)αρχη και τελος τοπολογικης περιοχης
e)ονομα τοπολογικης περιοχης
f)φυσιολογικο αα και snp
g)κλινικος χαρακτηρισμος του snp (Pathogenic kai Non pathogenic)

2.count_snps_per_topodom.pl -> script που μετραει τα snps που υπαρχουν σε καθε τοπολογικη περιοχης
και τα διακρινει σε παθολογικα (pathogenic) και μη παθολογικα (non pathogenic) (append output και περνα το αποτελεσμα σε excel για manipulation: perl count_snps_per_topodom.pl > output1.txt) 

3.biophysattr.pl -> στην ουσια μετατρεπει χαρακτηριζει καθε αμινοξυ στο dataset βασει φυσικοχημικης ιδιοτητας
(οποτε σαν τελικο output, λαμβανεις ενα συνολο δεδομενων για τα snps των cavs μονο που αντι να εχεις με συγκεκριμενα την καθε αα-αλλαγη
την εχεις ως non-polar -> polar πχ).

4.counts_aachanges_biophysattr.pl <- φτιαχνει ενα matrix στο οποιο διακρινονται παθολογικα και μη snps και τα aa 
παρουσιαζονται χαρακτηρισμενα βασει φυσικοχημικης ιδιοτητας (δλδ non polar, polar kai charged) --->append output kai metafora se excel: counts_aachanges_biophysattr.pl> output2.txt
---------------------------------------------------------------------------------------------
TXT FILES
1.cavs_snp_position.txt -> τελικο αρχειο με τα snps των Cavs και την τοπολογια τους
(προκυπτει απο το script 1.)

2.cav_final_dataset.txt -> αρχειο TXT με ολα τα snps που υπαρχουν για τα cavs στο dataset

3.human_cavs_uniprot.txt -> multitest αρχειο uniprot με πληροφοριες για καθε μια απο τις 10 εγγραφες που αφορουν σε καναλια ασβεστιου του ανθρωπου

4.cavs_aachanges_+_pathogenicity -> το συνολο δεδομενων για τα snps των Kvs μονο που τα aa φαινονται 
χαρακτηρισμενα βασει φυσικοχημικης ιδιοτητας (προκύπτει ως output απο το script biophysattr.pl) και χρησιμοποιεται
ως input file για counts_aachanges_biophysattr.pl