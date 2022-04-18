

BIN_LIB=CMPSYS
DESTINO=CMO2022070
LIBLIST=$(BIN_LIB) FINPLTDAT FINCOODAT FINCLIDAT
SHELL=/QOpenSys/usr/bin/qsh

all: TCSAT0047.sqlrpgle

%.sql:
	system -s "CAll FINCOOOBJ/CREALIB PARM('$(DESTINO)')"
	system -s "CHGATR OBJ('./QDDSSRC/$*.sql') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "RUNSQLSTM SRCSTMF('./QDDSSRC/$*.sql') COMMIT(*NONE) DFTRDBCOL($(DESTINO))"
	system "CPYFRMIMPF FROMSTMF('./QDDSSRC/$*.sql') TOFILE($(DESTINO)/FINDDS $*) MBROPT(*REPLACE) TOCCSID(284) RCDDLM(*CRLF) STRDLM(*NONE) RMVBLANK(*NONE)"
	system "CHGPFM FILE($(DESTINO)/FINDDS) MBR($*) SRCTYPE(PF)"

%.rpgle:
	system -s "CAll FINCOOOBJ/CREALIB PARM('$(DESTINO)')"
	system -s "CHGATR OBJ('./QRPGLESRC/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTBNDRPG PGM($(DESTINO)/$*) SRCSTMF('./QRPGLESRC/$*.rpgle') OPTION(*EVENTF) DBGVIEW(*LIST) TGTRLS(*CURRENT)"
	system "CPYFRMIMPF FROMSTMF('./QRPGLESRC/$*.rpgle') TOFILE($(DESTINO)/FINRPG $*) MBROPT(*REPLACE) TOCCSID(284) RCDDLM(*CRLF) STRDLM(*NONE) RMVBLANK(*NONE)"
	system "CHGPFM FILE($(DESTINO)/FINRPG) MBR($*) SRCTYPE(RPGLE)"
	
	
%.sqlrpgle:
	system -s "CAll FINCOOOBJ/CREALIB PARM('$(DESTINO)')"
	system -s "CHGATR OBJ('./QRPGLESRC/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(DESTINO)/$*) SRCSTMF('./QRPGLESRC/$*.sqlrpgle') CLOSQLCSR(*ENDMOD) OPTION(*EVENTF) DBGVIEW(*LIST) TGTRLS(*CURRENT)"
	system "CPYFRMIMPF FROMSTMF('./QRPGLESRC/$*.sqlrpgle') TOFILE($(DESTINO)/FINRPG $*) MBROPT(*REPLACE) TOCCSID(284) RCDDLM(*CRLF) STRDLM(*NONE) RMVBLANK(*NONE)"
	system "CHGPFM FILE($(DESTINO)/FINRPG) MBR($*) SRCTYPE(SQLRPGLE)"

%.clle:
	system -s "CAll FINCOOOBJ/CREALIB PARM('$(DESTINO)')"
	system -s "CHGATR OBJ('./QCLLESRC/$*.clle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTBNDCL PGM($(DESTINO)/$*) SRCSTMF('./QCLLESRC/$*.clle') DBGVIEW(*LIST)"
	system "CPYFRMIMPF FROMSTMF('./QCLLESRC/$*.clle') TOFILE($(DESTINO)/FINCLP $*) MBROPT(*REPLACE) TOCCSID(284) RCDDLM(*CRLF) STRDLM(*NONE) RMVBLANK(*NONE)"
	system "CHGPFM FILE($(DESTINO)/FINCLP) MBR($*) SRCTYPE(CLLE)"

