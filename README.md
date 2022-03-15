
eSTE DESARROLLO ESTÁCOMPLEMENTADO CON EL cmo 2022-049

pltctacup Tiene un Treeger. (SATCUPOS_TRG  )
PGM: FINCOOOBJ/SATCUPOSCL  --> FINCOOOBJ/SATCUPOSR

Crea el programa TCSAT0046 reemplazamos la escritura dela DTAQ y ejecutamos programa monitoreando el error pa<ra que no se quede pegado. y guardamos un log con el resultado:


Pgm_nuevo – TCSAT0046 (Log liviano)
PGM – Nuevo (Creación de clienet) - TCSAT0045 Grba log con detalle de erro para medios de pago.

LOG para programa 46
TipDoc
NumeroDoc
Sistema
Producto
Cupo
Usuario que lo creó
TimeStamp el mismo del programa 45.
Estado.


 LOG para programa 45 No Hay.

 Copia delprograma WSCL00009 
 Adicionar parametro Timestamp de salida. e igual en todo al original.
 
 

 Nota:
 El programa SATCUPRES de COOFINSRC, está malo y difiere con el de producción, se toma elde laFINTEST.

 En pruebco aparece el archivo FINCOODAT/SATCUPRES de Toshiro que difiere con el original, esto debe estar causando multiples problemas, se reombrael archivo.

Cual es la oficina?

SatSispro(empresrial) y satsispron(natural) me definen el sistema producto de tarjetas de credito en SAT.





