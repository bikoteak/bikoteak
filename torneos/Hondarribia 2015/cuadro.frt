  #                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 `  ' @EPSON Stylus COLOR 64 EPIJNL20 LPT1:                                                         �EPSON Stylus COLOR 64 (Copia 2)  &� &�� 	 �4    h   h                                                                              DLLName16=EPIGUE3O.DLL          DLLName32=EPIDA230.DLL          EPSON Stylus COLOR 640            hh          	 L�L�d hh�q* * * � �q* * * �              2   �       }      
                                                              4�                        �x�DDLLENT      Courier New      JUGADORE.DBF      Jugadore      Clasific      
TORNEO.DBF      Torneo      RESULTAD.DBF      Resultad      	Resultado      JUGADORE.DBF      Segundo      	Num_lista      
CUADRO.DBF      Cuadro      Jugador      CONTROL.DBF      Control      SUB_TORN.DBF      Sub_torn      Codigo      STR(Jugadore.num_jug,3)      Cuadro      Jugadore      jug_num2      Segundo      Cuadro      	resultado      Resultad      Cuadro      Control.sub_torneo      Sub_torn      Control      "J U G A D O R"      Courier New      Jugadore.nombre      Courier New      Torneo.nom_torneo      Courier New      Jugadore.clasific      Courier New      "Num"      Courier New      Jugadore.federacion      Courier New      "Fed"      Courier New      ]IIF(Jugadore.categoria =" " .and. Jugadore.sexo = "w",Jugadore.categoriaw,Jugadore.categoria)      Courier New      "T"      Courier New      "1"      Courier New      "2"      Courier New      "3"      Courier New      
suizoj4(1)      "@Z"      Courier New      "4"      Courier New      "5"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      
suizoj4(2)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      
suizoj4(3)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      
suizoj4(4)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      puntos1      Courier New      puntos2      Courier New      puntos3      Courier New      puntos4      Courier New      "6"      Courier New      "7"      Courier New      "8"      Courier New      
suizoj4(5)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      
suizoj4(6)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      
suizoj4(7)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      
suizoj4(8)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      puntos5      Courier New      puntos6      Courier New      puntos7      Courier New      puntos8      Courier New      "ELO"      Courier New      Jugadore.elo_fide      Courier New      Jugadore.elo_fide <> 0      
suizoj4(9)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      puntos9      Courier New      "9"      Courier New      	texto_cab      Courier New      detalle      Courier New      Jugadore.sexo      Courier New      "S"      Courier New      suizoj4(10)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      puntos10      Courier New      suizoj4(11)      "@Z"      Courier New      Kiif(cuadro.resultado >=6 .or. eof("cuadro")," ",iif(cuadro.status,"B","N"))      Courier New      puntos11      Courier New      "10"      Courier New      "11"      Courier New      Sub_torn.nombre      Courier New      puntos1      
suizoj1(1)      0      puntos2      
suizoj1(2)      0      puntos3      
suizoj1(3)      0      puntos4      
suizoj1(4)      0      puntos5      
suizoj1(5)      0      puntos6      
suizoj1(6)      0      puntos7      
suizoj1(7)      0      puntos8      
suizoj1(8)      0      puntos9      
suizoj1(9)      0      puntos10      suizoj1(10)      0      puntos11      suizoj1(11)      0      detalle      suizojj(texto_cam)      ""      Courier New      Courier New      Courier New      dataenvironment      jAutoOpenTables = .T.
AutoCloseTables = .T.
InitialSelectedAlias = "Jugadore"
Name = "dataenvironment"
      jPROCEDURE InitPROCEDURE Destroy*- [CONVERTER] Reset tables for compatibilityTHIS.OpenTablesTHIS.Init     L���    3  �   K                     �   %   f       �      �   /��4&   �  U    U   
 ��  � �
 ��  � � U  THIS
 OPENTABLES INIT Init,     �� Destroy3     ��1 2 � � 1                                "   j      c:\torneos\andorra 2006\ 61768861.fxp c:\torneos\andorra 2006\61768861.prg  )   �                        cursor      WAlias = "Jugadore"
CursorSource = JUGADORE.DBF
Order = "Clasific"
Name = "cursor1"
      cursor      ?Alias = "Torneo"
CursorSource = TORNEO.DBF
Name = "cursor2"
      cursor      XAlias = "Resultad"
CursorSource = RESULTAD.DBF
Order = "Resultado"
Name = "cursor3"
      cursor      WAlias = "Segundo"
CursorSource = JUGADORE.DBF
Order = "Num_lista"
Name = "cursor4"
      cursor      RAlias = "Cuadro"
CursorSource = CUADRO.DBF
Order = "Jugador"
Name = "cursor5"
      cursor      AAlias = "Control"
CursorSource = CONTROL.DBF
Name = "cursor6"
      cursor      UAlias = "Sub_torn"
CursorSource = SUB_TORN.DBF
Order = "Codigo"
Name = "cursor7"
      relation      �ParentAlias = "Jugadore"
RelationalExpr = "STR(Jugadore.num_jug,3)"
ChildAlias = "Cuadro"
ChildOrder = "Jugador"
Name = "relation8"
      relation      {ParentAlias = "Cuadro"
RelationalExpr = "jug_num2"
ChildAlias = "Segundo"
ChildOrder = "Num_lista"
Name = "relation9"
      relation      ~ParentAlias = "Cuadro"
RelationalExpr = "resultado"
ChildAlias = "Resultad"
ChildOrder = "Resultado"
Name = "relation10"
      relation      �ParentAlias = "Control"
RelationalExpr = "Control.sub_torneo"
ChildAlias = "Sub_torn"
ChildOrder = "Codigo"
Name = "relation11"
