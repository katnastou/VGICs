SCRIPTS
1.position_of_snps_kvs.pl -> διαβαζει το αρχειο kv_snps που περιεχει πληροφορια για ολα snps
στα Kv καναλια του ανθρωπου και σαν output τυπωνει αρχειο tab-delimited με την εξης πληροφορια:
α)UniProt AC
b)ονομα γονιδιου
c)Θεση του snp
d)αρχη και τελος τοπολογικης περιοχης
e)ονομα τοπολογικης περιοχης
f)φυσιολογικο αα και snp
g)κλινικος χαρακτηρισμος του snp (Pathogenic kai Non pathogenic)

2.snp_per_topodom_kvs.pl -> script που μετραει τα snps που υπαρχουν σε καθε τοπολογικη περιοχης
και τα διακρινει σε παθολογικα (pathogenic) και μη παθολογικα (non pathogenic) (append output και περνα το αποτελεσμα σε excel για manipulation: perl snp_per_topodom_kvs.pl > output1.txt)

3.biophysattr.pl -> στην ουσια μετατρεπει χαρακτηριζει καθε αμινοξυ στο dataset βασει φυσικοχημικης ιδιοτητας
(οποτε σαν τελικο output, λαμβανεις ενα συνολο δεδομενων για τα snps των kvs μονο που αντι να εχεις με συγκεκριμενα την καθε αα-αλλαγη
την εχεις ως non-polar -> polar πχ).

4.counts_aachanges_biophysattr.pl <- φτιαχνει ενα matrix στο οποιο διακρινονται παθολογικα και μη snps και τα aa 
παρουσιαζονται χαρακτηρισμενα βασει φυσικοχημικης ιδιοτητας (δλδ non polar, polar kai charged) (append output και περνα το αποτελεσμα σε excel για manipulation: perl counts_aachanges_biophysattr.pl > output2.txt)
---------------------------------------------------------------------------------------------
TXT FILES
1.kv_snp_position_final.txt -> τελικο αρχειο με τα snps των Kvs και την τοπολογια τους
(προκυπτει απο το script 1.)

2.kv_snps.txt -> αρχειο TXT με ολα τα snps που υπαρχουν για τα kvs στο dataset

3.kv_genes.txt -> περιεχει πληρογοια για ονομα γονιδιου και uniprot ac καθε Kv καναλιου

4.kvs_aachanges_+_pathogenicity -> το συνολο δεδομενων για τα snps των Kvs μονο που τα aa φαινονται 
χαρακτηρισμενα βασει φυσικοχημικης ιδιοτητας (προκύπτει ως output απο το script biophysattr.pl)

3.human_kvs_uniprot.txt -> multitest αρχειο uniprot με πληροφοριες για καθε μια απο τις 40 εγγραφες που αφορουν σε καναλια καλιου του ανθρωπου
