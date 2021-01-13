# Matlab Project 2
### TASK 1 - Iterative Algorithm:
In functia "Iterative" am citit numarul de noduri din fisierul de input si
am creat apoi 2 matrici A si K, matricea de adiacenta respectiv matricea diagonala
ce retine numarul de noduri externe pentru fiecare nod. Am parcurs nodurile si am
citit informatia cu ajutorul careia am construit cele 2 matrici, avand grija sa
nu adun si link-urile spre aceeasi pagina. Dupa ce am terminat de citit din fisier
construiesc matricea M dupa formula data (inv(K)*A)' si apoi vectorii R_old si R
folosind formulele de pe Wikipedia. Calculez primul pas pentru a putea apoi sa 
folosesc un while pentru diferenta ultimilor 2 pasi pana la o eroare acceptabila. 
Returnez vectorul R_old deoarece R este cu un pas inainte.

### TASK 2 - Algebraic Algorithm:
Pentru functia "Algebraic" folosesc aceeasi implementare ca la functia "Iterative" 
pana calculez M. Pentru a utiliza formula de calcul a lui R de pe Wikipedia trebuie
sa calculez inversul matricei "I-d*M". Pentru asta folosesc functia "PR_Inv"
ce utilizeaza algoritmul Gram-Schmidt pentru a calcula Q si R ale
unei matrice A date ca parametru, inversa matricei A fiind oferita de formula
"inv(R)*Q'". Cu inversul obtinut ma intorc in functia "Algebraic", calculez R
dupa formula si il returnez.

### TASK 3 - Gradul de Apartenenta:
In functia "PageRank" am parcurs fisierul de input pana am ajuns la ultimele
2 valori, val1 si val2, de care am nevoie. Nu am stocat restul informatiei deoarece
este nevoie de ea doar pentru functiile "Iterative" si "Algebraic", care la randul
lor citesc din nou fisierul, fiind nevoie doar de numele acestuia. Am creat un fisier
de output in care voi scrie rezultatele obtinute conform specificatiilor din cerinta.
Scriu numarul de noduri, calculez "Iterative" si retin rezultatul in R1, pe care il
scriu apoi in "output", calculez "Algebraic" si retin rezultatul in R2 pe care il scriu
apoi in "output". Sortez descrescator vectorul R2 folosind functia integrata "sort". Pe
langa vectorul sortat descrescator, aceasta functie returneaza si un vector "pos" ce retine
indexul elementelor inainte de sortare. Parcurg nodurile si scriu in fisierul de output
conform indicatiilor din cerinta. Functia "Apartenenta" are rolul de a calcula valoarea
unei functii date, in cazul nostru "u", intr-un anumit punct astfel: functia trebuie
sa fie continua deci gasesc cele 2 ecuatii "a * val1 + b = 0" si "a * val2 + b = 1"
din rezolvarea carora obtin expresiile pentru a si b; calculez apoi valoarea functiei
in raport cu intervalul in care se afla "x". Rezultatul returnat reprezinta valoarea
functiei in punctul "PR(i)" dat. Scriu toate rezultatele obtinute in "output"
si inchid fisierul.

