use utf8;
use Encode::Locale;
binmode STDOUT,":encoding(console_out)";
open(FIC1,"<dico1.txt") or die "impossible d'ouvrir le fichier en lecture :$!\n";
open(FIC2,"<dico2.txt") or die "impossible d'ouvrir le fichier en lecture :$!\n";
open(RES,">resultat.txt"); 
$chaine=join(",",<FIC2>); #je met les entrées de dico2.txt dans une chaine de caractère (les entrées sont séparée par ",")
while($ligne1=<FIC1>) #je parcours le fichier dico1.txt ligne par ligne
{    
    if (index($chaine,$ligne1)!=-1) #je teste si une entrée de dico1.txt est une entrée qui existe dans dico2.txt (avec la fonction "index")
    {
    push(@tab1,$ligne1); #si oui alors je la met dans tab1 qui contient les entrées dupliquées (chaque nouvelle entrée est ajoutée à la fin de tab1)
    }
    else
    {
    push(@tab2,$ligne1); #sinon je la met dans tab2 qui contient les entrées qui sont dans dico1.txt et qui ne sont pas dans dico2.txt (chaque nouvelle entrée est ajoutée à la fin de tab2)
    }
}
print RES " les entrées dupliquées entre dico1.txt et dico2.txt:\n",@tab1,"\n"; #je met dans le fichier resultat.txt le tableau @tab1 qui contient les entrées dpliquées 
print RES "\n les entrées qui sont dans dico1.txt et qui ne sont pas dans dico2.txt:\n",@tab2,"\n"; #après j'ajoute à la fin de fichier resultat.txt le tableau @tab2 qui contient les entrées qui sont dans dico1.txt et qui ne sont pas dans dico2.txt
close(FIC1);
close(FIC2);
close(REC);
