  -   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    9  !  winspool  Canon LBP2900  USB004                        
�Canon LBP2900                   � (
�  	 �4d   X       A4                                                                                Canon   �              	� �
C C a n o n   L B P 2 9 0 0                                            �  ��   dd d 	
 
d	d 
d
d    d d d�@@ d  d  
 d	 d d  d" edd	
d d  !"#$%&'()* d	
" d	
 d	
 d! d 	d!	
 
d ��  @8        	 	 4  �  3   )     ^  1�	 	 4  �  3   )     ^  1�� XX    d             2               �   A r i a l                                                                                                   \CNZ005.ICC                                           \CNZ005.ICC                                            \CNZ005.ICC              	   ��                                                                                                                                                                                                                                                                         �   C O N F I D E N C I A L                                         C O N F I D E N C I A L                                         H       �   A r i a l                                                       ���         �                                                C o n f i g u r a c i � n   p r e d e t e r m i n a d a                                                          �          X                 ��                                                                                                �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                �DRIVER=winspool
DEVICE=Canon LBP2900
OUTPUT=USB004
ORIENTATION=0
PAPERSIZE=9
COPIES=1
DEFAULTSOURCE=4
PRINTQUALITY=600
TTOPTION=3
COLLATE=0
             JUGADORE.DBF                   Jugadore                       	Num_lista                      JUGADORE.DBF                   Segundo                        	Num_lista                      
RONDAS.DBF                     Rondas                         CONTROL.DBF                    Control                        SUB_TORN.DBF                   Sub_torn                       Codigo                         
TORNEO.DBF                     Torneo                         jug_num1                       Jugadore                       Rondas                         jug_num2                       Segundo                        Rondas                         Control.sub_torneo             Sub_torn                       Control                        num_mesa                                                      Courier New                    &not jugadore.once and not segundo.once                          jug_num1                                                      Courier New                    not jugadore.once              Courier New                    "-"                            substr(Jugadore.nombre,1,29)                                                                   Courier New                    substr( Segundo.nombre,1,29)                                                                   Courier New                    control.ronda + 1              Courier New                    Jugadore.federacion            Courier New                    segundo.federacion             Courier New                    DATE()                         Courier New                    _PAGENO                        Courier New                    Torneo.localidad               Courier New                    Torneo.bikote_ard              Courier New                    trim(Torneo.nom_torneo)                                       Courier New                    Sub_torn.nombre                Courier New                                                   "..\iconos\firma.bmp"          Jugadore.elo_fide                                             Courier New                    "@Z"                           Segundo.elo_fide                                              Courier New                    "@Z"                           jugadore.tot_ptos                                             Courier New                    "99.9"                         Segundo.tot_ptos                                              Courier New                    "99.9"                         num_mesa                                                      Courier New                    jugadore.once or segundo.once                                   jug_num1                                                      Courier New                    jugadore.once                  jug_num2                                                      Courier New                    segundo.once                   Courier New                    "Sin"                          Courier New                    ".Orria"                       Courier New                    ".Txandaren bikoteak"          jug_num2                                                      Courier New                    not segundo.once               Courier New                    "Mahaia"                                                      !"..\iconos\hondarribia\totem.png"                                                              2"..\iconos\hondarribia\logo_hiruzta_txakolina.jpg"                                             4"..\iconos\hondarribia\ayuntamiento-hondarribia.gif"                                           )"..\iconos\hondarribia\logoparadores.jpg"                                                      $"..\iconos\hondarribia\marlaxka.jpg"                                                           *"..\iconos\hondarribia\logo fgajedrez.jpg"                                                     +"..\iconos\hondarribia\bacalao donosti.jpg"                                                    ""..\iconos\hondarribia\eroski.jpg"                              Courier New                    Courier New                    Courier New                    dataenvironment                �Top = 0
Left = 0
Width = 0
Height = 0
AutoOpenTables = .T.
AutoCloseTables = .T.
InitialSelectedAlias = "Rondas"
DataSource = .NULL.
Name = "dataenvironment"
                             fPROCEDURE Destroy
*- [CONVERTER] Reset tables for compatibilityTHIS.OpenTablesTHIS.Init
ENDPROC
                            ����    �   �                         d�   %   _       x      p           �  U   
 ��  � �
 ��  � � U  THIS
 OPENTABLES INIT Destroy,     ��1 � � 2                       [       )   �                              cursor                         �Alias = "Jugadore"
Order = "Num_lista"
CursorSource = jugadore.dbf
Name = "cursor1"
                                                                                                            cursor                         WAlias = "Segundo"
Order = "Num_lista"
CursorSource = jugadore.dbf
Name = "cursor2"
          cursor                         ?Alias = "Rondas"
CursorSource = rondas.dbf
Name = "cursor3"
                                  cursor                         AAlias = "Control"
CursorSource = control.dbf
Name = "cursor4"
                                cursor                         UAlias = "Sub_torn"
Order = "Codigo"
CursorSource = sub_torn.dbf
Name = "cursor5"
            cursor                         ?Alias = "Torneo"
CursorSource = torneo.dbf
Name = "cursor6"
                                  relation                       |ParentAlias = "Rondas"
RelationalExpr = "jug_num1"
ChildAlias = "Jugadore"
ChildOrder = "Num_lista"
Name = "relation7"
      relation                       {ParentAlias = "Rondas"
RelationalExpr = "jug_num2"
ChildAlias = "Segundo"
ChildOrder = "Num_lista"
Name = "relation8"
       relation                       �ParentAlias = "Control"
RelationalExpr = "Control.sub_torneo"
ChildAlias = "Sub_torn"
ChildOrder = "Codigo"
Name = "relation9"
                                