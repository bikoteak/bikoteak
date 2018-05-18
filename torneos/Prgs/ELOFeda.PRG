SET talk OFF
USE ?
replace ALL clave WITH VAL(SUBSTR(todo,1,10)),;
            jugador WITH SUBSTR(todo,11,40),;
            federacion WITH SUBSTR(todo,68,3),;
            ranking WITH VAL(SUBSTR(todo,77,9)),;
            fnac WITH VAL(SUBSTR(todo,100,4))
USE
SET TALK on