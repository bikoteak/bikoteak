SET talk OFF
USE ?
replace ALL id_number WITH VAL(SUBSTR(todo,1,8)),;
            name WITH SUBSTR(todo,11,32),;
            title WITH SUBSTR(todo,45,2),;
            country WITH SUBSTR(todo,49,3),;
            ro WITH VAL(SUBSTR(todo,54,4)),;
            games WITH VAL(SUBSTR(todo,60,3)),;
            birthday WITH VAL(SUBSTR(todo,65,4)),;
            flag WITH SUBSTR(todo,71,3),;
            sex WITH IIF(AT("w",flag) <> 0,"w"," ")
USE
SET TALK on