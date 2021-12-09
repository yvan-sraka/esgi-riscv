# RISC V

**## LVL 0.**

**## LVL 1.**

Write a `riscv1.asm` file that:

- Put the value `42` in the register `t0` (hint: use the `lui` instruction)
- Put the value `0xdeadbeef` in the resgister `t1`

⚠️ check at every step if your code still build!

**## LVL 2.**

Question: What kind of instruction set RARS ?

RISC (Reduced Instruction Set Computer) vs CISC (Complex Instruction Set Computer)

~> GUESS WHAT THIS PROGRAM DOING <~

**## LVL 3.**

- Write the value `t1 + t2` inside the `t3`register
- Write the value `t2 - t3` inside the `t4`register

**## LVL 4.**

Open `Tools` -> `Floating Point Representation`

- What decimal value encode `0xC229AE14` in 32-bit IEEE 754 norm
- What is the hexadecimal encoding of the biggest value you can represent?

~> Answer this in the QCM <~

DECALAGE

PLUS OU MOINS ?

APPEL SYSTEM

add

syscall

conditions

memoire

array

array_loop

Somme

- --

JUMP

ALLER JUSQU'AU BOUCLE ?

ROT13

SOMME DES CARRé

Exercice pas à pas

Dessiner un smiley dans la mémoire (pré

Exercism

- --

Analyse

Godbolt

https://godbolt.org

- --

**## Overture : Performances & Perspectives**

Open `Tools` -> `BHT Simulator`

[Stack Overflow: Why is processing a sorted array faster than processing an unsorted array?](https://stackoverflow.com/questions/11227809/why-is-processing-a-sorted-array-faster-than-processing-an-unsorted-array)

**## Readings**

Paterson 3 premiers chapitres

- [The RISC-V Instruction Set Manual](https://content.riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf)
- [CS 3410 RISC-V Interpreter](https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/index.html)
- [One-page RISC-V reference sheet (Green Card)](https://www.elsevier.com/__data/assets/pdf_file/0011/297533/RISC-V-Reference-Data.pdf#RISC-V%20Reference%20Data)

Activités :

- Algo

[MIPS Assembly | Exercism](https://exercism.io/my/tracks/mips)

Faire deviner ce que fait du code

pas de delay slot dans le standard d’ASM

SSA

ALGO ?

Contribution OSS

http://ospp.cs.washington.edu/index.html

https://dl.acm.org/doi/book/10.5555/1999263

https://en.wikipedia.org/wiki/Application_binary_interface

https://en.wikipedia.org/wiki/RISC-V

https://en.wikipedia.org/wiki/Stored-program_computer

https://en.wikipedia.org/wiki/Virtual_memory

https://en.wikipedia.org/wiki/X86-64

https://exercism.io/cli-walkthrough

https://exercism.io/my/tracks/mips

https://exercism.io/tracks/mips/installation

https://exercism.io/tracks/mips/learning

https://exercism.io/tracks/mips/resources

https://exercism.io/tracks/mips/tests

https://fr.wikipedia.org/wiki/Programme_assembleur

https://github.com/darnuria/esgi-riscv

https://github.com/jameslzhu/riscv-card/blob/master/riscv-card.pdf

https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md

https://github.com/riscv/riscv-gnu-toolchain

https://github.com/riscv/riscv-isa-manual

https://github.com/spectrometerHBH/RISCV-Interpreter

https://inst.eecs.berkeley.edu/~cs61c/fa17/lec/05/L05%20RISCV%20Intro%20(1up).pdf

https://inst.eecs.berkeley.edu/~cs61c/resources/su18_lec/Lecture7.pdf

https://medium.com/swlh/how-does-a-microprocessor-work-e06d196efd8f

https://medium.com/swlh/risc-v-assembly-for-beginners-387c6cd02c49

https://riscv.org/technical/specifications/

https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf

https://riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf

https://stackoverflow.com/questions/49014931/risc-v-assembly-simulator

https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/

https://www.youtube.com/channel/UC1DcxXg6GkAcp2zk2w7U6qQ/videos

https://www.youtube.com/playlist?list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo

https://www.youtube.com/watch?v=O5nskjZ_GoI&list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo

# Introduction à l’assembleur RiscV

Liens vers le dépot git: [https://github.com/darnuria/esgi-riscv](https://github.com/darnuria/esgi-riscv)

Cours de 15h initialement donné pour les 4èmes années mobilité et objets connecté de l’ESGI en 2019 et 2020.

Dans ce cours, nous allons découvrir les bases de l’assembleur RiscV, il s’agit d’un jeu réduit il y a peu d’instructions comparé à Intel nous verrons que cela n’est pas un problème en soit.

Par exemple comment le processeur, charge des données de la mémoire, les traite à l’aide d’instructions et les écrit dans la mémoire.

> Note : Nous verrons plus tard que nos ordinateurs modernes Exploitent le concept du programme «stocké» en mémoire. Le programme peut donc être vu comme une donnée en mémoire.

Nous verrons en ouverture la mémoire virtuelle, les entrées/sorties avec les périphériques très succinctement et le pipelining.

## Préambule

Afin de se préparer et de commencer avec un support sympa je vous recommande très fortement le [Crash Course Computer Science](https://www.youtube.com/playlist?list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo) de [Carrie Anne Philbin](https://en.wikipedia.org/wiki/Carrie_Anne_Philbin) disponnible sur Youtube, les chapitres [1 The Mechanics of How Computers Work](https://www.youtube.com/watch?v=O5nskjZ_GoI&list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo&t=0s) et [3 Computer Hardware](https://www.youtube.com/watch?v=6-tKOHICqrI&list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo&t=0s) donnent une bonne introduction des concepts du cours.

Je vous encourage à regarder le reste par curiosité.

### Exercices - Notes

Dans ce cours il est indispensable de faire les exercices, je demanderais donc que vous forkiez ce dépot et réalisiez quotidiennement les exercices.

Il y aura aussi un qcm et des devoirs maisons raisonnables. Concernant projet ou examen avec le confinnement je dois contacter la direction pédagogique pour décider.

## Contexte

## Assembleur c’est quoi

Nos ordinateurs ne mangent pas de JavaScript, ni de C, ni du Rust directement, ils executent de l’assembleur et soit vous compilez vers l’assembleur comme en Rust, C, C++ soit vous utilisez un compilateur Juste à Temps (JIT), soit vous interpretez un jeu d’instruction haut niveau. Mais au final votre processeur lui ne vois que du code machine.

L’assembleur, sous la forme de *code machine* est ce que nos processeurs executent, des séries de 0 et de 1 organisé sous la forme d’un mot machine d’un nombre de bit définit. Dans notre cas pour le RiscV les mots seront de 32 bits, certains jeux d’Instructions tel [Intel x86_64](https://en.wikipedia.org/wiki/X86-64) ont des jeux à taille de mot variable et beaucoup plus d’instructions.

Nous manipuleront une forme textuelle de l’assembleur qui sera traduit en code machine par un programme dit [assembleur](https://fr.wikipedia.org/wiki/Programme_assembleur).

Ces mots permettent de manipuler la mémoire, les registres qui sont l’unité de mémoire du processeur, dans ces mots les bits sont organisé pour avoir un sens, plusieurs formats existent pour pouvoir encoder différentes choses, comme de la manipulation de mémoire, une addition ou une comparaison ou un saut.

### Mise en pratique

Dans ce le cadre de ce cours nous allons utilisers le logiciel [Rars](https://github.com/TheThirdOne/rars) *RISC-V Assembler and Runtime Simulator*, afin de visualiser ce qui se passe. Malheureusement nous n’aurons pas de hardware RiscV ce sera plus l’année prochaine, mais il existe des cartes de developpement avec un processeur RiscV.

Rars est un simulateur permetant d’executer du RiscV comme si il y avait un OS sout-jacent, l’interet de Rars est de pouvoir visualiser toutes les interactions avec la mémoire de façon visuelle. Nous utiliseront [la version 1.4](https://github.com/TheThirdOne/rars/releases/tag/v1.4) il vous faudra OpenJDK version égale ou supérieur à 8 ou Java de Oracle.

### Prise en main de Rars

Voici un exemple concret et notre premier programme, ce premier programme additionne deux nombre et sauvegarde le résultat dans un registre.

Ici on veux additionner 32 avec 10 et à la fin le résultat sera dans le registre `t0` voici deux façons naives de faire en C, Rust et RiscV.

En Rust on aurait fait:

```
let mut a = 32;a += 10;
```

En C:

```
int a = 32;a += 10;
```

Et en RiscV

```
mon-code:#        / 32 est un immédiat c'est à dire on encode 32 dans l'instruction.li   t0, 32#     \ t0 est un registreaddi t0, t0, 10  # Puis additionne l'immédiat 10 à ce registre.
```

Dans le programme ci-dessus on voit des éléments typiques d’un assembleur:

- Des **instructions** : `li` et `add`
- Des **immédiats** : `32` et `10` ce sont des entiers directement encodés dans l’instruction finale
- Un **registre** : `t0`, manipule en lecture et écriture.
- Un **labels** : `mon_code` qui permettent de nommer une adresse dans le programme ici il pointe sur notre `li`.

Dans Rars ça devrait donner ça:

![00_rarsUI.png](00_rarsUI.png)

.

Instructions présentées au dessus.

`li`: Pseudo instruction qui charge dans son registre de destination un immédiat sur 12 bit si signé ou 32 bits si non signé `addi`: Additionne son registre de source à un immédiat sur 12 bits et assigne le résultat dans son registre de destination.

Une fois que vous aurrez assemblé votre programme vous devriez voir ça:

![01_rarsUI_Assembly.png](01_rarsUI_Assembly.png)

.

*Question*: À la fin du programme quelle valeur contiens le registre `t0` ?

## Architecture RiscV

Dans ce cours nous allons utiliser le jeu d’instruction Risc-V, il s’agit d’une architecture d’ordinateur à jeu d’instruction *ISA Instruction Set Architecture* dite *[Reduced Instruction Set Computer (RISC)](https://fr.wikipedia.org/wiki/RISC-V)* , c’est-à-dire à un processeur avec un jeu d’instruction réduit et régulier avec peu de formats.

A titre d’exemple l’architecture externe des processeurs est de type *[Complex Instruction Set Computer (CISC)](https://en.wikipedia.org/wiki/Complex_instruction_set_computer)*.

> Note: Pour votre curiosité dans la réalisation interne d’un processeur x86_64 les concepteurs s’arrangent pour obtenir un jeu interne RISC car c’est plus facile à optimiser et maintenir.

### Registres

En assembleur RiscV, on manipule explicitement des petites unités de mémoire disposées dans le processeur nommé des **registres**, il y en a 32 accessibles dans le jeu d’instruction de base.

> Note: Les registres ont pour double but de contourner la «hiérarchie des temps d’accès à la mémoire» et aussi de facilité la réalisation hardware du processeur.

[Untitled](https://www.notion.so/c4e57d82d85348f4952e522bc96757a3)

Le tableau ci-dessus est inspiré par la [page wikipédia riscV](https://en.wikipedia.org/wiki/RISC-V) et le chapitre 18 sur les [conventions d’appel](https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf) de la spécification du jeu d’instruction.

Certains registres ont un usage particulier tel que: `ra`, `sp`, `gp` `tp` on ne les utilisera pas dans la majorité des cas directement. Le registre `zero` à toujours la valeur 0.

On vera que certains doivent être sauvegardé si besoin lors des appels de fonctions par la fonction qui appelle une autre, et la fonction qui est appelée.

> Aller Plus loin: D’autres jeux de registres sont accessibles dans des extensions du jeu d’instructions RiscV notamment pour les calculs en virgule flottante ou bien le jeu privilégié utile quand on réalise un OS ou programme pour des microcontrôleurs.

### Instructions

Comme nous l’avons vu en RiscV on utilise des instructions pour manipuler les registres et la mémoire, les instructions sont représentées sous la forme de valeurs binaires sur par exemple 32 bit.

Par exemple le programme suivant:

```
li   t0, 32     # Ce programme charge 32 dans le registre t0addi t0, t0, 10 # Puis additionne 10 à ce registre.
```

Ce petit programme assembleur une fois en code machine équivaut aux mots de 32bits,`0x02000293` et `0x00a28293` si on décompose ça donne ça :

[Untitled](https://www.notion.so/f694cbc2cd7e46ab832ac36678dbc823)

> Note: C’est le concept du programme stocké ou “stored program concept”, cette suite de valeur binaire qui forme un programme est stocké dans la mémoire.

> Aller plus loin : C’est une simplification pour aller plus loin je vous recommande de lire sur la mémoire virtuelle, je vous recommande le livre “Operating System : Principles and Practice” Thomas Anderson and Michael Dahlin.

Il existe des instructions pour faire différentes opérations nous allons en voir une partie ensemble

Certaines des instructions que nous avons manipulées tel que `mv` qui copie un registre dans un autre et `li` qui charge un immédiat, ou `la` qui charge une adresse sont des pseudo-instructions, c’est-à-dire qu’elles ne sont pas réalisées par le hardware, elles ont vocations à être décomposé en instructions plus élémentaires.

Par exemple `mv t1, t0` est décomposé en un `add t1, zero, t0`.

On verra dans la partie [Formatage binaire des instructions](about:blank#formatage-binaire-des-instructions) pourquoi `mv` et `li` ne sont pas réalisés par notre jeu d’instruction.

### Mémoire

Comme vu l’avez peut-être vu en C on représente la mémoire comme un espace, allant de l’adresse `0x0000_0000` jusque à l’adresse `0xFFFF_FFFF` pour un programme 32 bits. La mémoire est organisée en lignes de 8 valeurs, contenant des mots de 32 bits, elle est addressable de 4 en 4, de 2 en 2 ou byte à byte.

On utilisera courament l’adressage de 4 en 4 dit mot à mot, à part pour les chaines de caractère ou il est fait byte à byte. voir instruction `lw`, `lh`, `lb` et `sw`, `sh`, `sb`.

Voici d’ailleurs une vue d’ensemble mémoire et code d’un programme assembleur:

![03_asm_memory.jpg](03_asm_memory.jpg)

.

### Segments

Dans nos programmes on décompose cet espace en segments par exemple pour le code est le segment: `.text` pour les données du programme connues avant l’exécution c’est le segment `.data`.

> Aller plus loin : Il existe d’autres segments tel que .bss beaucoup sont liée au système d’instruction plus que au jeu d’instruction.

Par exemple la pile est un segment particulier, qu’on utilise pour stocker des variables locales et conserver la valeur des registres entre les appels de fonctions ou appel au système d’exploitation.

Précisions sur les segments de code pour cette architecture virtuelle:

- Code `.text` `0x0040_0000` code de notre programme en langage machine
- Stack/pile commence à `0x7fffeffc` allocation dans la pile
- extern `0x1000_0000` variables globales utile avec `.include` (on utilisera pas)
- data `0x1001_0000` variables locales à un fichier
- heap/tas `0x1004_0000` allocations dynamiques
- Memory Mapped IO `0xffff_0000` interaction IO directement par la mémoire sans support OS

Note sur l’usage de l’inspecteur mémoire de Rars:

Les cases dans l’inspecteur du segment data: 0 à +1C ça correspond au cases `0x1001_0000`; `0x1001_001C` de la mémoire du segment `.data` les adresses s’incrémentent de 4 en 4 donc `0x1001_0000`, `0x1001_0004`, `0x1001_0008`, `0x1001_000C`, `0x1001_00010`, `0x1001_0014`, `0x1001_0018`, `0x1001_001C` et `0x1001_0020` etc.

### Adresses en l’assembleur

Dans nos programmes assembleurs on manipulera des adresses souvent. Les labels nous servirons à marquer une adresse particulière pour sauter dessus ou pour charger une valeur dans le segment `.data`.

Ou alors on utilisera le registre, `sp` qui marque le sommet de la pile pour sauvegarder la valeur de nos registres. Le registre `gp` ou `ra` sont utilisés calculer des jumps relatifs dans le programme. Il existe aussi le programme counter qui contiens l’addresse de l’instruction courante.

[Untitled](https://www.notion.so/2def583c0d724091a2389b8efb28334b)

### Instruction arithmétique et logique

Comming soon.

### Instructions Mémoire

Pour faire un programme sur une machine de Turing tel que notre processeur, il nous faut une mémoire, nos registres sont une forme de mémoire mais c’est assez limitant 32 mots de 32bits.

Notre processeur a donc besoin d’instructions pour manipuler la mémoire de notre ordinateur. C’est le but des instructions de stockage (store) et de chargement (load) mémoire.

> Note : En riscV la mémoire est toujours alignée sur un multiple de 4 et on ne peut pas accéder sur autre chose que un multiple de 4.

Exemple un tableau `[124, 256, 512]` contenant les mots de 32bits dans le segment de données `.data`, Voir instruction `lw` plus bas.

[Untitled](https://www.notion.so/b1a4b061cab64f78a0aa98fcf1ae6377)

En revanche maintenant si je travaille avec des données sur 8 bits comme des caractères j’addresserais de 1 en 1! Voir instruction `lb` plus bas

Voici la chaine “Chat” et son zéro de fin.

[Untitled](https://www.notion.so/96b5b9275b6145e3a1c70a7f42bc5f25)

Si je travaille avec des mots sur 16 bits, la en revanche j’addresse de 2 en 2 mais c’est rare, Note: voir `lh`.

### Charger une adresse dans un registre

> la registre_destination, label

Pseudo-instruction permettant de charger l’adresse d’un label dans un registre.

Elle se décompose en l’instruction `aiupc` et souvent un `add`, l’idée est de construire une adresse relative au pointeur de code `pc`, c’est pour des questions de praticité dans la réalisation du hardware et des compilateurs.

Exemple:

```
la t0, my_address # t0 contiendra l'adresse pointé par my_address
```

### Load instructions

> lw registre_destination, offset(registre_source)

Cette instruction charge dans un registre de destination le contenu dans la mémoire à l’adresse contenue dans le registre source un offset peut être additionné à l’addresse dans le registre source.

Équivalent en C:

```
int a[2] = { 42, 1 }; // On réserve un array de 2 mot de 32bits.int b = a[0];         // On récupère 42int c = c[1];         // On récupère 1
```

```
.datamyInt: .word 42, # On réserve un mot de 32 bits pour stocker un entier..textla t0, myInt # On charge dans t0 l'adresse de myInt.lw t1, 0(t0) # On charge la valeur pointée par t0 dans t1 donc 42.lw t2, 4(t0) # On récupère ici 1.
```

Pour incrémenter un sur un tableau de mots de 32bits on avance de 4 en 4.

> lh registre_destination, offset(registre_source)

Comme `lw` mais on charge et adresse des demis mots de 32 bits donc 16 bits.

Pour incrémenter sur un tableau de mot de 16bits on avance de 2 en 2.

> lb registre_destination, offset(registre_source)

Comme `lw` mais on charge et adresse des quarts de mots de 32 bits donc 8bits, c’est très utilisé pour manipuler des chaines de caractères ASCII.

Pour être concret voici un C :

```
char s = "chat"; // On déclare une chaine de caractère.char c = s[0];   // on récupère le c.char b = s[2]    // on récupère le a.
```

Il peut lieu à un schéma de compilation comme celui-là:

```
.datas: .string "chat".textla t0, s     # t0 contient l'adresse de base de notre chaine!lb t1, 0(t0) # t1 contient 'c'lb t2, 2(t0) # t2 contient 'a'
```

Note: Pour l’incrémentation sur un tableau de mots de 8bits (char) on avance de 1 en 1.

### Store instructions

> sw lb registre_destination, offset(registre_source)

Permet de d’écrire dans la mémoire un mot de 32 bit contenu dans votre registre de destination à l’adresse contenue dans le registre source plus un offset.

La mémoire est adressable de de 4 en 4.

Exemple de code pour stocker un mot

```
.datamyInt .word 0.textla t1, myInt # t1    <- myIntli t0, 42    # t0    <- 42sw t0, 0(t1) # M[t1] <- t0
```

> sh lb registre_destination, offset(registre_source)

Écrire un 16 bits un demi-mot dans la mémoire c’est utile pour gérer du hardware. La mémoire est addressable de 2 en 2.

> sb lb registre_destination, offset(registre_source)

Cette instruction permet d’écrire un byte 8bits dans la mémoire c’est utile pour gérer des caractères ou du hardware.

la mémoire est adressable de 1 en 1.

### Instruction de Branchements

Pour pouvoir écrire des programmes en fonctions de résultats de vos calculs, il faut pouvoir «choisir» quel code executer selon un résultat, il s’agit des instructions de branchement. Dans nos langages hauts niveaux ont fait ça avec des boucles, `for`, `loop`, `if`, `else`, des appels de fonctions voir des exceptions.

Cas particulier: le `match` de Rust ou swift ou le `switch-case` en C, Javascript etc. Est un peu différent en terme de comment on le compile par rapport à un `if`.

Pour réaliser cela nous avons à notre disposition des instructions de branchement conditionnelles et non conditionnelles, l’idée générale est de sauter en fonction d’un test sur plusieurs registres à une adresse via son label ou à un registre.

### Branchements non conditionnels (Jumps)

Pour faire des sauts inconditionnel il existe la pseudo instruction:

> j label

```
li t0, 42j my_exit # On saute à my_exit directement# Ici cette instruction ne sera jamais executé :(add t0, t0, 1my_exit:# t0 vaut donc 42 ici.
```

`jal` jump and link, instruction qui sauvegarde l’addresse ou on était et saute au label, très utile pour lorsque nous feront des fonctions.

> jal reg_save_addr, label

Not: En réalité `j` est réalisé par un `jal x0 label` on sauvegarde pas l’addresse courante avant le saut et on saute! ;)

### Branchements conditionnels

[Untitled](https://www.notion.so/69a1825db07d4d4ea4d6e9f7f748f01a)

Ici le format est très régulier entre toutes ces instructions vous aurrez toujours:

> branch_instruction op1 op2 label

Ça permet de réaliser les branchements utiles pour faire des programmes.

### Boucles

Pour faire une boucle il est necessaire de définir un label pour le début et parfois un label pour la fin de la boucle.

Trois étapes sont cruciales:

- (parfois optionnelle) initialiser un itérateur ou compteur
- Tester si la condition de validité de la boucle parfois il faudra inverser la condition que vous ecriveriez en pseudo code
- Incrémenter

Par exemple: un compteur qui compte jusque a 128:

```
li a0, 0 # i = 0li t0, 128 # end = 128while:  beq a0, t0, end_while  addi a0, a0, 1  j whileend_while:
```

Une autre façon de faire aurait été d’inverser la condition d’arret:

```
li a0, 0 # i = 0
li t0, 128 # end = 128

while:
  addi a0, a0, 1
  bne a0, t0, while
end_while:
```

**Note:** Dans vos programmes en général c’est le compilateur qui optimise ce genre de choses. Mais peut-être un jour ça vous servira de savoir identifier pourquoi un programme est lent et de comprendre l’assembleur emi.

Il existe de très nombreuses façons d’optimiser dans les compilateurs les boucles, c’est important car nos programme passent la plupart de leur execution dans des boucles.

### Affectation conditionnelles

Comming Soon

### Appel systèmes

Un appel système ou syscall est une sorte de fonction spéciale que propose le système d’exploitation, cet appel s’exécutera en suspendant l’exécution du programme courant.

Pour les appeler on utilise l’instruction :

> ecall

`ecall` est l’instruction qui permet de déclencher une *exception*, qui force le processeur à interrompre ce qu’il fessait pour sauter dans le code de gestion des exceptions du noyau de notre système d’exploitation.

Pour passer des arguments aux appels systèmes *syscalls*, on les passe par les registres `a0`, `a1`, `a2` à `a3`, on charge dans le registre `a7` le numéro qui renseigne l’appel système désiré et ensuite on utilise `ecall`.

Exemple:

```
li  a7, 1 # le syscall 1 permet d'afficher un entierli a0, 42ecall     # On peut lire 42 dans la console de Rars.
```

> Note : Dans nos programmes C, JavaScript, etc. bien souvent on passera par l’abstraction de la libC pour faire appel aux services du noyau au lieu de directement faire des ecall.

> Note : Cette convention d’appel avec le noyau dépends de l’OS !

> Aller plus loin: Pourquoi avoir une instruction pour «appeller» le système d’exploitation? Car il s’execute avec des droits étendus sur l’ordinateur et a access à des instructions privilégiées: https://content.riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf

### Formatage binaire des instructions

En RiscV les instructions sont divisées en 6 formats:

- Format R : Instructions de manipulation registre à registre ex: `add, sub, sll, slt, sltu, xor`
- Format I : Instructions avec un immédiat 11 bit ex: `lw, lh, lb, jalr`
- Format S : Instructions d’écriture mémoire ex: `sw, sh, sb`
- Format SB : Instructions de branchement relatifs ex: `beq, bne, bge, blt, bltu, bgeu`
- Format U : Instruction avec le haut d’un immédiat sur `[31:12]` ex: `aiupc, lui`
- Format UJ : Instructions de branchement sur un registre ex: `jal`

*Référence*: Si vous voulez en savoir plus je vous recommande le chapitre 7 du cours «[cs61c](https://inst.eecs.berkeley.edu/~cs61c/resources/su18_lec/Lecture7.pdf)» de l’université Berkley par Steven Ho ~45 min de lecture à tête reposée.

### Fonctions et conventions d’appels

Une fonction c’est juste un ensemble d’instructions «regroupé», pour l’utiliser on «saute» à son adresse de début puis on en revient une fois fini. Pour sauter, facilement au début de ce bloc, on nomme les entrées d’un suite d’instructions à l’aide de label/étiquette.

Les fonctions peut être écrite par des personnes différentes directement en assembleur, ou même résulter des compilations sous format de fichier objet `.o` provenant de compilateurs différent.

Il n’est pas possible de seulement définir pour 2 personnes une convention pour communiqué, notamment car il n’y pas forcément de relation/communication entre les différents programmeur, par exemple dans le cas de librairie de code.

Pour résoudre ce problème, une convention stardard, appellé [Aplication Binary Interface](https://en.wikipedia.org/wiki/Application_binary_interface) est défini selon au moins :

- jeux d’instruction
- format du binaire
- système d’exploitation
- des détails hardware par exemple la gestion des flottants.

Nous concrétement en RiscV on utilise l’ABI [riscv-elf-linux](https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md).

Pour revenir à notre fonction `somme` son code pourrais ressembler de façon optimiser :

```
# a0: Addresse d'itération sur le tableau# a1: Taille du tableausomme:    mv   t2, zero     # sum <- 0    beqz a1, end_loop # size == 0?    slli a1, a1, 2    # size <- (size * 4)    mv   t0, a0       # @fin <- @base    # Calcul adresse de fin du tableau    # @fin <- @base + (size * 4)    add  t0, a0, a1 # @Fin <- @base + size# Notre boucle qui fait la somme.loop:    lw   t1, 0(a0)    # val <- *iterateur    addi a0, a0, 4    # @iterateur + 4    add  t2, t2, t1   # somme += val    bne  t0, a0, loop # @iterateur == @finend_loop:    mv   a0, t2  # On copie sum dans le registre de retour    jr   ra, 0   # On retourne dans la fonction qui avait appellée somme
```

Et le code pour appeller `somme` à:

```
array: .word 1, 1, 1.text# On charge les paramètres pour appeller somme# a0: contiens l'adresse du tableau# a1: contiens la sommela a0, arrayli a1, 3jal somme# print result of sum contained in a0.li a7, 1ecall# call exit pour terminer le programme.li a7, 10ecall
```

`somme` ici est une fonction dite terminale, elle n’appelle pas d’autres fonctions donc on à pas besoin de sauvegarder le contenu des registres et on à utiliser que des registres temporaires et à sauvegarder par l’appellant dans le corps de `somme`.

Cependant il s’agit d’une optimisation un compilateur C sans aucune optimisation aurait produit un code avec une sauvegarde des registres sur la pile.

<!– ## Exercices

(refactoring à venir) Sujets:

- Rechercher un entier passé en paramètre dans un tableau de entier. objectif : cionvention d’appel, comparaison, accès mémoire
- Incrémenter un tableau par un entier N. objectif : opération, accès mémoire
- Trouver le maximum d’un tableau de nombre. objectif : comparaison, accès mémoire
- Jouer une mélodie avec des appels système objectif : appel système, accès mémoire
- Swapp 2 à 2 des élèments d’un tableau objectif : découverte des écriture mémoires [1,2,3,4] deviendrais [2,1,4,3]

< !– - Ecrire un compresseur [RLE](https://fr.wikipedia.org/wiki/RLE) objectif : accès mémoire, registre – >

- Faire un chiffrement simple par décalage objectif : utilisation des décalage de bits –>

### Références:

- https://en.wikipedia.org/wiki/RISC-V
- https://rv8.io/asm.html
- https://rv8.io/isa
- https://github.com/riscv/riscv-isa-manual
- Cours MIT archi https://www.youtube.com/channel/UC1DcxXg6GkAcp2zk2w7U6qQ/videos
- https://riscv.org/specifications/
- https://inst.eecs.berkeley.edu/~cs61c/fa17/lec/05/L05%20RISCV%20Intro%20(1up).pdf