   �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    C  )  winspool  HP LaserJet 1100 (MS)  DOT4_001                                               �HP LaserJet 1100 (MS)            � 4C� 	 �4d   X  X  A4                                                            ����                DINU"   4  7#�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �DRIVER=winspool
DEVICE=HP LaserJet 1100 (MS)
OUTPUT=DOT4_001
ORIENTATION=0
PAPERSIZE=9
ASCII=9
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
TTOPTION=1
COLLATE=1
                                  
RONDAS.DBF                     Rondas                         
CUADRO.DBF                     Cuadro                         Jugador                        JUGADORE.DBF                   Jugadore                       	Num_lista                      JUGADORE.DBF                   Segundo                        	Num_lista                      FEDERACI.DBF                   Federaci                       
Federacion                     RESULTAD.DBF                   Resultad                       	Resultado                      FEDERACI.DBF                   Federac2                       
Federacion                     CONTROL.DBF                    Control                        Cuadro.jug_num2                Segundo                        Cuadro                         Cuadro.jug_num1                Jugadore                       Cuadro                         	resultado                      Resultad                       Cuadro                         
federacion                     Federaci                       Jugadore                       
federacion                     Federac2                       Segundo                        Cuadro.jug_num1                cuadro.n_ronda                 Courier New                    cuadro.jug_num2                Courier New                    Segundo.licencia               Courier New                    "@Z"                           Segundo.nombre                 Courier New                    Resultad.texto_ingl            Courier New                    2iif(Segundo.elo_fide > 2000,segundo.elo_fide,2000)              Courier New                    Federac2.pais                  Courier New                    Jugadore.nombre                Courier New                    Jugadore.num_lista             Courier New                    Federaci.pais                  Courier New                    Jugadore.licencia              Courier New                    "@Z"                           4iif(Jugadore.elo_fide > 2000,Jugadore.elo_fide,2000)            Courier New                    >iif(Segundo.sexo = "w", Segundo.categoriaw, Segundo.categoria)                                   Courier New                    iif(Jugadore.sexo = "w" .and. Jugadore.categoria = " ", Jugadore.categoriaw,iif( Jugadore.sexo <> "w", Jugadore.categoria," "))                                    Courier New                    Segundo.sexo                   Courier New                    Jugadore.sexo                  Courier New                    Courier New                    
"Dirigido"                     Jugadore.dirigido              Courier New                    Resultad.ptos_blan             Courier New                    Jugadore.elo_fide + sum_elo                                     Courier New                    Zint((IIF(Jugadore.elo_fide <> 0,Jugadore.elo_fide,2000) + sum_elo) /  (Control.ronda + 1))       Courier New                    Courier New                    "Suma de Elo ="                Courier New                    "Media de Elo"                 Courier New                    "Faltan"                       �iif( Jugadore.dirigido = "m" .or. Jugadore.dirigido = "wg",23255-sum_elo- Jugadore.elo_fide,iif(jugadore.dirigido = "g",24005-sum_elo-Jugadore.elo_fide,22505-sum_elo-Jugadore.elo_fide))           Courier New                    sum_elo                        .IIF(Segundo.elo_fide<>0,Segundo.elo_fide,2000)                  0                              Courier New                    Courier New                    dataenvironment                �Top = 0
Left = 0
Width = 0
Height = 0
AutoOpenTables = .T.
AutoCloseTables = .T.
InitialSelectedAlias = "Cuadro"
DataSource = .NULL.
Name = "dataenvironment"
                             fPROCEDURE Destroy
*- [CONVERTER] Reset tables for compatibilityTHIS.OpenTablesTHIS.Init
ENDPROC
                            ����    �   �                         d�   %   _       x      p           �  U   
 ��  � �
 ��  � � U  THIS
 OPENTABLES INIT Destroy,     ��1 � � 2                       [       )   �                              cursor                         �Alias = "Rondas"
CursorSource = rondas.dbf
Name = "cursor1"
                                                                                                                                     cursor                         RAlias = "Cuadro"
Order = "Jugador"
CursorSource = cuadro.dbf
Name = "cursor2"
               cursor                         XAlias = "Jugadore"
Order = "Num_lista"
CursorSource = jugadore.dbf
Name = "cursor3"
         cursor                         WAlias = "Segundo"
Order = "Num_lista"
CursorSource = jugadore.dbf
Name = "cursor4"
          cursor                         YAlias = "Federaci"
Order = "Federacion"
CursorSource = federaci.dbf
Name = "cursor5"
        cursor                         XAlias = "Resultad"
Order = "Resultado"
CursorSource = resultad.dbf
Name = "cursor6"
         cursor                         YAlias = "Federac2"
Order = "Federacion"
CursorSource = federaci.dbf
Name = "cursor7"
        cursor                         AAlias = "Control"
CursorSource = control.dbf
Name = "cursor8"
                                relation                       �ParentAlias = "Cuadro"
RelationalExpr = "Cuadro.jug_num2"
ChildAlias = "Segundo"
ChildOrder = "Num_lista"
Name = "relation9"
                                 relation                       �ParentAlias = "Cuadro"
RelationalExpr = "Cuadro.jug_num1"
ChildAlias = "Jugadore"
ChildOrder = "Num_lista"
Name = "relation10"
                               relation                       ~ParentAlias = "Cuadro"
RelationalExpr = "resultado"
ChildAlias = "Resultad"
ChildOrder = "Resultado"
Name = "relation11"
                                     relation                       �ParentAlias = "Jugadore"
RelationalExpr = "federacion"
ChildAlias = "Federaci"
ChildOrder = "Federacion"
Name = "relation12"
                                 relation                       �ParentAlias = "Segundo"
RelationalExpr = "federacion"
ChildAlias = "Federac2"
ChildOrder = "Federacion"
Name = "relation13"
                                   