     h Main(Principal) DftActGrp(*No)
     fCert8BVIL2uf   e           k disk    UsrOpn
     fCliMaeL01 if   e           k disk    UsrOpn
     fPAPPrestM1if   e           k disk    UsrOpn
     f                                     rename(RegPrest:b_RegPrest)
     fPAPPrestM if   e           k disk    UsrOpn
     fPAPPrestA if   e           k disk    rename(RegPrest:a_RegPrest)
     f                                     usrOpn

     d BusquedaMes     pr
     d BusquedaHis     pr
     d Principal       pr                  extpgm('CERT051')
     d AnoProceso                     4s00
     d NoLoEncontro    s               N
     d Salir           s               N
     d w_CEROPR        s                   like(CEROPR)
     p Principal       b
     d                 pi
     d AnoProceso                     4s00
      /Free
       If Not %OPen(Cert8BVIL2);
          Open Cert8BVIL2;
       EndIf;
       If Not %OPen(CliMaeL01);
          Open CliMaeL01;
       EndIf;
       If Not %OPen(PAPPrestM1);
          Open PAPPrestM1;
       EndIf;
       If Not %OPen(PAPPrestM);
          Open PAPPrestM;
       EndIf;
       If Not %OPen(PAPPrestA);
          Open PAPPrestA;
       EndIf;
       CerAno = AnoProceso;
       SetLL (CerAno:0) CertRegI;
       Dow Not %EOF(Cert8BVIL2);
           ReadE CerAno CertRegI;
           If Not %EOF(Cert8BVIL2);

              w_CEROPR = CEROPR;
              w_CEROPR = w_CEROPR/100;
              w_CEROPR = w_CEROPR * 100  + 99;
              SetGt (CERAGC:CERLIN:w_CEROPR) b_RegPrest;
              ReadP b_RegPrest;

              If Not %EOF(PAPPrestM1) And
                 CerLin = P01CDLIN And
                 CERAGC = P01AGE   And
                 P01NROPR  >= w_CEROPR - 99 And
                 P01NROPR  <= w_CEROPR;

                 CERSDO = P01SALDOKA;
                 If P01IABANT <> 0;
                    INDCAS = '1';
                 EndIf;
                 NoLoEncontro = *Off;
                 BusquedaMes();
                 If NoLoEncontro = *off;
                    If P01FECPFIR > 0;
                       CERFEC = P01FECPFIR;
                    EndIf;
                    If P01CAPENTR > 0;
                       CERKAP = P01CAPENTR;
                    EndIf;
                 EndIf;
                 Update CertRegI;
              Endif;
           EndIf;
       EndDo;
       If %OPen(Cert8BVIL2);
          Close Cert8BVIL2;
       EndIf;
       If %OPen(CliMaeL01);
          Close CliMaeL01;
       EndIf;
       If %OPen(PAPPrestM);
          Close PAPPrestM;
       EndIf;
       If %OPen(PAPPrestM1);
          Close PAPPrestM1;
       EndIf;
       If %OPen(PAPPrestA);
          Close PAPPrestA;
       EndIf;
      /End-Free
     p Principal       e

     p BusquedaMes     b
      /Free
       If (P01AGEANT > 0     And
          P01CDLINAN > 0    And
          P01NROPRAN > 0) And
          (P01AGEANT  <> P01AGE Or
           P01CDLINAN <> P01CDLIN Or
           P01NROPRAN <> P01NROPR);
          Chain (P01AGEANT: P01CDLINAN: P01NROPRAN) REGPREST;
          If %Found(PAPPrestM);
                BusquedaMes();
          Else;
             BusquedaHis();
          EndIf;
       EndIf;
      /End-Free
     p BusquedaMes     e



     p BusquedaHis     b
      /Free
       If (P01AGEANT   > 0   And
          P01CDLINAN   > 0   And
          P01NROPRAN   > 0)  And
          (P01AGEANT   <>    P01AGE Or
           P01CDLINAN  <>    P01CDLIN Or
           P01NROPRAN  <>    P01NROPR);
          Chain (P01AGEANT: P01CDLINAN: P01NROPRAN)  a_RegPrest;
          If %Found(PAPPrestA);
             BusquedaHis();
          Else;
             If (P01AGEANT   <> 0   Or
                P01CDLINAN   <> 0   Or
                P01NROPRAN   <> 0);
                NoLoEncontro = *On;
             EndIf;
          EndIf;
       EndIf;
      /End-Free
     p BusquedaHis     e
