**Free
  ctl-opt DFTACTGRP(*NO);

  Dcl-F SATCRELOG Usage(*Input: *output: *Update) Keyed;

  Dcl-S  wTipDoc     Char(2);
  Dcl-S  $tipdoc     Char(2);
  Dcl-S  $pTarjet    Char(19);
  Dcl-S  wBlanco     Char(19);
  Dcl-S  $Marca      Char(2);
  Dcl-S  $Tipo       Char(2);
  Dcl-S  $Nombre     Char(35);
  Dcl-S  fecha_Vence char(6);
  Dcl-S  error_ws    Char(7);
  Dcl-S  deserr_w    Char(104);
  Dcl-S  Oficina     Char(4);
  Dcl-S  Paginable   Char(4);
  Dcl-S  p_TimesTamp timesTamp;
  Dcl-s  SW_EXISTE   Ind; 
  dcl-s IndNull      BinDec(4:0); 
  dcl-s $Nit         zoned(17:0);
  dcl-s $VlrCup      zoned(13:2);
  dcl-s TipoCliente  char(1);

  Dcl-DS $Parm1a;
    $File          Char(10)   Pos(1);
    $Lib           Char(10)   Pos(11);
    $Mbr           Char(10)   Pos(21);
    $Evento        Char(1)    Pos(31);
    $TimeTrg       Char(1)    Pos(32);
    $Filler1       Char(3)    Pos(34);
    $CCSID         Bindec(9)  Pos(37);
    $RRN           Bindec(9)  Pos(41);
    $Filler2       Char(4)    Pos(45);
    $DesRcdOr      Bindec(9)  Pos(49);
    $LenRcdOr      Bindec(9)  Pos(53);
    $DesNulRcdOr   Bindec(9)  Pos(57);
    $LenCorNulOr   Bindec(9)  Pos(61);
    $DesRcdNw      Bindec(9)  Pos(65);
    $LenRcdNw      Bindec(9)  Pos(69);
    $DesNulRcdNw   Bindec(9)  Pos(73);
    $LenNulRcdNw   Bindec(9)  Pos(77);
    $Filler3       Char(16)   Pos(81);
    $AllParm1      Char(2500) Pos(1);
  End-Ds;
  
  Dcl-Ds *N  PSDS;
    @pgma          Char(10)   Pos(1);
    @job           Char(10)   Pos(244);
    @user          Char(10)   Pos(254);
  End-Ds;
  
  Dcl-pr EscribirLog;
  End-Pr;

  Dcl-PR solicitarTarjeta  extpgm('TCSAT0045');
    $tipdoc        Char(2);
    $id            like($nit);
    $codsis        like(codsis);
    $codpro        like(codpro);
    $pTarjet       Char(19);
    $Marca         Char(2);
    $Tipo          Char(2);
    $Cupo          zoned(13:2);
    $Nombre        Char(35);
    error_ws       Char(7);
    deserr_w       Char(104);
    Oficina        Char(4);
    UsrUac         Char(10); 
    p_TimeSatmp    timesTamp;
    TipoCliente    char(1);
  End-PR;

  Dow Not  %EOF(SATCRELOG1);
    wBlanco = *Blanks;
    ReadE wBlanco SATCRELOGR;
    If Not %EOF(SATCRELOG1);
        wTipDoc  =  TipDoc;         
        $Nit     =  Nit;          
        // CodSis              
        // CodPro             
        $pTarjet  = pTarjet;            
        $Marca    = Marca;         
        $Tipo     = Tipo;          
        $VlrCup   = Cupo;        
        $Nombre   = Nombre;        
        error_ws  = 0;         
        deserr_ws = *Blanks;          
        // Oficina
        $UsrUac    = @user;       
        p_TimesTamp  = %TimeStamp();       
        TipoCliente = TipoCli;
        solicitarTarjeta(wTipDoc            :   
                        $Nit                :
                        CodSis              : 
                        CodPro              :
                        $pTarjet            : 
                        $Marca              :
                        $Tipo               : 
                        $VlrCup             :
                        $Nombre             : 
                        error_ws            :
                        deserr_ws           : 
                        Oficina             :
                        UsrUac              :
                        p_TimesTamp         :
                        TipoCliente);
        If $pTarjet > *Blanks;
            PTARJETA = 'Creada despues de error por usuario ' + @user;
            Update SATCRELOGR;
            EscribirLog();
        EndIf;
    EndIf;
  EndDo;
  *InLr = *on;

  dcl-proc escribirLog;
    Instante    = %TimeStamp();
    tipdoc      = wTipDoc;   
    id          = $Nit;    
    pTarjeta    = $pTarjet;    
    Marca       = $Marca;      
    Tipo        = $Tipo;    
    Cupo        = vlrcup;      
    Nombre      = $Nombre;  
    Usuario     = UsrUac;
    Write SATCRELOGR;
  end-proc;

**end-free