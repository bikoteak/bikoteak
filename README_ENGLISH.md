# Bikoteak

Remembering IA Juanjo Escribano Lasa (1954-2016)

Juanjo Escribano Lasa was a basque chess International Arbiter. He was also a developer for a local bank.

On early computer days he decided to write a software to ease his work as an arbiter in chess tournaments. Later the initial idea evolved and the software became a complete pairing program. But Juanjo never thought the software as a tool for other arbiters but as something for him. 

After his death, his friends and family have decided to publish the software he wrote with a Free Software License (GPLv2).

You can find a Bio about Juanjo in spanish at [http://www.ajedrezando.es/jel/](http://www.ajedrezando.es/jel/).

[Juanjo on FIDE website](https://ratings.fide.com/card.phtml?event=22243976)

## What is this

Bikoteak (which means *pairs* in basque language) is a pairing software written in Visual Fox Pro. It adheres to the [old Dutch Swiss Rules](http://www.fide.com/fide/handbook.html?id=167&view=article). With minor changes (that's what we think), you can get it to work according to the actual official rules. Nevertheless we do not have the time nor the resources to do this work, so we decided to publish the code of the software as is.

## Can I make it work?

Yes you can, if you have a copy of Visual Fox Pro, download the full repository and start the program. Be aware that some of the menus and options (and even the code) has basque or spanish comments and variable names.

You may need to do some work by hand (such as adding players and so on), because we know that Juanjo had something automated to load players from rating lists, but we do not know how it is done exactly.

## Is the Swiss Algorithm implementation here?

Yes. Just open the [torneos/Prgs](torneos/Prgs) folder and you will find there the program. The main program is called **suizo00.prg**, so you can call ```do suizo00``` from the command terminal of Visual Fox Pro to start the program.

The Swiss Algorithm is splitted in several files such as **empac01.prg** or **empac02.prg**. As you may have noted, the files have the reference of the relevant article of the Swiss Regulations (C01, C02, ...)

## There are a lot unused files

We do not have an in-depth knowledge of Visual Fox Pro so we decided to upload all the files of the project, so we may have uploaded a lot of binary files. We are sorry.

## Can I help?

Yes! You are welcome! Please, add an **Issue** on Github or write to bikoteakdejuanjo@gmail.com to get in touch with us.
