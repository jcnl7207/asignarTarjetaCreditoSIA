**Free
  ctl-opt DftActGrp(*No);

  /Include FINRPG,SATDICCI     // Diccionario SAT.
  /Include FINRPG,CPYSRVSAT    // Servicio SAT.
  /Include FINRPG,TDBSRVDTAA   // Area de datos SAT.

 dcl-pr Bloquear_DesBloquear;
 end-pr;
 dcl-pr irHastaSat;
 end-pr;
 dcl-pr cancelarContrato extpgm('TDBSRV0018');
     pp_entidad         char(4);   // '0069'
     pp_oficina         char(4);   // '0001' o ...
     pp_cuenta          char(12);  // '000000002662' para ejemplo.
     pp_simulacancela   char(1);   // S=Simula, C=Cancela
 end-pr;
 dcl-pr consultarTarjeta;
 end-pr;

  // Parametros de entrada
 dcl-pi *N;
     pp_entidad         char(4);   // '0069'
     pp_oficina         char(4);   // '0001' o ...
     pp_CODBLQ          char(2);
     pp_INDBLQ          char(1);
     pp_TEXBLQ          char(30);
     pp_pan             char(19);
     pp_estado          char(1);
     pp_retorno         Zoned(03);
     pp_descRetorno     char(200);
 end-PI;

 dcl-s pp_simulacancela   char(1);

// Proceso Principal
  in *DTAARA;
  p_entidad                = pp_entidad;
  p_idioma                 = 'ES';
  p_oficina                = pp_oficina;
  p_paginable              = 'TRUE';
  p_tipoOperacion          = 'VIEW';

  If pp_estado                = 'C' or
     pp_estado                = 'F';
     consultarTarjeta();
     If retorno = 0;
        pp_simulacancela         = SimulaTransaccionAnulacion;
        cancelarContrato(pp_entidad        :
                         CENTALTA          :
                         CUENTA            :
                         pp_simulacancela  );
     EndIf;
  Else;
     Select;
        When pp_estado = 'G';
             pp_CODBLQ = '8';
             Bloquear_DesBloquear();
        When pp_estado = 'N';
             pp_CODBLQ = '0';
             Bloquear_DesBloquear();
        When pp_estado = 'T';
             pp_CODBLQ = '9';
             Bloquear_DesBloquear();
        When pp_estado = 'X';
             pp_CODBLQ = '11';
             Bloquear_DesBloquear();
        When pp_estado = 'Z';
             pp_CODBLQ = '20';
             Bloquear_DesBloquear(); 
        Other;
                 retorno     = 999;
                 descRetorno = 'Opción No Valida';
     EndSl;
  EndIf;
  pp_retorno       = retorno;
  pp_descRetorno   = descRetorno;
  *InLr=*On;

// * * * * * * * * * * * * * * * * * *

 dcl-proc  bloquear_DesBloquear;
  // Nombres
  p_transaccion            = 'TIMOBLO';
  p_Parametros_i(1).Nombre = 'CODENT';
  p_Parametros_i(2).Nombre = 'CENTALTA';
  p_Parametros_i(3).Nombre = 'PAN';
  p_Parametros_i(4).Nombre = 'CODBLQ';
  p_Parametros_i(5).Nombre = 'TEXBLQ';
  // Valores
  p_Parametros_i(1).Valor  = pp_entidad;
  p_Parametros_i(2).Valor  = pp_oficina;
  p_Parametros_i(3).Valor  = pp_PAN;
  p_Parametros_i(4).Valor  = pp_CODBLQ;
  p_Parametros_i(5).Valor  = pp_TEXBLQ;
  Ocurrencias_i            = 5;
  irHastaSAT();
 end-proc  bloquear_DesBloquear;

// * * * * * * * * * * * * * * * * * *

 dcl-proc  consultarTarjeta;
  p_transaccion            = 'TICOTAR';
  p_tipoOperacion          = 'SELECT';
  // Nombres
  p_Parametros_i(1).Nombre = 'CODENT';
  p_Parametros_i(2).Nombre = 'PAN';
  // Valores
  p_Parametros_i(1).Valor  = pp_entidad;  // '0069'
  p_Parametros_i(2).Valor  = pp_pan;      // '4195500000780979';
  Ocurrencias_i            = 2;
  irHastaSAT();
  If retorno = 0;
     CUENTA = %Trim(p_Parametros_o(
           %LOOKUP('CUENTA' : p_Parametros_o(*).Nombre)
           ).Valor);
     CENTALTA = %Trim(p_Parametros_o(
           %LOOKUP('CENTALTA' : p_Parametros_o(*).Nombre)
           ).Valor);
  EndIf;
 end-proc  consultarTarjeta;

// * * * * * * * * * * * * * * * * * *

 dcl-proc  irHastaSAT;
  llamarPrograma(p_entidad        :
                 p_idioma         :
                 p_oficina        :
                 p_paginable      :
                 p_transaccion    :
                 p_tipoOperacion  :
                 p_Parametros_i   :
                 Ocurrencias_i    :
                 p_Parametros_o   :
                 Ocurrencias_o    :
                 retorno          :
                 descRetorno      );
    If descRetorno = 'MPA2039 - TARJETA NO ESTABA BLOQUEADA';
       retorno      = 0;
       descRetorno  = ' ';
    EndIf;
 end-proc  irHastaSAT;

// * * * * * * * * * * * * * * * * * *
**End-Free
