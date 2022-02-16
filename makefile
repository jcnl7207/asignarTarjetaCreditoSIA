
BIN_LIB=CMPSYS
LIBLIST=$(BIN_LIB) FINCLIDAT
SHELL=/QOpenSys/usr/bin/qsh
 
all: tdbsrv0035.sqlrpgle

%.sqlrpgle:
	system -s "CHGATR OBJ('./QRPGLESRC/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('./QRPGLESRC/$*.sqlrpgle') CLOSQLCSR(*ENDMOD) OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"
