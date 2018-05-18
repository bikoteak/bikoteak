# Bikoteak

En memoria de Juanjo Escribano Lasa (1954 - 2016). 

Una pequeña biografía de Juanjo y la historia de este programa se pueden consultar en [http://www.ajedrezando.es/jel/](http://www.ajedrezando.es/jel/)

## Qué es esto

Bikoteak nació como un programa para ayudar en las tareas de emparejamientos a los árbitros de torneos de ajedrez. Y evolucionó hasta ser un motor de emparejamientos funcional y rápido con el que se emparejaron diversos torneos, entre otros muchas ediciones del Open de Andorra.

Ahora, tras el fallecimiento de Juanjo en 2016, algunos de sus amigos hemos intentado hacer algo con el famoso "programa de Juanjo", programa del que todos hemos oído hablar. 

Ante los últimos cambios habidos en el [Reglamento del Sistema Suizo](http://www.fide.com/fide/handbook.html?id=18&view=category) de la [FIDE](http://www.fide.com), la falta de tiempo de adecuar el programa a las nuevas reglas y el entorno de programación en el que está escrito el programa (Fox Pro), hemos decidido de acuerdo con la familia de Juanjo en poner a disposición de todo el mundo bajo una licencia libre (GPLv2), todo el código del programa.

## ¿Pero esto funciona?

Sí... Si tienes Visual Fox Pro, descargas todo lo que han en el repositorio y abres el archivo del proyecto, esto funciona. 

Eso sí, tendrás que hacer un poco de "trabajos manuales" para hacer funcionar el programa (introducir jugadores...), ya que no tiene ventanas y opciones de menú automatizadas para realizar las tareas de carga de jugadores, etc. Tareas que, sin embargo, están implementadas en el programa y Juanjo las utilizaba. Pero se necesita un conocimiento más profundo del programa para saber dónde están y utilizar.as

## ¿Está el programa que empareja aquí?

Sí. En la carpeta [torneos/Prgs](torneos/Prgs) está el código del emparejador. El programa inicial es el archivo **suizo00.prg** por lo que desde la terminal de comandos de Fox Pro, puedes hacer lo siguiente para volver a la pantalla inicial del programa:

``` do suizo00```

Después el programa está estructurado siguiendo el pseudo-algoritmo descrito por las [reglas anteriores del sistema suizo](http://www.fide.com/fide/handbook.html?id=167&view=article). Y por eso tenemos los archivos **empac01.prg**, **empac02.prg**, etc. que tienen el código que trata ese apartado específico.

## Aquí hay muchos archivos que no valen para nada...

Puede ser. No tenemos un profundo conocimiento de Fox Pro y puede ser que algunos de los archivos que hayamos subido sean binarios que se creen automáticamente al ejecutar el programa. Ante la duda hemos decidido subirlo todo.

## ¿Pero esto está en euskañol?

Eh... sí. Bueno... hay menús y opciones que están parcialmente en euskara y parcialmente en español... El código también tiene comentarios y variables en euskara...

## Yo sé Visual Fox Pro/xBase y quiero ayudar

Bien, perfecto, nos encantaría hacer algo más funcional con esto. Contacta con nosotros, bien añadiendo una incidencia utilizando la opción **Issues** de Github o enviando un correo electrónico a bikoteakdejuanjo@gmail.com .
