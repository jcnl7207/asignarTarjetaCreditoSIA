**Free 
   Ctl-Opt BNDDIR('SATSERVIS') dftactgrp(*no) PgmInfo(*Pcml:*Module);
   Dcl-F SatCliente  Usage(*Input) Keyed PreFix(x_);
   Dcl-F CliMaeL01   Usage(*Input) Keyed PreFix(C_);
   Dcl-F clidir      Usage(*Input) Keyed;
   Dcl-F SRHEMPLEA   Usage(*Input) Keyed prefix(s_);
   Dcl-F clivincli1  Usage(*Input) Keyed;
   Dcl-F cliciudal1  Usage(*Input) Keyed prefix(a_);
   Dcl-F mppaises    Usage(*Input) Keyed prefix(b_);
   Dcl-F satcattar   Usage(*Input) Keyed prefix(d_);
   Dcl-F satmartip   Usage(*Input) Keyed prefix(e_);
   Dcl-F satparam    Usage(*Input) Keyed prefix(t_);
                                                                                
   //----------------------------------------------------------------****
   Dcl-S ind_cli           Zoned(1:0);
   Dcl-S NIT2              Zoned(17:0) Inz(0);
   Dcl-S CLIDES            Char(5);
   Dcl-S fec_ing           inz like(c_fecing);
   Dcl-S IndNull           Bindec(4);
   Dcl-S LON               Zoned(3:0) inz;
   Dcl-S pDatos            Char(480);
   Dcl-S NumeroTarjeta     Char(22);
   Dcl-S Primernom         Char(40);
   Dcl-S segundnom         Char(40);
   Dcl-S nombre80          Char(80);
   Dcl-S error_ws          Char(7);
   Dcl-S deserr_ws         Char(104);
   Dcl-S pos1              Zoned(4:0) inz;
   Dcl-S parmws            Char(2000) inz;
   Dcl-S nom_ser           Char(10)   inz;
   Dcl-S direc120          Char(120);
   Dcl-S doc_txt           Char(17);
   Dcl-S cod_sis           Zoned(3:0) inz;
   Dcl-S cod_pro           Zoned(3:0) inz;
   Dcl-S vlr_cup           Zoned(13:0) inz;
   Dcl-S nombre120         Char(120)  inz;
   Dcl-S apellidos         Char(40);
   Dcl-S nombres           Char(40);
   Dcl-S pp_retorno        Char(3);
   Dcl-S pp_descRetorno    Char(200);
                                                                           
   Dcl-DS *N;
     WsClalper             Char(1733) Pos(1);
     CODENT                Char(4)    Pos(1);
     TIPDOCCLA             Char(3)    Pos(5);
     NUMDOC                Char(22)   Pos(8);
     FECDOC                Char(10)   Pos(30);
     TIPPER                Char(1)    Pos(40);
     ESTPER                Char(1)    Pos(41);
     FECESTCLA             Char(10)   Pos(42);
     TIPCLIEN              Char(2)    Pos(52);
     SUBTIPCLI             Char(2)    Pos(54);
     CODIDIOMA             Char(2)    Pos(56);
     BLOQUEO               Char(1)    Pos(58);
     INDREPOS              Char(1)    Pos(59);
     CNAE                  Char(5)    Pos(60);
     CODCIRBER             Char(22)   Pos(65);
     CLAVEACCR             Char(40)   Pos(87);
     SITCLAVER             Char(2)    Pos(127);
     NIVSEGCER             Char(1)    Pos(129);
     PUBLICIDAD            Char(1)    Pos(130);
     INDVIPCER             Char(1)    Pos(131);
     NOMBRECER             Char(40)   Pos(132);
     NOMLARGOR             Char(30)   Pos(172);
     APELLI1ER             Char(36)   Pos(202);
     APELLI2ER             Char(36)   Pos(238);
     APELARGOR             Char(50)   Pos(274);
     CODPAISNCT            Zoned(3:0) Pos(324);
     CODPAISNAC            Char(3)    Pos(327);
     CODPAISRES            Char(3)    Pos(330) Inz('170');
     SEXPER                Char(1)    Pos(333);
     FECNAC                Zoned(10:0) Pos(334);
     INDESTCIV             Char(1)    Pos(344);
     REGECON               Char(1)    Pos(345);
     INDTRACOR             Char(2)    Pos(346);
     CODPROF               Char(3)    Pos(348);
     FECFELICITA           Char(4)    Pos(351);
     TIPFELICITA           Char(1)    Pos(355);
     NOMCOR                Char(40)   Pos(356);
     RAZSOC                Char(100)  Pos(396);
     FORJUR                Char(8)    Pos(496);
     FECCREA               Char(10)   Pos(504);
     CODPAISEMP            Char(3)    Pos(514) Inz;
     CODACT                Zoned(4:0) Pos(517) Inz(0);
     NUMEMPLEA             Zoned(7:0) Pos(521) Inz(0);
     NUMSUCURS             Zoned(7:0) Pos(528) Inz(0);
     INDNIVIMP             Char(2)    Pos(535);
     GRUPBE                Char(22)   Pos(537);
     SECCIRBE              Char(1)    Pos(559);
     TIPSECCIR             Char(1)    Pos(560);
     CODSWIFT              Char(22)   Pos(561);
     CODISIN               Char(22)   Pos(583);
     TIPLOCAL              Char(2)    Pos(605);
     codpaisd              Zoned(3:0) Pos(607);
     CODREGION             Zoned(3:0) Pos(610);
     CODPROV               Zoned(2:0) Pos(613);
     POBLACION             Char(35)   Pos(615);
     TIPVIA                Char(2)    Pos(650);
     NOMVIA                Char(40)   Pos(652);
     NUMVIA                Char(6)    Pos(692);
     EDIFICIO              Char(4)    Pos(698);
     ESCALERA              Char(4)    Pos(702);
     PISOL                 Char(4)    Pos(706);
     PUERTA                Char(4)    Pos(710);
     RESTODIR              Char(40)   Pos(714);
     CODPOSTAL             Char(10)   Pos(754);
     CODAPTCOR             Char(10)   Pos(764);
     EMPRESA               Char(3)    Pos(774);
     CENTRO                Char(4)    Pos(777);
     DEPARTAM              Char(4)    Pos(781);
     REFPER                Char(22)   Pos(785);
     INDENVCOR             Char(1)    Pos(807);
     TIPMEDIO1             Char(2)    Pos(808);
     CARACTER1             Char(1)    Pos(810);
     DESCLAVE1             Char(100)  Pos(811);
     TIPMEDIO2             Char(2)    Pos(911);
     CARACTER2             Char(1)    Pos(913);
     DESCLAVE2             Char(100)  Pos(914);
     TIPMEDIO3             Char(1002) Pos(014);
     CARACTER3             Char(1001) Pos(016);
     DESCLAVE3             Char(1100) Pos(017);
     TIPMEDIO4             Char(1002) Pos(117);
     CARACTER4             Char(1001) Pos(119);
     DESCLAVE4             Char(1100) Pos(120);
     TIPMEDIO5             Char(1002) Pos(220);
     CARACTER5             Char(1001) Pos(222);
     DESCLAVE5             Char(1100) Pos(223);
     TIPMEDIO6             Char(1002) Pos(323);
     CARACTER6             Char(1001) Pos(325);
     DESCLAVE6             Char(1100) Pos(326);
     OBSERVACION           Char(1300) Pos(426);
     IDENTCLI              Char(1008) Pos(726);
   End-DS;        

   Dcl-DS *N;        
     WsAdalcon             Char(854)  Pos(1);
     CODENT_A              Char(4)    Pos(1);
     CENTALTA              Char(4)    Pos(5);
     PRODUCTO              Char(2)    Pos(9);
     SUBPRODU              Char(4)    Pos(11);
     CONPROD               Char(3)    Pos(15);
     CODCONVEN             Char(4)    Pos(18);
     CODPROMO              Char(3)    Pos(22);
     NUMPER                Char(8)    Pos(25);
     NUMPERVAL             Char(8)    Pos(33);
     INDCTAEMP             Char(1)    Pos(41);
     INDNOMEMP             Char(1)    Pos(42);
     NOMBREEMP             Char(30)   Pos(43);
     CODREGIMEN            Char(4)    Pos(73);
     FORPAGO               Char(2)    Pos(77);
     INDSITCTA             Char(1)    Pos(79);
     GRUPOLIQ              Char(2)    Pos(80);
     GRUPOCUO              Char(2)    Pos(82);
     OFIVEN                Char(4)    Pos(84);
     CLAMON1               Char(3)    Pos(88);
     LIMCRECTA1IMP         Char(17)   Pos(91);
     LIMCRECTAG1           Char(17)   Pos(108);
     IMPFPAGOA1            Char(17)   Pos(125);
     PORPAGOA1             Char(7)    Pos(142);
     LIMCRECOM1            Char(17)   Pos(149);
     LIMCRECOMG1           Char(17)   Pos(166);
     CLAMON2               Char(3)    Pos(183);
     LIMCRECTA2IMP         Char(17)   Pos(186);
     LIMCRECTAG2           Char(17)   Pos(203);
     IMPFPAGOA2            Char(17)   Pos(220);
     PORPAGOA2             Char(7)    Pos(237);
     LIMCRECOM2            Char(17)   Pos(244);
     LIMCRECOMG2           Char(17)   Pos(261);
     IBAN1                 Char(4)    Pos(278);
     CTACARGO1             Char(30)   Pos(282);
     CLAMONCON1            Char(3)    Pos(312);
     INDDOMCARCRE          Char(1)    Pos(315);
     CODFORMATO            Char(10)   Pos(316);
     IBANDOM1              Char(4)    Pos(326);
     CTADOMTAR1            Char(30)   Pos(330);
     MONCTATAR1            Char(3)    Pos(360);
     IBANDOM2              Char(4)    Pos(363);
     CTADOMTAR2            Char(30)   Pos(367);
     MONCTATAR2            Char(3)    Pos(397);
     INDACTLIMTAR          Char(1)    Pos(400);
     NUMPERTAR             Char(8)    Pos(401);
     CALPARTTAR            Char(2)    Pos(409);
     INDTIPTTAR            Char(2)    Pos(411);
     CODMARTAR             Char(2)    Pos(413);
     NOMBENREDTAR          Char(35)   Pos(415);
     IDEMPLEADOTAR         Char(20)   Pos(450);
     PANASOCTAR            Char(22)   Pos(470);
     CODBARRASTAR          Char(14)   Pos(492);
     REFFOTOTAR            Char(30)   Pos(506);
     ESTPLASTAR1           Char(40)   Pos(536);
     ESTPLASTAR2           Char(40)   Pos(576);
     INDENVESTTAR          Char(1)    Pos(616);
     CENTROESTTAR          Char(4)    Pos(617);
     INDENVPINTAR          Char(1)    Pos(621);
     CENTROPINTAR          Char(4)    Pos(622);
     INDESTTAROL           Char(1)    Pos(626);
     INDIMPPINOL           Char(1)    Pos(627);
     CONDESTTAR            Char(3)    Pos(628);
     CODPROMOTAR           Char(3)    Pos(631);
     CLAMON1TAR            Char(3)    Pos(634);
     LIMDIACAJ1TAR         Char(17)   Pos(637);
     MAXDIACAJ1TAR         Char(6)    Pos(654);
     CLAMON2TAR            Char(3)    Pos(660);
     LIMDIACAJ2TAR         Char(17)   Pos(663);
     MAXDIACAJ2TAR         Char(6)    Pos(680);
     CUENTA                Char(12)   Pos(686);
     DESCLAMON             Char(20)   Pos(698);
     FECALTA               Char(10)   Pos(718);
     PANTAR                Char(22)   Pos(728);
     FECALTATAR            Char(10)   Pos(750);
     FECCADTAR             Char(6)    Pos(760);
     DESMARRED             Char(10)   Pos(766);
     DESTIPTRED            Char(10)   Pos(776);
     INDSITTAR             Char(2)    Pos(786);
     CODUSO                Char(2)    Pos(788);
     NUMSEC                Char(12)   Pos(790);
     INDEXECUO             Char(1)    Pos(802);
     IBAN2                 Char(4)    Pos(803);
     CTACARGO2             Char(30)   Pos(807);
     CLAMONCON2            Char(3)    Pos(837);
     INDDOMCARCRE2         Char(1)    Pos(840);
     INDTAREMV             Char(1)    Pos(841);
     CODPERFILEMV          Char(11)   Pos(842);
     INDLIMUNI             Char(1)    Pos(853);
     INDESTTAREXT          Char(1)    Pos(854);
   End-DS;        

   Dcl-DS wsclcldir        Len(360);
     NUMSEC_C              Char(3);
     TIPDIRECC             Char(2);
     DESTIPDIRECC          Char(30);
     TIPLOCAL_C            Char(2);
     CODPAISDIR            Char(3);
     CODREGION_C           Char(3);
     CODPROV_C             Char(2);
     DESPROV               Char(30);
     POBLACION_C           Char(35);
     TIPVIA_C              Char(2);
     NOMVIA_C              Char(40);
     NUMVIA_C              Char(6);
     EMPRESA_C             Char(3);
     CENTRO_C              Char(4);
     DEPARTAM_C            Char(4);
     EDIFICIO_C            Char(4);
     ESCALERA_C            Char(4);
     PISO_C                Char(4);
     PUERTA_C              Char(4);
     RESTODIR_C            Char(40);
     CODPOSTAL_C           Char(10);
     CODAPTCOR_C           Char(10);
     INDENVCOR_C           Char(1);
     CODICEGEO             Char(1);
     INDNORPOB             Char(1);
     INDNORVIA             Char(1);
     CODVIA                Char(6);
     CODMUNPIO             Char(3);
     CODENTCOL             Char(2);
     CODENTSIN             Char(2);
     CODNUCLEO             Char(2);
     FECALTA_C             Char(10);
     FECBAJA               Char(10);
     CONTCUR               Char(26);
     VIACOMP               Char(50);
   End-DS;        

   Dcl-DS *N;        
     WFechaW               Char(8)    Pos(1);
     aaaa1                 Char(4)    Pos(1);
     mm1                   Char(2)    Pos(5);
     dd1                   Char(2)    Pos(7);
   End-DS;        

   Dcl-DS *N;        
     WFechaWs2             Char(10)   Pos(1);
     DIA1                  Char(2)    Pos(1);
     gI1                   Char(1)    Pos(3) Inz('-');
     MES1                  Char(2)    Pos(4);
     gI2                   Char(1)    Pos(6) Inz('-');
     ANO1                  Char(4)    Pos(7);
   End-DS;        

   Dcl-DS *N;        
     WFechaWs              Char(10)   Pos(1);
     dd                    Char(2)    Pos(1);
     g1                    Char(1)    Pos(3) Inz('-');
     mm                    Char(2)    Pos(4);
     g2                    Char(1)    Pos(6) Inz('-');
     aaaa                  Char(4)    Pos(7);
   End-DS;        

   Dcl-DS *N;        
     WFechaSW              Char(4)    Pos(1);
     DIAC                  Char(2)    Pos(1);
     MESC                  Char(2)    Pos(3);
   End-DS;        

   Dcl-DS *N;        
     Wdatciu               Char(10)   Pos(1);
     wresto                Char(2)    Pos(1);
     wscodprov             Zoned(2:0) Pos(3);
     wscodregion           Zoned(3:0) Pos(5);
     wscodreg              Zoned(3:0) Pos(8);
   End-DS;        

   Dcl-PR existeClie       nteEnSat  extpgm('TDBSRV0032');
     CODENT                Char(4);
     OFICINA               Char(4);
     PTipoId               Char(03);
     PPNumeroId            Char(22);
     IDENCLI               Char(08);
     pp_reto               Char(3);
     pp_desc               Char(200);
   End-PR;        

   Dcl-PR ModificarT       arjeta  extpgm('TDBSRV0031');
     CODENT                Char(4);
     OFICINA               Char(4);
     PAN                   Char(22);
     pp_reto               Char(3);
     pp_desc               Char(200);
   End-PR;
                                                                           
                                                                           
   Dcl-PR SERVISDATAQN;
     PDtaInt               Char(3000);
     PDtaOut               Char(10000);
     pWebSer               Char(10);
     PTipoId               Char(3);
     PNumeroId             Char(17);
     PTarjeta              Char(16);
     PErr                  Char(1);
     Oficina               Char(4);
     Paginable             Char(4);
   End-PR;
                                                                           
   Dcl-S p$id              Char(22);
   Dcl-S pIDENCLI          Char(08);
   Dcl-S PDtaInt           Char(3000);
   Dcl-S pDtaOut           Char(10000);
   Dcl-S pWebSer           Char(10);
   Dcl-S pTipoId           Char(3);
   Dcl-S pNumeroId         Char(17);
   Dcl-S pTarjeta          Char(16);
   Dcl-S pErr              Char(1);
   Dcl-S Oficina           Char(4);
   Dcl-S Paginable         Char(4);
   Dcl-DS marcaTipo;
     w_marca               Zoned(2:00);
     w_tipo                Zoned(2:00);
   Dcl-PR extraerMarcaTipo Char(4);
     *N                    Char(22);
   End-PR;
    
   dcl-pi;
                                                                                
     dcl-s  $tipdoc    char(2);       2            
     C                   Parm                    $id              17            
     C                   Parm                    $codsis           3            
     C                   Parm                    $codpro           3            
     C                   Parm                    $pTarjeta        22            
     C                   Parm                    $Marca            2            
     C                   Parm                    $Tipo             2            
     C                   Parm                    $Nombre          35            
     C                   Parm                    fecha_Vence       6            
     C                   Parm                    error_ws                       
     C                   Parm                    deserr_ws                      
     C                   Parm                    Oficina                        
     C                   Parm                    Paginable                      
                                                                                
        cod_sis = %int($codsis);
        cod_pro = %int($codpro);
        PTarjeta = %SubSt($pTarjeta:4:16);
        vlr_cup = 0;
                                                                                
                                                                                
     CSR                 EndSr                                                  
   end-pi;
                                                                                
          chain(n) (%int($id)) climael01;                                       
          if not (%found(climael01));                                           
             c_numint = 0;                                                      
             c_nitcli = 0;                                                      
             c_tipcli = 0;                                                      
             c_tipdoc = 0;                                                      
             c_feccon = 0;                                                      
             c_fecing = 0;                                                      
             c_fecesc = 0;                                                      
             c_nomcl1 = *all' ';                                                
             c_ocupac = 0;                                                      
             c_numemp = 0;                                                      
             c_numsuc = 0;                                                      
             c_lugcon = 0;                                                      
             c_codsex = 0;                                                      
             c_lugcon = 0;                                                      
             c_asocor = 0;                                                      
             c_agcvin = 0;                                                      
          endif;                                                                
                                                                                
                                                                                
          chain(n) (%int($tipdoc):%int($id)) satcliente;                        
          if (%found(satcliente));                                              
             exsr @nombres;                                                     
             exsr @tipodocumento;                                               
             exsr @adalcon;                                                     
          else;                                                                 
             exsr @tipodocumento;                                               
             p$id =  %Trim(%EditC(%Dec($id:15:0):'Z'));                         
             CODENT  = '0069';                                                  
             existeClienteEnSat(CODENT     :                                    
                                OFICINA    :                                    
                                TIPDOCCLA  :                                    
                                p$id       :                                    
                                pIdencli   :                                    
                                pp_retorno :                                    
                                pp_descRetorno);                                
             If pIdencli > '00000000';                                          
                X_TIPOID   =  c_tipdoc;                                         
                X_NUMEROID =  %int($id);                                        
                X_NUMINT   =  c_numint;                                         
                X_IDENTCLI =  %dec(pIdencli:8:0);                               
                Write rCliente;                                                 
                exsr @nombres;                                                  
                exsr @adalcon;                                                  
             Else;                                                              
                exsr @clalper;                                                  
                if (ind_cli = 0);                                               
                   exsr @adalcon;                                               
                endif;                                                          
             EndIf;                                                             
                                                                                
                                                                                
                                                                                
          endif;                                                                
                                                                                
          *inlr = *on;                                                          
                                                                                
      //  @ADALCON : Creacion de contrato                                         
        begsr @adalcon;                                                         
                                                                                
          exsr @inf_adalcon;                                                    
                                                                                
          If  Producto     = '02' and SUBPRODU = '0020';                        
              IBANDOM1     = '0069';                                            
              CTADOMTAR1   = '006900000000000000000000000001';                  
              GRUPOCUO     = '05';                                              
              NOMBENREDTAR = $Nombre;                                           
              ESTPLASTAR1  = *Blanks;                                           
              ESTPLASTAR2  = *Blanks;                                           
              INDENVESTTAR = *Blanks;                                           
              CENTROESTTAR = *Blanks;                                           
              INDENVPINTAR = *Blanks;                                           
              CENTROPINTAR = *Blanks;                                           
              INDESTTAROL  = *Blanks;                                           
           //CONDESTTAR   = '020';                                              
          Endif;                                                                
          pDatos = ' ';                                                         
          pDatos =%trim(pDatos) + CODENT;                                       
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CENTALTA;                                     
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + PRODUCTO;                                     
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + SUBPRODU;                                     
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CONPROD;                                      
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODCONVEN;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODPROMO;                                     
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + NUMPER;                                       
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + NUMPERVAL;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDCTAEMP;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDNOMEMP;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + NOMBREEMP;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODREGIMEN;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + FORPAGO;                                      
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDSITCTA;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + GRUPOLIQ;                                     
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + GRUPOCUO;                                     
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + OFIVEN;                                       
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CLAMON1;                                      
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMCRECTA1IMP;                                
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMCRECTAG1;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + IMPFPAGOA1;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + PORPAGOA1;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMCRECOM1;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMCRECOMG1;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CLAMON2;                                      
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMCRECTA2IMP;                                
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMCRECTAG2;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + IMPFPAGOA2;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + PORPAGOA2;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMCRECOM2;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMCRECOMG2;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + IBAN1;                                        
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CTACARGO1;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CLAMONCON1;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDDOMCARCRE;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODFORMATO;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + IBANDOM1;                                     
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CTADOMTAR1;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + MONCTATAR1;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + IBANDOM2;                                     
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CTADOMTAR2;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + MONCTATAR2;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDACTLIMTAR;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + NUMPERTAR;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CALPARTTAR;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDTIPTTAR;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODMARTAR;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + NOMBENREDTAR;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + IDEMPLEADOTAR;                                
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + PANASOCTAR;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODBARRASTAR;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + REFFOTOTAR;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + ESTPLASTAR1;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + ESTPLASTAR2;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDENVESTTAR;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CENTROESTTAR;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDENVPINTAR;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CENTROPINTAR;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDESTTAROL;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDIMPPINOL;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CONDESTTAR;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODPROMOTAR;                                  
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CLAMON1TAR;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMDIACAJ1TAR;                                
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + MAXDIACAJ1TAR;                                
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CLAMON2TAR;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + LIMDIACAJ2TAR;                                
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + MAXDIACAJ2TAR;                                
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODUSO;                                       
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + NUMSEC;                                       
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDEXECUO;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + IBAN2;                                        
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CTACARGO2;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CLAMONCON2;                                   
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDTAREMV;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + CODPERFILEMV;                                 
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDLIMUNI;                                    
          pDatos =%Trim(pDatos) + '$$' ;                                        
          pDatos =%trim(pDatos) + INDESTTAREXT;                                 
                                                                                
          PDtaInt = pDatos;                                                     
          pWebSer = 'ADALCON';                                                  
                                                                                
          doc_txt   = %xlate(' ':'0':%editc(c_nitcli:'3'));                     
                                                                                
          SERVISDATAQN(PDtaInt: pDtaOut : pWebSer : tipdoccla                   
                     : doc_txt : pTarjeta : pErr :Oficina :paginable);          
                                                                                
          error_ws = %subst(pDtaOut:1:7);                                       
          if (error_ws = 'ERRORWS');                                            
             pos1 = %scan('$':pDtaOut);                                         
             if pos1 = 0;                                                       
                pos1 = 104;                                                     
             else;                                                              
                pos1 = pos1 - 50;                                               
             endif;                                                             
             deserr_ws = %subst(pDtaOut:50:pos1);                               
          else;                                                                 
             wsadalcon = pDtaOut ;                                              
             Fecha_Vence = FECCADTAR;                                           
             $pTarjeta   = '000' + %Trim(PANTAR);                               
           // ModificarTarjeta(                                                 
           //      CODENT          :                                            
           //      OFICINA         :                                            
           //      PANTAR          :                                            
           //      pp_retorno      :                                            
           //      pp_descRetorno                                               
           //  );                                                               
          endif;                                                                
                                                                                
          parmws = ' ';                                                         
          parmws =%trim(parmws) + CODENT;                                       
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CENTALTA;                                     
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + PRODUCTO;                                     
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + SUBPRODU;                                     
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CONPROD;                                      
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODCONVEN;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODPROMO;                                     
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + NUMPER;                                       
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + NUMPERVAL;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDCTAEMP;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDNOMEMP;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + NOMBREEMP;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODREGIMEN;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + FORPAGO;                                      
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDSITCTA;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + GRUPOLIQ;                                     
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + GRUPOCUO;                                     
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + OFIVEN;                                       
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CLAMON1;                                      
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMCRECTA1IMP;                                
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMCRECTAG1;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + IMPFPAGOA1;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + PORPAGOA1;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMCRECOM1;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMCRECOMG1;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CLAMON2;                                      
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMCRECTA2IMP;                                
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMCRECTAG2;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + IMPFPAGOA2;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + PORPAGOA2;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMCRECOM2;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMCRECOMG2;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + IBAN1;                                        
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CTACARGO1;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CLAMONCON1;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDDOMCARCRE;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODFORMATO;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + IBANDOM1;                                     
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CTADOMTAR1;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + MONCTATAR1;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + IBANDOM2;                                     
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CTADOMTAR2;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + MONCTATAR2;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDACTLIMTAR;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + NUMPERTAR;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CALPARTTAR;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDTIPTTAR;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODMARTAR;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + NOMBENREDTAR;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + IDEMPLEADOTAR;                                
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + PANASOCTAR;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODBARRASTAR;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + REFFOTOTAR;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + ESTPLASTAR1;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + ESTPLASTAR2;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDENVESTTAR;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CENTROESTTAR;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDENVPINTAR;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CENTROPINTAR;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDESTTAROL;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDIMPPINOL;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CONDESTTAR;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODPROMOTAR;                                  
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CLAMON1TAR;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMDIACAJ1TAR;                                
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + MAXDIACAJ1TAR;                                
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CLAMON2TAR;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + LIMDIACAJ2TAR;                                
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + MAXDIACAJ2TAR;                                
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODUSO;                                       
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + NUMSEC;                                       
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDEXECUO;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + IBAN2;                                        
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CTACARGO2;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CLAMONCON2;                                   
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDTAREMV;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + CODPERFILEMV;                                 
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDLIMUNI;                                    
          parmws =%Trim(parmws) + ';'  ;                                        
          parmws =%trim(parmws) + INDESTTAREXT;                                 
                                                                                
          nom_ser = 'ADALCON';                                                  
          exsr grabar_respta;                                                   
                                                                                
        endsr;                                                                  
      /end-free                                                                 
      *----------------------------------------------------------------****     
      * @CLALPER : Creacion de clientes                                         
      /free                                                                     
        begsr @clalper;                                                         
                                                                                
              pWebSer  = 'CLALPER';                                             
                                                                                
              ExSr @direcciones;                                                
              ExSr @infcliente;                                                 
                                                                                
              nombrecer = %xlate('�':'N':nombrecer);                            
              apelli1er = %xlate('�':'N':apelli1er);                            
              NOMLARGOR = %xlate('�':'N':NOMLARGOR);                            
              APELLI2ER = %xlate('�':'N':APELLI2ER);                            
              APELARGOR = %xlate('�':'N':APELARGOR);                            
                                                                                
       pDatos = ' ';                                                            
       pDatos =%trim(pDatos) + codent;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + tipdoccla;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + numdoc;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + Tipper;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + Tipclien;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       If  SUBTIPCLI = '  ';                                                    
           SUBTIPCLI  = 'C1';                                                   
       EndIf;                                                                   
       pDatos =%trim(pDatos) + subtipcli;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + codidioma;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + bloqueo;                                         
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + indrepos;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + nivsegcer;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + publicidad;                                      
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + indvipcer;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + tiplocal;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + %subst(%xlate(' ':'0':%editc(codpaisd:'3')):1:3);
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + %subst(%xlate(' ':'0':%editc(CODPROV:'3')):1:2); 
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) +%subst(%xlate(' ':'0':%editc(CODREGION:'3')):1:3);
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + poblacion;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + nombrecer;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + apelli1er;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CODPAISRES;                                      
       pDatos =%Trim(pDatos) + '$$' ;                                           
       If c_TipCli = 1;                                                         
          pDatos =%trim(pDatos) + '          ';                                 
       Else;                                                                    
          pDatos =%trim(pDatos) + WFECHAWS;                                     
       EndIf;                                                                   
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CODPROF;                                         
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CODPAISNAC;                                      
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + INDENVCOR;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CODAPTCOR;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPVIA;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       If c_TipCli = 1;                                                         
          If FECDOC = '00-00-0000';                                             
             pDatos =%trim(pDatos) + '          ';                              
          Else;                                                                 
             pDatos =%trim(pDatos) + FECDOC;                                    
          EndIf;                                                                
       Else;                                                                    
          pDatos =%trim(pDatos) + FECDOC;                                       
       EndIf;                                                                   
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + ESTPER;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       If WFECHAWS2 = '00-00-0000';                                             
          Eval WFECHAWS2 = '01-01-0001';                                        
       EndIf;                                                                   
       If c_TipCli = 1;                                                         
          pDatos =%trim(pDatos) + '          ';                                 
       Else;                                                                    
          pDatos =%trim(pDatos) + WFECHAWS2;                                    
       EndIf;                                                                   
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CNAE;                                            
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CODCIRBER;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CLAVEACCR;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + SITCLAVER;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + NOMLARGOR;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + APELLI2ER;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + APELARGOR;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos)+%subst(%xlate(' ':'0':%editc(CODPAISNCT:'3')):1:3);
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + SEXPER;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + INDESTCIV;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + REGECON;                                         
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + INDTRACOR;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + FECFELICITA;                                     
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPFELICITA;                                     
       pDatos =%Trim(pDatos) + '$$' ;                                           
       If c_TipCli = 1;                                                         
          pDatos =%trim(pDatos) + %SubSt(c_NomCli:1:40);                        
       Else;                                                                    
          pDatos =%trim(pDatos) + NOMCOR;                                       
       EndIf;                                                                   
       pDatos =%Trim(pDatos) + '$$' ;                                           
       If c_TipCli = 1;                                                         
          pDatos =%trim(pDatos) + %SubSt(c_NomCli:1:40);                        
       Else;                                                                    
          pDatos =%trim(pDatos) + RAZSOC;                                       
       EndIf;                                                                   
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + FORJUR;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       If FECCREA = '00-00-0000';                                               
          FECCREA = '01-01-0001';                                               
       Endif;                                                                   
       If c_TipCli = 1;                                                         
          If FECDOC = '00-00-0000';                                             
             pDatos =%trim(pDatos) + '          ';                              
          Else;                                                                 
             pDatos =%trim(pDatos) + FECCREA;                                   
          EndIf;                                                                
       Else;                                                                    
          pDatos =%trim(pDatos) + FECCREA;                                      
       EndIf;                                                                   
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + '170';                                           
       pDatos =%Trim(pDatos) + '$$' ;                                           
       If c_TipCli = 1;                                                         
          pDatos =%trim(pDatos) + '    ';                                       
       Else;                                                                    
          pDatos =%trim(pDatos) + %TRIM(%editc(CODACT:'3'));                    
       EndIf;                                                                   
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) +%subst(%xlate(' ':'0':%editc(NUMEMPLEA:'3')):1:7);
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) +%subst(%xlate(' ':'0':%editc(NUMSUCURS:'3')):1:6);
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + INDNIVIMP;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + GRUPBE;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + SECCIRBE;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPSECCIR;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CODSWIFT;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CODISIN;                                         
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + NOMVIA;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + NUMVIA;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + EDIFICIO;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + ESCALERA;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + PISOL;                                           
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + PUERTA;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + RESTODIR;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CODPOSTAL;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + EMPRESA;                                         
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CENTRO;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + DEPARTAM;                                        
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + REFPER;                                          
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPMEDIO1;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CARACTER1;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + DESCLAVE1;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPMEDIO2;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CARACTER2;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + DESCLAVE2;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPMEDIO3;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CARACTER3;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + DESCLAVE3;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPMEDIO4;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CARACTER4;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + DESCLAVE4;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPMEDIO5;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CARACTER5;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + DESCLAVE5;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + TIPMEDIO6;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + CARACTER6;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + DESCLAVE6;                                       
       pDatos =%Trim(pDatos) + '$$' ;                                           
       pDatos =%trim(pDatos) + OBSERVACION;                                     
                                                                                
       PDtaInt= pDatos;                                                         
                                                                                
              error_ws  = *all' ';                                              
              deserr_ws = *all' ';                                              
              doc_txt   = %xlate(' ':'0':%editc(c_nitcli:'3'));                 
                                                                                
              SERVISDATAQN(PDtaInt: pDtaOut : pWebSer : tipdoccla               
                 : doc_txt : pTarjeta : pErr :Oficina : paginable);             
                                                                                
              error_ws = %subst(pDtaOut:1:7);                                   
              if (error_ws = 'ERRORWS');                                        
                 pos1 = %scan('$':pDtaOut);                                     
                 if pos1 = 0;                                                   
                    pos1 = 104;                                                 
                 else;                                                          
                    pos1 = pos1 - 50;                                           
                 endif;                                                         
                 deserr_ws = %subst(pDtaOut:50:pos1);                           
              else;                                                             
                 wsclalper = pDtaOut ;                                          
              endif;                                                            
                                                                                
              x_NUMEROID = c_Nitcli;                                            
              x_TIPOID   = c_Tipdoc;                                            
              x_NUMINT   = c_numint;                                            
              if (IDENTCLI <> *blanks);                                         
                 x_identcli = %Dec(IDENTCLI:08:0);                              
                 Write  Rcliente;                                               
              endif;                                                            
                                                                                
       parmws = ' ';                                                            
       parmws =%trim(parmws)+ codent;                                           
       parmws =%Trim(parmws) + ';' ;                                            
       parmws =%trim(parmws)+ tipdoccla;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws) + numdoc;                                          
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ Tipper;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ Tipclien;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ subtipcli;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ codidioma;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ bloqueo;                                          
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ indrepos;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ nivsegcer;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ publicidad;                                       
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ indvipcer;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ tiplocal;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ %subst(%xlate(' ':'0':%editc(codpaisd:'3')):1:3); 
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+%subst(%xlate(' ':'0':%editc(CODPROV:'3')):1:2);   
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+%subst(%xlate(' ':'0':%editc(CODREGION:'3')):1:3); 
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ poblacion;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ nombrecer;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ apelli1er;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws) + CODPAISRES;                                      
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ WFechaWs;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CODPROF;                                          
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CODPAISNAC;                                       
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ INDENVCOR;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CODAPTCOR;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPVIA;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ FECDOC;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ ESTPER;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ WFECHAWS2;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CNAE;                                             
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CODCIRBER;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CLAVEACCR;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ SITCLAVER;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ NOMLARGOR;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ APELLI2ER;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ APELARGOR;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+%subst(%xlate(' ':'0':%editc(CODPAISNCT:'3')):1:3);
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ SEXPER;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ INDESTCIV;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ REGECON;                                          
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ INDTRACOR;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ FECFELICITA;                                      
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPFELICITA;                                      
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ NOMCOR;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ RAZSOC;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ FORJUR;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ FECCREA;                                          
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws) + CODPAISEMP;                                      
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ %TRIM(%editc(CODACT:'3'));                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+%subst(%xlate(' ':'0':%editc(NUMEMPLEA:'3')):1:7); 
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+%subst(%xlate(' ':'0':%editc(NUMSUCURS:'3')):1:6); 
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ INDNIVIMP;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ GRUPBE;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ SECCIRBE;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPSECCIR;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CODSWIFT;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CODISIN;                                          
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ NOMVIA;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ NUMVIA;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ EDIFICIO;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ ESCALERA;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ PISOL;                                            
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ PUERTA;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ RESTODIR;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CODPOSTAL;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ EMPRESA;                                          
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CENTRO;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ DEPARTAM;                                         
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ REFPER;                                           
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPMEDIO1;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CARACTER1;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ DESCLAVE1;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPMEDIO2;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CARACTER2;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ DESCLAVE2;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPMEDIO3;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CARACTER3;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ DESCLAVE3;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPMEDIO4;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CARACTER4;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ DESCLAVE4;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPMEDIO5;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CARACTER5;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ DESCLAVE5;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ TIPMEDIO6;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ CARACTER6;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ DESCLAVE6;                                        
       parmws =%Trim(parmws) + ';'  ;                                           
       parmws =%trim(parmws)+ OBSERVACION;                                      
                                                                                
              nom_ser = 'CLALPER';                                              
              exsr grabar_respta;                                               
                                                                                
        endsr;                                                                  
      /end-free                                                                 
      *----------------------------------------------------------------****     
      * @INF_ADALCON : Informacion para ADALCON                                 
      /free                                                                     
        begsr @inf_adalcon;                                                     
                                                                                
           CODENT        = '0069';                                              
           CODCONVEN     = *all' ';                                             
           CODPROMO      = *all' ';                                             
           NUMPERVAL     = *all' ';                                             
           INDCTAEMP     = '0';                                                 
           INDNOMEMP     = '0';                                                 
           CODREGIMEN    = '0';                                                 
           FORPAGO       = '00';                                                
           INDSITCTA     = '0';                                                 
           GRUPOCUO      = '01';                                                
           CLAMON1       = *all' ';                                             
           LIMCRECTAG1   = *all' ';                                             
           IMPFPAGOA1    = *all' ';                                             
           PORPAGOA1     = *all' ';                                             
           LIMCRECOM1    = *all' ';                                             
           LIMCRECOMG1   = *all' ';                                             
           CLAMON2       = *all' ';                                             
           LIMCRECTA2IMP = *all' ';                                             
           LIMCRECTAG2   = *all' ';                                             
           IMPFPAGOA2    = *all' ';                                             
           PORPAGOA2     = *all' ';                                             
           LIMCRECOM2    = *all' ';                                             
           LIMCRECOMG2   = *all' ';                                             
           IBAN1         = *all' ';                                             
           CTACARGO1     = *all' ';                                             
           CLAMONCON1    = *all' ';                                             
           INDDOMCARCRE  = *all' ';                                             
           CODFORMATO    = 'STD';                                               
           IBANDOM1      = '0069';                                              
           CTADOMTAR1    = '0069000000000000';                                  
           MONCTATAR1    = '170';                                               
           IBANDOM2      = *all' ';                                             
           CTADOMTAR2    = *all' ';                                             
           MONCTATAR2    = *all' ';                                             
           INDACTLIMTAR  = '3';                                                 
           NUMPERTAR     = %xlate(' ':'0':%editc(x_identcli:'3'));              
           CALPARTTAR    = 'TI';                                                
           IDEMPLEADOTAR = *all' ';                                             
           PANASOCTAR    = pTarjeta;                                            
           CODBARRASTAR  = *all' ';                                             
           REFFOTOTAR    = *all' ';                                             
           INDENVESTTAR  = 'S';                                                 
           INDENVPINTAR  = 'N';                                                 
           CENTROPINTAR  = *all' ';                                             
           INDESTTAROL   = 'N';                                                 
           INDIMPPINOL   = 'N';                                                 
           CODPROMOTAR   = *all' ';                                             
           CLAMON1TAR    = '170';                                               
           CLAMON2TAR    = *all' ';                                             
           LIMDIACAJ2TAR = *all' ';                                             
           MAXDIACAJ2TAR = *all' ';                                             
           CODUSO        = 'C1';                                                
           INDEXECUO     = '1';                                                 
           IBAN2         = *all' ';                                             
           CTACARGO2     = *all' ';                                             
           CLAMONCON2    = *all' ';                                             
           INDTAREMV     = '2';                                                 
           CODPERFILEMV  = *all' ';                                             
           INDLIMUNI     = 'N';                                                 
           INDESTTAREXT  = 'S';                                                 
           NUMPER        = %xlate(' ':'0':%editc(x_identcli:'3'));              
           NOMBREEMP     = *all' ';                                             
        // OFIVEN        = %trim(%editc(c_agcvin:'3'));                         
           OFIVEN        = Oficina;                                             
           LIMCRECTA1IMP = %trim(%editc(vlr_cup:'3'));                          
        // CENTALTA      = %subst(%xlate(' ':'0':%editc(c_agcvin:'3')):2:4);    
           CENTALTA      = Oficina;                                             
        // CENTROESTTAR  = %subst(%xlate(' ':'0':%editc(c_agcvin:'3')):2:4);    
           CENTROESTTAR  = Oficina;                                             
                                                                                
           NumeroTarjeta =%Subst($pTarjeta:4:16);                               
           If NumeroTarjeta  > *Blanks;                                         
              marcaTipo = extraerMarcaTipo(NumeroTarjeta);                      
           Else;                                                                
              w_MARCA = %Dec($Marca:2:0);                                       
              w_TIPO  = %Dec($Tipo:2:0);                                        
           EndIf;                                                               
           chain(n) (cod_sis:cod_pro) satcattar;                                
           if (%found);                                                         
              PRODUCTO   = d_CODPROSAT;                                         
              SUBPRODU   = d_CODSUBSAT;                                         
              INDTIPTTAR = %xlate(' ':'0':%editc(w_TIPO:'3'));                  
              CODMARTAR  = %xlate(' ':'0':%editc(w_MARCA:'3'));                 
           endif;                                                               
                                                                                
           chain (c_numint) clivincli1;                                         
           If %found(clivincli1);                                               
              Chain (82:tIPvIN) RPARAM;                                         
               If %Found(SaTParam);                                             
                  Conprod = t_USOFUTUR3;                                        
                Else;                                                           
                  Conprod = *Blanks;                                            
               EndIf;                                                           
           EndIf;                                                               
            //Por ser tarjeta debito va en blanco. (no obligatorio)             
            GRUPOLIQ = ' ';                                                     
            //Select;                                                           
            //When (c_asocor = 1);                                              
            //    GRUPOLIQ = '6';                                               
            // When (c_asocor = 2);                                             
            //    GRUPOLIQ = '2';                                               
            // When (c_asocor = 3);                                             
            //    GRUPOLIQ = '4';                                               
            //When (c_asocor = 4);                                              
            //    GRUPOLIQ = '1';                                               
            //When (c_asocor = 5);                                              
            //    GRUPOLIQ = '3';                                               
            //When (c_asocor = 6);                                              
            //    GRUPOLIQ = '5';                                               
            //EndSl;                                                            
           If   $Nombre = ' ';                                                  
           exsr @NomEstampa;                                                    
           Else;                                                                
              NOMBENREDTAR  = 'Nombre';                                         
           EndIf;                                                               
           ESTPLASTAR1 = %subst(%xlate(' ':'0':%editc(c_nitcli:'3')):6:12) +    
                         %subst(c_nomcli:1:25);                                 
                                                                                
           ESTPLASTAR2 = INDTIPTTAR + CODMARTAR +'001'+'00'+'001'+'00'+'00'+    
                         %subst(%xlate(' ':'0':%editc(c_nitcli:'3')):6:12) +    
                         %subst(%xlate(' ':'0':%editc(c_fecing:'3')):5:2) +'-'+ 
                         %subst(%xlate(' ':'0':%editc(c_fecing:'3')):3:2);      
           chain(n) (w_marca:w_tipo) satmartip;                                 
           If (%found(satmartip));                                              
              CONDESTTAR = e_CODESTAMP;                                         
              MAXDIACAJ1TAR = %trim(%editc(e_MAXDIACAJ:'3'));                   
              If (vlr_cup <= e_LIMDIACAJ);                                      
                 LIMDIACAJ1TAR = %trim(%editc(vlr_cup:'3'));                    
              Else;                                                             
                 LIMDIACAJ1TAR = %trim(%editc(e_LIMDIACAJ:'3'));                
              EndIf;                                                            
           EndIf;                                                               
                                                                                
           exsr @clcldir;                                                       
           NUMSEC = NUMSEC_C;                                                   
                                                                                
        endsr;                                                                  
      /end-free                                                                 
      *----------------------------------------------------------------****     
      * @CLCLDIR: Consulta de direcciones de un cliente                   - *   
      /free                                                                     
       BegSr @clcldir;                                                          
                                                                                
         pWebSer = 'CLCLDIR';                                                   
         pDtaOut = *blanks;                                                     
         pDatos  = *blanks;                                                     
                                                                                
         pDatos  =  CODENT;                                                     
         pDatos  = %Trim(pDatos) + '$$' ;                                       
         pDatos  = %trim(pDatos)  +                                             
                   %Subst(%xlate(' ':'0':%editc(x_identcli:'3')):1:8);          
         PDtaInt = pDatos;                                                      
                                                                                
         doc_txt   = %xlate(' ':'0':%editc(c_nitcli:'3'));                      
                                                                                
         SERVISDATAQN(PDtaInt : pDtaOut : pWebSer : tipdoccla                   
               : doc_txt : pTarjeta : pErr  :Oficina : paginable);              
                                                                                
         Clear WSCLCLDIR;                                                       
                                                                                
         error_ws = %subst(pDtaOut:1:7);                                        
         if (error_ws = 'ERRORWS');                                             
            NUMSEC_C = '001';                                                   
         else;                                                                  
            WSCLCLDIR = pDtaOut;                                                
         endif;                                                                 
                                                                                
       EndSr;                                                                   
      /end-free                                                                 
      *----------------------------------------------------------------****     
      * @NOMESTAMPA : Nombre de estampacion                                     
      /free                                                                     
          begsr @NomEstampa;                                                    
                                                                                
              nombre120 = %trim(nombres) + ' ' + %trim(apellidos);              
                                                                                
              if (%len(%trim(nombre120)) > 25);                                 
                 nombre120 = %trim(nombres) + ' ' + %trim(apelli1er) + ' ' +    
                             %trim(%subst(apelli2er:1:1));                      
                 if (%len(%trim(nombre120)) > 25);                              
                     nombre120 = %trim(primernom)+' '+%subst(segundnom:1:1)+' '+
                                 %trim(apelli1er) + ' ' +                       
                                 %trim(%subst(apelli2er:1:1));                  
                    if (%len(%trim(nombre120)) > 25);                           
                       nombre120 = %trim(primernom) +' '+%subst(segundnom:1:1)  
                                   + ' ' + %trim(apelli1er);                    
                       if (%len(%trim(nombre120)) > 25);                        
                          NOMBENREDTAR = %trim(primernom)+' '+ %trim(apelli1er);
                       else;                                                    
                          NOMBENREDTAR = nombre120;                             
                       endif;                                                   
                    else;                                                       
                       NOMBENREDTAR = nombre120;                                
                    endif;                                                      
                 else;                                                          
                    NOMBENREDTAR = nombre120;                                   
                 endif;                                                         
              else;                                                             
                 NOMBENREDTAR = nombre120;                                      
              endif;                                                            
                                                                                
          endsr;                                                                
      /end-free                                                                 
      *----------------------------------------------------------------****     
      * @DIRECCIONES: Mover la informacion de las direcciones                   
     C     @direcciones  Begsr                                                  
                                                                                
     C     c_numint      SetLl     clidir                                       
     C     c_numint      ReadE     clidir                                       
     C                   Dow       Not %Eof(Clidir)                             
                                                                                
     C                   If        Reccor = 'S'                                 
                                                                                
     c                   eval      Wdatciu = '0000000000'                       
     c                   If        CODCIU > 0                                   
     c                   eval      Wdatciu =%subst(%xlate(' ':                  
     c                             '0':%editc(CODCIU:'3')):1:10)                
     c                   Else                                                   
      /Free                                                                     
       Exec Sql                                                                 
       Select CodCiu Into :CodCiu :IndNull                                      
       From   FinCliDat/CliDir                                                  
       Where  NumInt = :NumInt                                                  
              And CodCiu > 0                                                    
       Fetch First 1 Rows Only;                                                 
       If CODCIU > 0;                                                           
          Wdatciu =%subst(%xlate(' ':'0':%editc(CODCIU:'3')):1:10);             
       EndIf;                                                                   
      /End-Free                                                                 
     c                   EndIf                                                  
     c                   eval      codprov  = wscodprov                         
     c                   eval      Codregion = wscodregion                      
     c                   eval      direc120 = %trim(nomdir) + ' ' +             
     c                                        %trim(demail)                     
     c                   eval      nomvia = %subst(direc120:1:40)               
     c                   eval      restodir = %subst(direc120:41:40)            
     c                   eval      codpostal = '0000000000'                     
     c                   If        codciu > 0                                   
     c                   eval      codpostal = %subst(%xlate(' ':'0':%editc(    
     c                                         codciu:'3')):3:5)                
     c                   endif                                                  
     c                   endif                                                  
                                                                                
      /free                                                                     
                         if        tipubi = 'RE';                               
                                   chain(n) (c_lugcon) cliciudal1;              
                                   if (%found);                                 
                                       chain(n) (a_codpai) mppaises;            
                                       if (%found);                             
                                          CODPAISRES = %trim(%editc(b_CODNRCO   
                                                        :'3'));                 
                                       else;                                    
                                          CODPAISRES = '170';                   
                                       endif;                                   
                                    else;                                       
                                       CODPAISRES = '170';                      
                                    endif;                                      
                         endif;                                                 
                                                                                
                         if        tipubi = 'CEL' and nomdir <> *blanks;        
                                   tipmedio1 = 'MO';                            
                                   caracter1 = '1';                             
                                   desclave1 = nomdir;                          
                         endif;                                                 
                                                                                
                         if        tipubi = 'TEL1' and nomdir <> *blanks;       
                                   tipmedio2 = 'TE';                            
                                   caracter2 = '1';                             
                                   desclave2 = nomdir;                          
                         endif;                                                 
                                                                                
                         if        tipubi = 'TEL2' and nomdir <> *blanks;       
                                   tipmedio3 = 'TE';                            
                                   caracter3 = '2';                             
                                   desclave3 = nomdir;                          
                         endif;                                                 
                                                                                
                         if        tipubi = 'TEL3' and nomdir <> *blanks;       
                                   tipmedio4 = 'TE';                            
                                   caracter4 = '1';                             
                                   desclave4 = nomdir;                          
                         endif;                                                 
                                                                                
                         if        tipubi = 'DIN' and nomdir <> *blanks;        
                                   tipmedio5 = 'EM';                            
                                   caracter5 = '1';                             
                                   desclave5 = nomdir;                          
                         endif;                                                 
                                                                                
        // Mover el tipo de via                                                 
                                                                                
        If (Reccor = 'S');                                                      
                                                                                
           select;                                                              
                                                                                
           when (%scan('CLE'  :nomdir) > 0 or %scan('CL'   :nomdir) > 0 or      
                 %scan('Cll'  :nomdir) > 0 or %scan('Calle':nomdir) > 0 or      
                 %scan('cl'   :nomdir) > 0 or %scan('CLL'  :nomdir) > 0 or      
                 %scan('CALL' :nomdir) > 0 or %scan('calle':nomdir) > 0 or      
                 %scan('CALLE':nomdir) > 0 or %scan('Cl'   :nomdir) > 0 or      
                 %scan('CAllE':nomdir) > 0);                                    
                 TIPVIA = 'CL';                                                 
                                                                                
           when (%scan('CRA'    :nomdir) > 0 or %scan('KRA'    :nomdir) > 0 or  
                 %scan('CARRERA':nomdir) > 0 or %scan('kr'     :nomdir) > 0 or  
                 %scan('CR'     :nomdir) > 0 or %scan('kra'    :nomdir) > 0 or  
                 %scan('cr'     :nomdir) > 0 or %scan('Cr'     :nomdir) > 0 or  
                 %scan('CARERA' :nomdir) > 0 or %scan('CARR'   :nomdir) > 0 or  
                 %scan('CAllE'  :nomdir) > 0 or %scan('carrera':nomdir) > 0 or  
                 %scan('Carrera':nomdir) > 0);                                  
                 TIPVIA = 'CA';                                                 
                                                                                
           when (%scan('AV':nomdir) > 0 or %scan('av':nomdir) > 0);             
                 TIPVIA = 'AV';                                                 
                                                                                
           when (%scan('DIAG'    :nomdir) > 0 or %scan('DIAGONAL':nomdir) > 0 or
                 %scan('diagonal':nomdir) > 0 or %scan('Dig'     :nomdir) > 0 or
                 %scan('DG'      :nomdir) > 0 or %scan('DIA'     :nomdir) > 0 or
                 %scan('DIG'     :nomdir) > 0);                                 
                 TIPVIA = 'DG';                                                 
                                                                                
           when (%scan('TRANSVERSAL':nomdir) > 0 or %scan('TRV'  :nomdir) > 0 or
                 %scan('transversal':nomdir) > 0 or %scan('trans':nomdir) > 0 or
                 %scan('transv'     :nomdir) > 0 or %scan('trv'  :nomdir) > 0 or
                 %scan('tranv'      :nomdir) > 0 or %scan('TR'   :nomdir) > 0 or
                 %scan('TRANS'      :nomdir) > 0 or %scan('TRASV':nomdir) > 0 or
                 %scan('TRN'        :nomdir) > 0 or %scan('TV'   :nomdir) > 0); 
                 TIPVIA = 'TR';                                                 
                                                                                
           endsl;                                                               
                                                                                
        endif;                                                                  
                                                                                
      /end-free                                                                 
                                                                                
     C     c_numint      ReadE     clidir                                       
     C                   EndDo                                                  
                                                                                
     c                   if        (codprov = 0)                                
     c                   eval      codprov  = 11                                
     c                   eval      Codregion = 001                              
     c                   endif                                                  
                                                                                
     c                   if        (codpostal = *blanks)                        
     c                   eval       codpostal = '11001'                         
     c                   endif                                                  
                                                                                
     c                   if        (TIPVIA = '  ')                              
     c                   eval      TIPVIA = 'CL'                                
     c                   endif                                                  
                                                                                
     c                   endsr                                                  
      *----------------------------------------------------------------****     
      * @INFCLIENTE: Mover informacion del cliente                              
      /free                                                                     
              BegSr @infcliente;                                                
                                                                                
              chain c_nitcli srhemplea ;                                        
              If %found ;                                                       
                eval TIPCLIEN = '02'  ;                                         
              Else                  ;                                           
                Eval TIPCLIEN = '01' ;                                          
              EndIf;                                                            
                                                                                
              chain c_numint clivincli1 ;                                       
              If %found ;                                                       
                 If        (TIPCLIEN ='01')         ;                           
                   Select                         ;                             
                      When      Tipvin = 2          ;                           
                        Eval      Subtipcli   = 'C1'   ;                        
                      When      Tipvin = 1          ;                           
                        Eval      Subtipcli   = 'C2'   ;                        
                      When      Tipvin = 3          ;                           
                        Eval      Subtipcli   = 'C2'   ;                        
                    EndSl                          ;                            
                 Else                           ;                               
                   Select                         ;                             
                      When      Tipvin = 2          ;                           
                        Eval      Subtipcli   = 'E1'   ;                        
                      When      Tipvin = 1          ;                           
                        Eval      Subtipcli   = 'E2'   ;                        
                      When      Tipvin = 3          ;                           
                        Eval      Subtipcli   = 'E2'   ;                        
                   EndSl                          ;                             
                 EndIf                          ;                               
                 Else                           ;                               
                        Eval      Subtipcli   = 'C1'   ;                        
              EndIf;                                                            
                                                                                
              exsr @tipodocumento;                                              
                                                                                
              If (c_CODSEX = 1 )   ;                                            
                 SEXPER = 'V';                                                  
              Else               ;                                              
                 SEXPER = 'M';                                                  
              EndIf;                                                            
                                                                                
              If ( c_tipcli = 1 )   ;                                           
                 CNAE = '09999';                                                
                 CODPAISRES = '   '  ;                                          
                 regecon     = '1'   ;                                          
                 INDESTCIV   = '0'   ;                                          
              Else;                                                             
                 CNAE   = '  '             ;                                    
                 INDESTCIV   = '9'   ;                                          
                 regecon     = ' '   ;                                          
              EndIf;                                                            
                                                                                
              fec_ing = c_fecing;                                               
              If ( c_tipcli = 1 )   ;                                           
                eval Tipper = 'J';                                              
              Else               ;                                              
               If ( c_tipcli = 2 ) ;                                            
                  Tipper = 'F' ;                                                
                  ExSr  Llenarfechaws;                                          
               EndIf;                                                           
              EndIf;                                                            
                                                                                
              CODENT     =  '0069'      ;                                       
              NUMDOC     =  %trim(%editc(c_nitcli:'3'));                        
              CODIDIOMA  =  'ES'        ;                                       
              TIPFELICITA=  '1'         ;                                       
              ESTPER     =  'A'         ;                                       
              BLOQUEO    =  'N'         ;                                       
              INDREPOS   =  'N'         ;                                       
              NIVSEGCER  =  '0'         ;                                       
              PUBLICIDAD =  'N'         ;                                       
              INDVIPCER  =  'N'         ;                                       
              TIPLOCAL   =  'DP'        ;                                       
              codpaisd   =  170         ;                                       
              POBLACION  = '0'          ;                                       
              CODPAISNAC = '170'        ;                                       
              CODPAISEMP =  '  '        ;                                       
              CODPROF    =  '799'       ;                                       
              INDENVCOR  =  'S'         ;                                       
              CODAPTCOR  =  *all' '     ;                                       
              CODCIRBER  =  *all' '     ;                                       
              CLAVEACCR  =  *all' '     ;                                       
              SITCLAVER  =  *all' '     ;                                       
              APELARGOR  =  *all' '     ;                                       
              INDTRACOR  =  *all' '     ;                                       
              NOMCOR     =  *all' '     ;                                       
              RAZSOC     =  *all' '     ;                                       
              FORJUR     =  *all' '     ;                                       
              INDNIVIMP  =  *all' '     ;                                       
              GRUPBE     =  *all' '     ;                                       
              SECCIRBE   =  *all' '     ;                                       
              TIPSECCIR  =  *all' '     ;                                       
              CODSWIFT   =  *all' '     ;                                       
              CODISIN    =  *all' '     ;                                       
              NUMVIA     =  *all' '     ;                                       
              EDIFICIO   =  *all' '     ;                                       
              ESCALERA   =  *all' '     ;                                       
              PISOL      =  *all' '     ;                                       
              PUERTA     =  *all' '     ;                                       
              EMPRESA    =  *all' '     ;                                       
              CENTRO     =  *all' '     ;                                       
              DEPARTAM   =  *all' '     ;                                       
              REFPER     =  *all' '     ;                                       
              TIPMEDIO6  =  *all' '     ;                                       
              CARACTER6  =  *all' '     ;                                       
              DESCLAVE6  =  *all' '     ;                                       
              OBSERVACION=  *all' '     ;                                       
                                                                                
              exsr @nombres;                                                    
                                                                                
              fecdoc = %subst(%xlate(' ':'0':%editc(c_fecesc:'3')):7:2) + '-' + 
                       %subst(%xlate(' ':'0':%editc(c_fecesc:'3')):5:2) + '-' + 
                       %subst(%xlate(' ':'0':%editc(c_fecesc:'3')):1:4);        
                                                                                
              feccrea = %subst(%xlate(' ':'0':%editc(c_fecing:'3')):7:2) + '-' +
                        %subst(%xlate(' ':'0':%editc(c_fecing:'3')):5:2) + '-' +
                        %subst(%xlate(' ':'0':%editc(c_fecing:'3')):1:4);       
                                                                                
              codact  = c_ocupac;                                               
              NUMEMPLEA = c_numemp;                                             
              NUMSUCURS = c_numsuc;                                             
                                                                                
              FECFELICITA= %subst(%xlate(' ':'0':%editc(c_feccon:'3')):7:2) +   
                           %subst(%xlate(' ':'0':%editc(c_feccon:'3')):5:2);    
                                                                                
              chain(n) (c_lugcon) cliciudal1;                                   
              if (%found);                                                      
                 chain(n) (a_codpai) mppaises;                                  
                 if (%found);                                                   
                    CODPAISNCT = b_CODNRCO;                                     
                 else;                                                          
                    CODPAISNCT = 170;                                           
                 endif;                                                         
              else;                                                             
                 CODPAISNCT = 170;                                              
              endif;                                                            
                                                                                
              EndSr  ;                                                          
      /end-free                                                                 
      *----------------------------------------------------------------****     
      * @TIPODOCUMENTO: Mover el tipo de documento                              
      /free                                                                     
           begsr @tipodocumento;                                                
                                                                                
              Select                         ;                                  
              when c_tipcli = 1 and c_tipdoc = 3;                               
                   tipdoccla = 'NIT';                                           
              when c_tipcli = 1 and c_tipdoc = 7;                               
                   tipdoccla = 'SE';                                            
              when c_tipcli = 1 and c_tipdoc = 8;                               
                   tipdoccla = 'FID';                                           
              when c_tipcli = 1 and c_tipdoc = 9;                               
                   tipdoccla = 'NEU';                                           
              when c_tipcli = 2 and c_tipdoc = 1;                               
                   tipdoccla = 'CC';                                            
              when c_tipcli = 2 and c_tipdoc = 2;                               
                   tipdoccla = 'CE';                                            
              when c_tipcli = 2 and c_tipdoc = 3;                               
                   tipdoccla = 'NIT';                                           
              when c_tipcli = 2 and c_tipdoc = 7;                               
                   tipdoccla = 'NIT';                                           
              when c_tipcli = 2 and c_tipdoc = 4;                               
                   tipdoccla = 'TI';                                            
              when c_tipcli = 2 and c_tipdoc = 5;                               
                   tipdoccla = 'PA';                                            
              when c_tipcli = 2 and c_tipdoc = 6;                               
                   tipdoccla = 'RC';                                            
              when c_tipcli = 2 and c_tipdoc = 8;                               
                   tipdoccla = 'NUI';                                           
              when c_tipcli = 2 and c_tipdoc = 9;                               
                   tipdoccla = 'CD';                                            
              Endsl             ;                                               
                                                                                
           EndSr  ;                                                             
                                                                                
      /end-free                                                                 
      *----------------------------------------------------------------****     
      * @NOMBRES : Mover los nombres y apellidos del cliente                    
      /free                                                                     
           begsr @nombres;                                                      
                                                                                
              Primernom = *all' ';                                              
              Segundnom = *all' ';                                              
              nombre80  = *all' ';                                              
              nombrecer = *all' ';                                              
              nomlargor = *all' ';                                              
              apelli1er = *all' ';                                              
              apelli2er = *all' ';                                              
              apellidos = *all' ';                                              
              nombres   = *all' ';                                              
                                                                                
              lon = (%scan('3':c_nomcl1) - %scan('2':c_nomcl1)) - 1;            
              if (lon > 0);                                                     
              Primernom = %subst(c_nomcl1:(%scan('2':c_nomcl1)+1):lon);         
              endif;                                                            
              lon = (%scan('4':c_nomcl1) - %scan('3':c_nomcl1)) - 1;            
              if (lon > 0);                                                     
              Segundnom = %subst(c_nomcl1:(%scan('3':c_nomcl1)+1):lon);         
              endif;                                                            
                                                                                
              nombre80 = %trim(primernom) + ' ' + %trim(segundnom);             
              nombrecer = %subst(nombre80: 1:40);                               
              nomlargor = %subst(nombre80:41:40);                               
                                                                                
              apelli1er = %subst(c_nomcl1:1:(%scan('1':c_nomcl1)-1));           
                                                                                
              lon = (%scan('2':c_nomcl1) - %scan('1':c_nomcl1)) - 1;            
              if (lon > 0);                                                     
              apelli2er = %subst(c_nomcl1:(%scan('1':c_nomcl1)+1):lon);         
              endif;                                                            
                                                                                
              apellidos = %trim(apelli1er) + ' ' + %trim(apelli2er);            
              nombres   = %trim(Primernom) + ' ' + %trim(segundnom);            
                                                                                
              EndSr  ;                                                          
      /end-free                                                                 
      *----------------------------------------------------------------****     
      * LLEBARFECHAWS : Mover las fechas                                        
     C     Llenarfechaws Begsr                                                  
     c                                                                          
     C                   Move      c_FECCON      WFechaW                        
     C                   If        c_FECCON = 0                                 
     C                   Move      '00010101'    WFechaW                        
     C                   EndIf                                                  
     C                   Move      aaaa1         aaaa                           
     C                   Move      mm1           mm                             
     C                   Move      dd1           dd                             
     C                   Move      MM1           MESC                           
     C                   Move      DD1           DIAC                           
     C                   Move      FEC_ING       WFechaW                        
     C                   Move      aaaa1         ANO1                           
     C                   Move      mm1           MES1                           
     C                   Move      dd1           DIA1                           
     c                   Endsr                                                  
      *----------------------------------------------------------------****     
      * GRABAR_RESPTA :  Grabar la respuesta de los servicios web               
      /free                                                                     
           begsr grabar_respta;                                                 
                                                                                
           if ((%subst(pDtaOut:1:7) = 'ERRORWS'));                              
                                                                                
              p_uuid      = %subst(pDtaOut:9:36);                               
              p_servicio  = nom_ser;                                            
              p_estado    = '1';  // Error                                      
              p_paso      = *all' ';                                            
              p_respuesta = %subst(pDtaOut:47:3);                               
              p_param     = parmws;                                             
              p_fecha     = %xlate(' ':'0':%editc(*year :'3')) + '-' +          
                            %xlate(' ':'0':%editc(*month:'3')) + '-' +          
                            %xlate(' ':'0':%editc(*day  :'3'));                 
                                                                                
              pos1 = %scan('$':pDtaOut);                                        
              if pos1 = 0;                                                      
                 pos1 = 104;                                                    
              else;                                                             
                 pos1 = pos1 - 50;                                              
              endif;                                                            
              p_descrws = %subst(pDtaOut:50:pos1);                              
                                                                                
              p_numeroid = %xlate(' ':'0':%editc(c_nitcli:'3'));                
              p_tipoid   = tipdoccla;                                           
              p_pan = *all' ';                                                  
                                                                                
              if (%scan('timeout':pDtaOut) > 0 or                               
                  %scan('TIMEOUT':pDtaOut) > 0);                                
                 p_tipoerr  = '1'; // Comunicacion                              
              else;                                                             
                 p_tipoerr  = '2'; // Datos                                     
              endif;                                                            
                                                                                
      /end-free                                                                 
     C                   call      'SATGRRESCL'                                 
     C                   parm                    p_uuid           36            
     C                   parm                    p_servicio       10            
     C                   parm                    p_tipoid          3            
     C                   parm                    p_numeroid       17            
     C                   parm                    p_pan            16            
     C                   parm                    p_estado          2            
     C                   parm                    p_paso          100            
     C                   parm                    p_tipoerr         2            
     C                   parm                    p_respuesta       3            
     C                   parm                    p_descrws       500            
     C                   parm                    p_param        2000            
     C                   parm                    p_fecha          10            
                                                                                
     c                   endif                                                  
                                                                                
     c                   endsr                                                  
 