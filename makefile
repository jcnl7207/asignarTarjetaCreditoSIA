
BIN_LIB=CMPSYS
LIBLIST=&BIN_LIB
SHELL=/QOpenSys/usr/qsh

all: ejemplo101.rpgle

%.rpgle:
	system -s "CHGATR OBJ('./QRPGLESRC/$*.rpgle') ATTR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTRPGMOD MODULE($BIN_LIB/$*) SRCFILE(./QRPGLESRC/$*.rpgle) OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"
