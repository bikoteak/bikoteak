                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   `%  . @Brother HL-1650/1670N series brohl00a LPT1:                                                  �Brother HL-1650/1670N series     F� �   	         X                                                                                        X    �S                                                       D �  ���                                            ��                              �      Brother HL-1650/1670N series    ! BRHL1650.ini  (       ��                                                                                                                                                                                                                                                                                                    ��                Arial                               ���                                                   �������������������������������������������������   d                                                     Courier New      JUGADORE.DBF      Jugadore      Clasific      
CUADRO.DBF      Cuadro      Jugador      CONTROL.DBF      Control      AUSENCIA.DBF      Ausencia      N_ronda      SUB_TORN.DBF      Sub_torn      Codigo      
TORNEO.DBF      Torneo      0STR(Control.ronda+1,2)+STR(Jugadore.num_lista,3)      Ausencia      Jugadore      STR(Jugadore.num_lista,3)      Cuadro      Jugadore      Control.sub_torneo      Sub_torn      Control      Jugadore.tot_ptos      Torneo.nom_torneo      Courier New      control.ronda      Courier New      "�Ronda"      Courier New      linea      Courier New      not deleted()      "Fichas arbitrales tras la"      Courier New      
"Grupo de"      Courier New      Jugadore.tot_ptos      Courier New      "Puntos"      Courier New      
tot_negras      Courier New      tot_blancas      Courier New      	"Blancas"      Courier New      "Negras"      Courier New      "Sin color"      Courier New      tot_nulo <> 0      tot_nulo      Courier New      tot_nulo <> 0      Sub_torn.nombre      Courier New      linea      	suizoj2()      ""      tot_blancas      suizoj3(tot_blancas,"B")      0      
tot_negras      suizoj3(tot_negras,"N")      0      tot_nulo      suizoj3(tot_nulo," ")      0      Courier New      Courier New      dataenvironment      jAutoOpenTables = .T.
AutoCloseTables = .T.
InitialSelectedAlias = "Jugadore"
Name = "dataenvironment"
      jPROCEDURE InitPROCEDURE Destroy*- [CONVERTER] Reset tables for compatibilityTHIS.OpenTablesTHIS.Init     L���    3  �   K                     �   %   f       �      �   ѩ�2&   �  U    U   
 ��  � �
 ��  � � U  THIS
 OPENTABLES INIT Init,     �� Destroy3     ��1 2 � � 1                                "   j      c:\torneos\andorra 2005\ 76473741.fxp c:\torneos\andorra 2005\76473741.prg  )   �                        cursor      WAlias = "Jugadore"
CursorSource = JUGADORE.DBF
Order = "Clasific"
Name = "cursor1"
      cursor      RAlias = "Cuadro"
CursorSource = CUADRO.DBF
Order = "Jugador"
Name = "cursor2"
      cursor      AAlias = "Control"
CursorSource = CONTROL.DBF
Name = "cursor3"
      cursor      VAlias = "Ausencia"
CursorSource = AUSENCIA.DBF
Order = "N_ronda"
Name = "cursor4"
      cursor      UAlias = "Sub_torn"
CursorSource = SUB_TORN.DBF
Order = "Codigo"
Name = "cursor5"
      cursor      ?Alias = "Torneo"
CursorSource = TORNEO.DBF
Name = "cursor6"
      relation      �ParentAlias = "Jugadore"
RelationalExpr = "STR(Control.ronda+1,2)+STR(Jugadore.num_lista,3)"
ChildAlias = "Ausencia"
ChildOrder = "N_ronda"
Name = "relation7"
      relation      �ParentAlias = "Jugadore"
RelationalExpr = "STR(Jugadore.num_lista,3)"
ChildAlias = "Cuadro"
ChildOrder = "Jugador"
Name = "relation8"
      relation      �ParentAlias = "Control"
RelationalExpr = "Control.sub_torneo"
ChildAlias = "Sub_torn"
ChildOrder = "Codigo"
Name = "relation9"
