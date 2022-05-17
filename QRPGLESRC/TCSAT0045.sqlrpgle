      *****Juan Nieto***********************************************************
      * Programa. . . : SATCREPN
      * Descripcion . : Creacin de Cliente natural y contrato
      *                 al interior del aplicativo SAT
      *----------------------------------------------------------------****
      * CRTPGM PGM(XXXX/SATCREPN) BNDSRVPGM((FINCOOOBJ/SATWSR))
      *****************************************************************
     HBNDDIR('SATSERVIS') dftactgrp(*no) PgmInfo(*Pcml:*Module)
     FSatClienteIF a E           K DISK    PreFix(x_)
     FCliMaeL01 IF   E           K DISK    PreFix(C_)
     Fclidir    IF   E           K DISK
     FSRHEMPLEA IF   E           K DISK    prefix(s_)
     Fclivincli1IF   E           K DISK
     Fcliciudal1if   e           k Disk    prefix(a_)
     Fmppaises  if   e           k Disk    prefix(b_)
     Fsatcattar if   e           k Disk    prefix(d_)
     Fsatmartip if   e           k Disk    prefix(e_)
     Fsatparam  if   e           k Disk    prefix(t_)
     FSATADMCUP UF A E           K Disk    prefix(u_)
      *----------------------------------------------------------------****
     D SalirDelCiclo   s               n
     D ind_cli         s              1s 0
     DNIT2             s             17S 0 Inz(0)
     DCLIDES           s              5A
     Dfec_ing          S                   inz like(c_fecing)
     d IndNull         s              4b00
     d p_TimeSatmp     s               z
     D LON             s              3S 0 inz
     DpDatos           S            480A
     DNumeroTarjeta    S             22
     DPrimernom        S             40A
     Dsegundnom        S             40A
     Dnombre80         S             80A
     Derror_ws         S              7a
     Ddeserr_ws        S            104a
     dpos1             s              4s 0 inz
     dparmws           s           2000a   inz
     dnom_ser          s             10a   inz
     Ddirec120         S            120A
     Ddoc_txt          S             17A
     Dcod_sis          S              3s 0 inz
     Dcod_pro          S              3s 0 inz
     dnombre120        s            120a   inz
     Dapellidos        S             40A
     Dnombres          S             40A
     Dpp_retorno       S              3A
     Dpp_descRetorno   S            200A
     D$Cupo            S             13s02
     dw_$Cupo          S             13S02
     D                 DS
     DWsClalper                1   1733
     DCODENT                   1      4A
     DTIPDOCCLA                5      7A
     DNUMDOC                   8     29A
     DFECDOC                  30     39A
     DTIPPER                  40     40A
     DESTPER                  41     41A
     DFECESTCLA               42     51A
     DTIPCLIEN                52     53A
     DSUBTIPCLI               54     55A
     DCODIDIOMA               56     57A
     DBLOQUEO                 58     58A
     DINDREPOS                59     59A
     DCNAE                    60     64A
     DCODCIRBER               65     86A
     DCLAVEACCR               87    126A
     DSITCLAVER              127    128A
     DNIVSEGCER              129    129A
     DPUBLICIDAD             130    130A
     DINDVIPCER              131    131A
     DNOMBRECER              132    171A
     DNOMLARGOR              172    201A
     DAPELLI1ER              202    237A
     DAPELLI2ER              238    273A
     DAPELARGOR              274    323A
     DCODPAISNCT             324    326S 0
     DCODPAISNAC             327    329A
     DCODPAISRES             330    332A   Inz('170')
     DSEXPER                 333    333A
     DFECNAC                 334    343S 0
     DINDESTCIV              344    344A
     DREGECON                345    345A
     DINDTRACOR              346    347A
     DCODPROF                348    350A
     DFECFELICITA            351    354A
     DTIPFELICITA            355    355A
     DNOMCOR                 356    395A
     DRAZSOC                 396    495A
     DFORJUR                 496    503A
     DFECCREA                504    513A
     DCODPAISEMP             514    516A   Inz
     DCODACT                 517    520S 0 Inz(0)
     DNUMEMPLEA              521    527S 0 Inz(0)
     DNUMSUCURS              528    534S 0 Inz(0)
     DINDNIVIMP              535    536A
     DGRUPBE                 537    558A
     DSECCIRBE               559    559A
     DTIPSECCIR              560    560A
     DCODSWIFT               561    582A
     DCODISIN                583    604A
     DTIPLOCAL               605    606A
     Dcodpaisd               607    609S 0
     DCODREGION              610    612S 0
     DCODPROV                613    614S 0
     DPOBLACION              615    649A
     DTIPVIA                 650    651A
     DNOMVIA                 652    691A
     DNUMVIA                 692    697A
     DEDIFICIO               698    701A
     DESCALERA               702    705A
     DPISOL                  706    709A
     DPUERTA                 710    713A
     DRESTODIR               714    753A
     DCODPOSTAL              754    763A
     DCODAPTCOR              764    773A
     DEMPRESA                774    776A
     DCENTRO                 777    780A
     DDEPARTAM               781    784A
     DREFPER                 785    806A
     DINDENVCOR              807    807A
     DTIPMEDIO1              808    809A
     DCARACTER1              810    810A
     DDESCLAVE1              811    910A
     DTIPMEDIO2              911    912A
     DCARACTER2              913    913A
     DDESCLAVE2              914   1013A
     DTIPMEDIO3             1014   1015A
     DCARACTER3             1016   1016A
     DDESCLAVE3             1017   1116A
     DTIPMEDIO4             1117   1118A
     DCARACTER4             1119   1119A
     DDESCLAVE4             1120   1219A
     DTIPMEDIO5             1220   1221A
     DCARACTER5             1222   1222A
     DDESCLAVE5             1223   1322A
     DTIPMEDIO6             1323   1324A
     DCARACTER6             1325   1325A
     DDESCLAVE6             1326   1425A
     DOBSERVACION           1426   1725A
     DIDENTCLI              1726   1733A
     D                 DS
     DWsAdalcon                1    854
     DCODENT_A                 1      4A
     DCENTALTA                 5      8A
     DPRODUCTO                 9     10A
     DSUBPRODU                11     14A
     DCONPROD                 15     17A
     DCODCONVEN               18     21A
     DCODPROMO                22     24A
     DNUMPER                  25     32A
     DNUMPERVAL               33     40A
     DINDCTAEMP               41     41A
     DINDNOMEMP               42     42A
     DNOMBREEMP               43     72A
     DCODREGIMEN              73     76A
     DFORPAGO                 77     78A
     DINDSITCTA               79     79A
     DGRUPOLIQ                80     81A
     DGRUPOCUO                82     83A
     DOFIVEN                  84     87A
     DCLAMON1                 88     90A
     DLIMCRECTA1IMP           91    107A
     DLIMCRECTAG1            108    124A
     DIMPFPAGOA1             125    141A
     DPORPAGOA1              142    148A
     DLIMCRECOM1             149    165A
     DLIMCRECOMG1            166    182A
     DCLAMON2                183    185A
     DLIMCRECTA2IMP          186    202A
     DLIMCRECTAG2            203    219A
     DIMPFPAGOA2             220    236A
     DPORPAGOA2              237    243A
     DLIMCRECOM2             244    260A
     DLIMCRECOMG2            261    277A
     DIBAN1                  278    281A
     DCTACARGO1              282    311A
     DCLAMONCON1             312    314A
     DINDDOMCARCRE           315    315A
     DCODFORMATO             316    325A
     DIBANDOM1               326    329A
     DCTADOMTAR1             330    359A
     DMONCTATAR1             360    362A
     DIBANDOM2               363    366A
     DCTADOMTAR2             367    396A
     DMONCTATAR2             397    399A
     DINDACTLIMTAR           400    400A
     DNUMPERTAR              401    408A
     DCALPARTTAR             409    410A
     DINDTIPTTAR             411    412A
     DCODMARTAR              413    414A
     DNOMBENREDTAR           415    449A
     DIDEMPLEADOTAR          450    469A
     DPANASOCTAR             470    491A
     DCODBARRASTAR           492    505A
     DREFFOTOTAR             506    535A
     DESTPLASTAR1            536    575A
     DESTPLASTAR2            576    615A
     DINDENVESTTAR           616    616A
     DCENTROESTTAR           617    620A
     DINDENVPINTAR           621    621A
     DCENTROPINTAR           622    625A
     DINDESTTAROL            626    626A
     DINDIMPPINOL            627    627A
     DCONDESTTAR             628    630A
     DCODPROMOTAR            631    633A
     DCLAMON1TAR             634    636A
     DLIMDIACAJ1TAR          637    653A
     DMAXDIACAJ1TAR          654    659A
     DCLAMON2TAR             660    662A
     DLIMDIACAJ2TAR          663    679A
     DMAXDIACAJ2TAR          680    685A
     DCUENTA                 686    697A
     DDESCLAMON              698    717A
     DFECALTA                718    727A
     DPANTAR                 728    749A
     DFECALTATAR             750    759A
     DFECCADTAR              760    765A
     DDESMARRED              766    775A
     DDESTIPTRED             776    785A
     DINDSITTAR              786    787A
     DCODUSO                 788    789A
     DNUMSEC                 790    801A
     DINDEXECUO              802    802A
     DIBAN2                  803    806A
     DCTACARGO2              807    836A
     DCLAMONCON2             837    839A
     DINDDOMCARCRE2          840    840A
     DINDTAREMV              841    841A
     DCODPERFILEMV           842    852A
     DINDLIMUNI              853    853A
     DINDESTTAREXT           854    854A
     Dwsclcldir        DS           360
     DNUMSEC_C                        3
     DTIPDIRECC                       2
     DDESTIPDIRECC                   30
     DTIPLOCAL_C                      2
     DCODPAISDIR                      3
     DCODREGION_C                     3
     DCODPROV_C                       2
     DDESPROV                        30
     DPOBLACION_C                    35
     DTIPVIA_C                        2
     DNOMVIA_C                       40
     DNUMVIA_C                        6
     DEMPRESA_C                       3
     DCENTRO_C                        4
     DDEPARTAM_C                      4
     DEDIFICIO_C                      4
     DESCALERA_C                      4
     DPISO_C                          4
     DPUERTA_C                        4
     DRESTODIR_C                     40
     DCODPOSTAL_C                    10
     DCODAPTCOR_C                    10
     DINDENVCOR_C                     1
     DCODICEGEO                       1
     DINDNORPOB                       1
     DINDNORVIA                       1
     DCODVIA                          6
     DCODMUNPIO                       3
     DCODENTCOL                       2
     DCODENTSIN                       2
     DCODNUCLEO                       2
     dFECALTA_C                      10
     DFECBAJA                        10
     DCONTCUR                        26
     DVIACOMP                        50
     D                 DS
     DWFechaW                  1      8
     Daaaa1                    1      4A
     Dmm1                      5      6A
     Ddd1                      7      8A
     D                 DS
     DWFechaWs2                1     10
     DDIA1                     1      2A
     DgI1                      3      3A   Inz('-')
     DMES1                     4      5A
     DgI2                      6      6A   Inz('-')
     DANO1                     7     10A
     D                 DS
     DWFechaWs                 1     10
     Ddd                       1      2A
     Dg1                       3      3A   Inz('-')
     Dmm                       4      5A
     Dg2                       6      6A   Inz('-')
     Daaaa                     7     10A
     D                 DS
     DWFechaSW                 1      4
     DDIAC                     1      2A
     DMESC                     3      4A
     D                 DS
     DWdatciu                  1     10
     Dwresto                   1      2A
     Dwscodprov                3      4S 0
     Dwscodregion              5      7S 0
     Dwscodreg                 8     10S 0
     d existeClienteEnSat...
     d                 pr                  extpgm('TDBSRV0032')
     d CODENT                         4A
     d OFICINA                        4A
     d PTipoId                       03A
     d PPNumeroId                    22A
     d IDENCLI                       08A
     d pp_reto                        3A
     d pp_desc                      200A
     d ModificarTarjeta...
     d                 pr                  extpgm('TDBSRV0031')
     d CODENT                         4A
     d OFICINA                        4A
     d PAN                           22A
     d pp_reto                        3A
     d pp_desc                      200A
     d cambiarEstadoTarjeta...
     d                 pr                  extpgm('TDBSRV0021')
     d pp_entidad                     4A
     d pp_oficina                     4A
     d pp_CODBLQ                      2A
     d pp_INDBLQ                      1A
     d pp_TEXBLQ                     30A
     d pp_pan                        19A
     d pp_estado                      1A
     d pp_retorno                     3A
     d pp_descRetorno               200A
     d pp_entidad      S              4A
     d pp_oficina      S              4A
     d pp_CODBLQ       S              2A
     d pp_INDBLQ       S              1A
     d pp_TEXBLQ       S             30A
     d pp_pan          S             19A
     d pp_estado       S              1A
     D SERVISDATAQN    PR
     DPDtaInt                      3000A
     DPDtaOut                     10000A
     DpWebSer                        10A
     DPTipoId                         3A
     DPNumeroId                      17A
     DPTarjeta                       16A
     DPErr                            1A
     dOficina                         4A
     dPaginable                       4A
     dp$id             s             22A
     dpIDENCLI         s             08A
     DPDtaInt          S           3000A
     DpDtaOut          S          10000A
     DpWebSer          S             10A
     DpTipoId          S              3A
     DpNumeroId        S             17A
     DpTarjeta         S             16A
     DpErr             S              1A
     dOficina          s              4A
     dPaginable        s              4A
     dmarcaTipo        ds
     d w_marca                        2s00
     d w_tipo                         2s00
     d extraerMarcaTipo...
     d                 pr             4
     d                               22
      *----------------------------------------------------------------****
      /free
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
          Else;
             Oficina  = %subst(%EditC(c_AGCVIN:'X'):2:4);
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
      /end-free
      *----------------------------------------------------------------****
      * @ADALCON : Creacion de contrato
      /free
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
          $Nombre = NOMBENREDTAR;
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
            $pTarjeta   = '000' + %Trim(PANTAR);
            If tipoCliente = '2';
               pp_entidad     = codent;
               pp_oficina     = centalta;
               pp_CODBLQ      = '21';
               pp_INDBLQ      = ' ';
               pp_TEXBLQ      = 'Tarjeta Virtual';
               pp_pan         = PANTAR;
               pp_estado      = 'Z';
               pp_retorno     = '000';
               pp_descRetorno = ' ';
               cambiarEstadoTarjeta(pp_entidad  :
                                    pp_oficina  :
                                    pp_CODBLQ   :
                                    pp_INDBLQ   :
                                    pp_TEXBLQ   :
                                    pp_pan      :
                                    pp_estado   :
                                    pp_retorno  :
                                    pp_descRetorno);
            EndIf;
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
          u_NIT         = c_NitCli;
          u_IDBENEF     = c_NitCli;
         If PANTAR > ' ';
          u_NUMTAR      = %Dec(PANTAR:16:0);
         EndIf;
          u_VLRCUPO     = $Cupo;
          u_CENTALTA    = CENTALTA;
          u_CUENTA      = CUENTA;
          u_SISTEMA     = %Dec($CodSis:3:0);
          u_PRODUCTO    = %Dec($CodPro:3:0);
          u_ESTADOTAR   = 'V';
          u_MARCA       = %Dec(CODMARTAR:2:0);
          u_TIPO        = %Dec(INDTIPTTAR:2:0);
          u_DESPRODUC   = d_DESPROSAT;
          u_TIPOCONT    = 'TI';
          u_USUARIO     =  $UsrUac;
          u_FECHA       = %Dec(%Char(%Date():*ISO0):8:0);
          u_HORA        = %Dec(%Time());
          Write RADMCUP;
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
              nombrecer = %xlate('':'N':nombrecer);
              apelli1er = %xlate('':'N':apelli1er);
              NOMLARGOR = %xlate('':'N':NOMLARGOR);
              APELLI2ER = %xlate('':'N':APELLI2ER);
              APELARGOR = %xlate('':'N':APELARGOR);
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
                 ind_cli = 1;
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
           If TipoCliente = '2';
            INDCTAEMP     = '1';
           EndIf;
           INDNOMEMP     = TipoCliente;
           CODREGIMEN    = '0';
           FORPAGO       = '01';
           INDSITCTA     = '0';
           GRUPOCUO      = '01';
           CLAMON1       = '170';
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
           INDDOMCARCRE  = 'N';
           CODFORMATO    = 'STD';
           IBANDOM1      = *Blanks;
           CTADOMTAR1    = *Blanks;
           MONCTATAR1    = *Blanks;
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
           If TipoCliente = '0';
            INDENVESTTAR  = 'S';
           Else;
            INDENVESTTAR  = 'N';
           EndIf;
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
           INDEXECUO     = '2';
           IBAN2         = *all' ';
           CTACARGO2     = *all' ';
           CLAMONCON2    = *all' ';
           If TipoCliente = '2';
            INDTAREMV     = '0';
           Else;
            INDTAREMV     = '2';
           EndIf;
           CODPERFILEMV  = *all' ';
           INDLIMUNI     = 'N';
           INDESTTAREXT  = 'S';
           NUMPER        = %xlate(' ':'0':%editc(x_identcli:'3'));
           If TipoCliente = '2';
            NOMBREEMP     = c_NomCli;
           Else;
            NOMBREEMP     = *all' ';
           EndIf;
           if TipoCliente = '2';
               OFIVEN        = %trim(%editc(c_agcvin:'3'));
            Else;
               OFIVEN        = *Blanks;
            EndIf;
            if TipoCliente = '2';
                LIMCRECTA1IMP = '00000000000000100';
            Else;
                LIMCRECTA1IMP = %trim(%editc($Cupo:'3'));
            EndIf;
        // CENTALTA      = %subst(%xlate(' ':'0':%editc(c_agcvin:'3')):2:4);
           CENTALTA      = Oficina;
        // CENTROESTTAR  = %subst(%xlate(' ':'0':%editc(c_agcvin:'3')):2:4);
            if TipoCliente = '2';
                CENTROESTTAR = *Blanks;
            Else;
                CENTROESTTAR  = '0505';
            EndIf;
           If  cod_sis = 10 and cod_pro = 15;
               w_$Cupo = 1;
            Else;
               w_$Cupo = $Cupo;
            Endif;
           NumeroTarjeta =%Subst($pTarjeta:4:16);
           setll (cod_sis:cod_pro) rcattar;
           Dow Not %EOF(satcattar) and SalirDelCiclo = *Off;
               ReadE (cod_sis:cod_pro) rcattar;
               if Not %EOF;
                   If w_$Cupo >= d_VLRMINIMO and
                      w_$Cupo <= d_VLRMAXIMO;
                      PRODUCTO   = d_CODPROSAT;
                      SUBPRODU   = d_CODSUBSAT;
                      INDTIPTTAR = %xlate(' ':'0':%editc(d_TIPO:'3'));
                      CODMARTAR  = %xlate(' ':'0':%editc(d_MARCA:'3'));
                      SalirDelCiclo = *On;
                   EndIf;
               endif;
           EndDo;
           chain (c_numint) clivincli1;
           If %found(clivincli1);
              Chain (82:tIPvIN) RPARAM;
               If %Found(SaTParam);
                  Conprod = t_USOFUTUR3;
                Else;
                  Conprod = *Blanks;
               EndIf;
           EndIf;
            Select;
               When (c_asocor = 1);
                   GRUPOLIQ = '6';
                When (c_asocor = 2);
                   GRUPOLIQ = '2';
                When (c_asocor = 3);
                   GRUPOLIQ = '4';
               When (c_asocor = 4);
                   GRUPOLIQ = '1';
               When (c_asocor = 5);
                   GRUPOLIQ = '3';
               When (c_asocor = 6);
                   GRUPOLIQ = '5';
            EndSl;
           If TipoCliente = '0';
               exsr @NomEstampa;
           Else;
              NOMBENREDTAR  = *Blanks;
           EndIf;
           If TipoCliente = '0';
           // If c_NomEmp = *Blanks;
           ESTPLASTAR1 =
           %subst(%xlate(' ':'0':%editc(c_nitcli:'3')):6:12) +
                             %subst(c_nomcli:1:25);
           //else;
           // ESTPLASTAR1 =
           // %subst(%xlate(' ':'0':%editc(c_nitcli:'3')):6:12) +
           //                  %subst(c_nomemp:1:25);
           // EndIf;
            Else;
               //Juridico
            If c_NomEmp = *Blanks;
            ESTPLASTAR1 =
            %subst(%xlate(' ':'0':%editc(c_nitcli:'3')):6:12) +
                            %subst(c_nomcli:1:25);
            Else;
               ESTPLASTAR1 =
               %subst(%xlate(' ':'0':%editc(c_nitcli:'3')):6:12) +
                             %subst(c_nomemp:1:25);
            EndIf;
            EndIf;
           ESTPLASTAR2 = INDTIPTTAR + CODMARTAR +'001'+'00'+'001'+'00'+'00'+
                         %subst(%xlate(' ':'0':%editc(c_nitcli:'3')):6:12) +
                         %subst(%xlate(' ':'0':%editc(c_fecing:'3')):5:2) +'-'+
                         %subst(%xlate(' ':'0':%editc(c_fecing:'3')):3:2);
           chain(n) (d_marca:d_tipo) satmartip;
           If (%found(satmartip));
              CONDESTTAR = e_CODESTAMP;
              MAXDIACAJ1TAR = %trim(%editc(e_MAXDIACAJ:'3'));
              If TipoCliente = '0';
                  If ($Cupo <= e_LIMDIACAJ);
                     LIMDIACAJ1TAR = %trim(%editc($Cupo:'3'));
                  Else;
                     LIMDIACAJ1TAR = %trim(%editc(e_LIMDIACAJ:'3'));
                  EndIf;
               Else;
                  LIMDIACAJ1TAR = '1';
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
              If TipoCliente = '2';
                 CODPAISEMP =  '170';
                 Exec Sql
                 SELECT C.CODNRCO Into :CODPAISEMP :IndNull
                 FROM FINCLIDAT/CLIMAE A,
                      FINCLIDAT/CLICIUDAD B,
                      FINCOODAT/MPPAISES C
                  WHERE A.LUGCON = B.CODCIU AND B.CODPAI =
                        C.CODALFA AND A.NITCLI = :c_NitCli
                  FETCH FIRST 1 ROWS ONLY;
                  INDNIVIMP  =  '01';
                  Exec Sql
                  SELECT
                  Case When
                     B.NATEMP in (5, 7, 9) then '02'
                     Else '01'
                  End Into :INDNIVIMP :IndNull
                  FROM FINCLIDAT/CLIMAE A, FINCLIDAT/CLImaebco B
                  WHERE a.numint = b.numint AND NITCLI = :c_nitcli;
              Else;
               CODPAISEMP =  '  ';
               INDNIVIMP  =  '';
              EndIf;
              CODPROF    =  '799'       ;
              INDENVCOR  =  'S'         ;
              CODAPTCOR  =  *all' '     ;
              CODCIRBER  =  *all' '     ;
              CLAVEACCR  =  *all' '     ;
              SITCLAVER  =  *all' '     ;
              APELARGOR  =  *all' '     ;
              INDTRACOR  =  *all' '     ;
              If c_tipcli = 1;
                  NOMCOR     =  c_NomEmp;
                  CODPROF    =  '   ';
                  Select;
                     When c_TIPEMP = 4;
                        FORJUR     =  'SM';
                     When c_TIPEMP = 10;
                        FORJUR     =  'SA';
                     When c_TIPEMP = 23;
                        FORJUR     =  'SA';
                     When c_TIPEMP = 17;
                        FORJUR     =  'SL';
                     When c_TIPEMP = 21;
                        FORJUR     =  'SC';
                     When c_TIPEMP = 22;
                        FORJUR     =  'SC';
                     When c_TIPEMP = 24;
                        FORJUR     =  'SU';
                  EndSl;
              Else;
                  NOMCOR     =  *all' ';
                  CODPROF    =  '799';
                  FORJUR     =  *all' '     ;
              EndIf;
              RAZSOC     =  *all' '     ;
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
            If tipoCliente ='0';
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
            Else;
               apellidos = *Blanks;
               nombres   = *Blanks;
            Endif;
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
      *----------------------------------------------------------------****
      * INZSR : Subrutina inicial del programa
     CSR   *InzSr        BegSr
      * Define parametros de entrada
     C     *Entry        Plist
     C                   Parm                    $tipdoc           2
     C                   Parm                    $id              17
     C                   Parm                    $codsis           3
     C                   Parm                    $codpro           3
     C                   Parm                    $pTarjeta        22
     C                   Parm                    $Marca            2
     C                   Parm                    $Tipo             2
     C                   Parm                    $Cupo
     C                   Parm                    $Nombre          35
     C*                  Parm                    fecha_Vence       6
     C                   Parm                    error_ws
     C                   Parm                    deserr_ws
     C                   Parm                    Oficina
     C                   Parm                    $UsrUac          10
     C                   Parm                    p_TimeSatmp
     C                   Parm                    TipoCliente       1
     c                   eval      paginable = 'TRUE'
     c                   eval      cod_sis = %int($codsis)
     c                   eval      cod_pro = %int($codpro)
     c                   eval      PTarjeta = %SubSt($pTarjeta:4:16)
       ///Free
       //   Exec sql
       //  SELECT digits(dec(A.AGCORI, 4, 0)) Into :Oficina :IndNull
       //  FROM pltcaj a,
       //       pltcajero b
       //   WHERE A.CODCAJ = b.codcaj
       //         and A.AGCORI = B.AGCORI
       //         and a.codcaj = :$UsrUac;
       ///End-Free
     CSR                 EndSr
