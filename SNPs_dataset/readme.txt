1.���� ���� ������� ������������ scripts �� ������ perl, ������ input ��� output
�� ����� �� ����� � ������� ��� missense snps ��� vgics ��� �������� ��� ��� ������
UniProtKB ��� ClinVar.

2.�� ������ ������ ��������� ��������� ��� �� ���������� ��� ��������� ��� �����������
��� ��� �������� ������.  ��� �� ����� ������� ��� ������� ��������� ����������� ������
������� �������� ��� ��� ������� ������������, ��������� ��� �� ��� ������ ��������������� �����������
��������.  ��������, ������������� �� ������������ Disease,Pathogenic � Likely pathogenic => Pathogenic
O��� ����������� �� Polymorphism,Benign,Likely benign � risk factor => Polymorphism ��� �����
���� ��������������� �� Unclassified, not provided, not reported � Uncertain significance => Unclassified.
����������� �� ��� ������� ���������� ��� ������ ����� �����������,���� ������� �� ����� ��������, 
��������� ��� ������� ����������� ���� �� ��� ������ ��������������������.

3.vgicsWITHsnps.pl -> ��������� �� ������ perl ��� ���������� ���� ������� ����� �������
��� Pathogenic snps,Polymorphisms ��� Unclassified snps.
������ �������:
�) uniqueDatasetOFnps.txt -> �� ������ ��� ��������������� SNPs ��� �� VGICs ��� ��������
�) vgicsGENES.txt -> ������ �� ����� ���� �������� ��� �� ������� ��� VGICs ��� �������� 
���� �������
������ ������: VGICSwithSNPS.txt (perl vgicsWITHsnps.pl > VGICSwithSNPS.txt) -> �������� �� excel (���� sygentrwtiko pinaka 
��� ����� vgicsWITHsnps)

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