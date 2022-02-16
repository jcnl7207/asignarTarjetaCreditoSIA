
BIN_LIB=CMPSYS
LIBLIST=$(BIN_LIB)
SHELL=/QOpenSys/usr/bin/qsh

all: tdbsrv0035.sqlrpgle

%.rpgle:
	system -s "CHGATR OBJ('./QRPGLESRC/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTRPGMOD MODULE($(BIN_LIB)/$*) SRCSTMF('./QRPGLESRC/$*.rpgle') OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"

%.sqlrpgle:
	system -s "CHGATR OBJ('./QRPGLESRC/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('./QRPGLESRC/$*.sqlrpgle') CLOSQLCSR(*ENDMOD) OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"
