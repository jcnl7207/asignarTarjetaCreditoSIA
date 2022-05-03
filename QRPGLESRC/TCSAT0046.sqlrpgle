**Free
  ctl-opt DFTACTGRP(*NO);
  Dcl-F SatCreLog Usage(*input: *output) Keyed;
  Dcl-F CliMaeL01 Usage(*Input) Keyed PreFix('C_');
  Dcl-DS $DsRcd  Extname('FINPLTDAT/PLTCTACUP');
  End-DS;
  Dcl-DS *N  PSDS;
    @pgma          Char(10)   Pos(1);
    @job           Char(10)   Pos(244);
    @user          Char(10)   Pos(254);
  End-DS;
  Dcl-S  $RcdNw       Char(1500);
  Dcl-S  $RcdOr                  Like($RcdNw);
  Dcl-S  wTipDoc     Char(2);
  Dcl-S  $tipdoc     Char(2);
  Dcl-S  $pTarjet    Char(19);
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
  Dcl-pr EscribirLog;
  End-Pr;
  Dcl-pr actualizarLog;
  End-Pr;
  Dcl-PR solicitarTarjeta  extpgm('TCSAT0045');
    $tipdoc        Char(2);
    $id            like($nit);
    $codsis        like(codsis);
    $codpro        like(codpro);
    $pTarjet       Char(19);
    $Marca         Char(2);
    $Tipo          Char(2);
    $Cupo          like($vlrcup);
    $Nombre        Char(35);
    error_ws       Char(7);
    deserr_w       Char(104);
    Oficina        Char(4);
    $UsrUac        like(UsrUac);
    p_TimeSatmp    timesTamp;
    TipoCliente    char(1);
  End-PR;
  dcl-pi *N;
    $Parm1 char(2500);
  end-pi;
  $Parm1a = $Parm1;
  if  $Evento = '1';
      $RcdNw = *blanks;
      IF $DesRcdNw>0 and $LenRcdNw>0;
        $RcdNw = %subst($AllParm1 :$DesRcdNw+1 :$LenRcdNw);
      endif;
      $DsRcd = $RcdNw;
      sw_existe = *Off;
      Exec Sql
        Select '1' Into :sw_existe :IndNull
        From FinCooDat/SatSisPro
        Where Sistema = :CODSIS and
              Producto = :CodPro;
      If Not sw_existe;
        Exec Sql
          Select '1' Into :sw_existe :IndNull
          From FinCooDat/SatSisProN
          Where Sistema = :CODSIS and
                Producto = :CodPro;
          If sw_existe;
            TipoCliente = '0';
          EndIf;
      Else;
        TipoCliente = '2';
      EndIf;
      If sw_existe;
        @Move01();
      EndIf;
  Endif;
  *InLr = *On;
  Return;
  dcl-proc @Move01;
    CHAIN NitCta CliMaeL01;
    wTipDoc = %xlate(' ':'0':%editc(c_tipdoc:'3'));
    p_TimesTamp = %TimeStamp();
    $Nit = c_NitCli;
    $VlrCup = VlrCup;
    EscribirLog();
    Oficina = '0001';
    // Monitor;
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
      actualizarLog();
    // on-error *all;
    //  error_ws    = '9999';
    //  deserr_ws   = 'Error al llamar programa TCSAT0045';
    //  EscribirLog();
    // endmon;
  end-proc;
  dcl-proc escribirLog;
    Oficina     = %Char(c_AGCVIN);
    Instante    = p_TimeStamp;
    tipdoc      = wTipDoc;
    id          = $Nit;
    pTarjeta    = $pTarjet;
    Marca       = $Marca;
    Tipo        = $Tipo;
    Cupo        = vlrcup;
    Nombre      = $Nombre;
    TipoCli     = TipoCliente;
    Usuario     = UsrUac;
    Write SATCRELOGR;
  end-proc;

   dcl-proc actualizarLog;
    Exec Sql
    Update fincoodat/SatCreLog 
      Set PTarjeta = :$pTarjet, deserr_ws = :deserr_ws 
    Where   Instante = :Instante
    With Nc;
  end-proc;
**end-free
