SET talk OFF
USE ?
replace ALL codigo WITH VAL(SUBSTR(todo,1,7)),;
            nom WITH SUBSTR(todo,8,32),;
            elo WITH VAL(SUBSTR(todo,58,4))
USE
SET TALK on