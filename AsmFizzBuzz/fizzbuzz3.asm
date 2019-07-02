
/--------------------------------------------------------
/DEFINES
/--------------------------------------------------------
SWBA=7447               /EAE MODE A INSTRUCTION
DVI=7407                /EAE DIVIDE INSTRUCTION
AIX0=0010               /AUTO INDEX REGISTER 0
CR=0215                 /CARRIAGE RETURN
LF=0212                 /LINEFEED
EOT=0000                /END OF TEXT NUL
FIZMOD=0003             /CONSTANT DECIMAL 3 (FIZZ)
BUZMOD=0005             /CONSTANT DECIMAL 5 (BUZZ)
K10=0012                /CONSTANT DECIMAL 10
 
LAST=0144               /FIZZBUZZ THE NUMBERS 1..LAST
                        /0144 OCTAL == 100 DECIMAL
                        /CAN BE ANY FROM [0001...7777]
 
/--------------------------------------------------------
/FIZZBUZZ START=0200
/--------------------------------------------------------
        *200            /START IN MEMORY AT 0200 OCTAL
FZZBZZ, CLA             /CLEAR AC
        TAD (-LAST-1    /LOAD CONSTANT -(LAST+1)
        DCA CNTR        /SET UP MAIN COUNTER
        TAD (-FIZMOD    /SET UP FIZZ COUNTER
        DCA FIZCTR      /TO -3
        TAD (-BUZMOD    /SET UP BUZZ COUNTER
        DCA BUZCTR      /TO -5
LOOP,   ISZ CNTR        /READY?
        SKP             /NO: CONTINUE
        JMP I [7600     /YES: RETURN TO OS/8, REPLACE BY
                        /'HLT' IF NOT ON OS/8
CHKFIZ, ISZ FIZCTR      /MULTIPLE OF 3?
        JMP CHKBUZ      /NO: CONTINUE
        TAD FIZSTR      /YES: LOAD ADDRESS OF 'FIZZ'
        JMS STROUT      /PRINT IT TO TTY
        TAD (-FIZMOD    /RELOAD THE
        DCA FIZCTR      /MOD 3 COUNTER
CHKBUZ, ISZ BUZCTR      /MULTIPLE OF 5?
        JMP CHKNUM      /NO: CONTINUE
        TAD BUZSTR      /YES: LOAD ADDRESS OF 'BUZZ'
        JMS STROUT      /PRINT IT TO TTY
        TAD (-BUZMOD    /RELOAD THE
        DCA BUZCTR      /MOD 5 COUNTER
        JMP NXTLIN      /PRINT NEWLINE AND CONTINUE
CHKNUM, TAD FIZCTR      /CHECK WHETHER MOD 3 COUNTER
        TAD (FIZMOD     /IS RELOADED
        SNA             /DID WE JUST PRINT 'FIZZ'?
        JMP NXTLIN      /YES: PRINT NEWLINE AND CONTINUE
        CLA             /ZERO THE AC
NUM,    TAD CNTR        /LOAD THE MAIN NUMBER COUNTER
        TAD (LAST+1     /OFFSET IT TO A POSITIVE VALUE
        JMS NUMOUT      /PRINT IT TO THE TTY
NXTLIN, TAD LINSTR      /LOAD THE ADDRESS OF THE NEWLINE
        JMS STROUT      /PRINT IT TO TTY
        JMP LOOP        /CONTINUE WITH THE NEXT NUMBER
CNTR,   0               /MAIN COUNTER
FIZCTR, 0               /FIZZ COUNTER
BUZCTR, 0               /BUZZ COUNTER
 
/--------------------------------------------------------
/WRITE ASCII CHARACTER IN AC TO TTY
/PRE : AC=ASCII CHARACTER
/POST: AC=0
/--------------------------------------------------------
CHROUT, .-.
        TLS             /SEND CHARACTER TO TTY
        TSF             /IS TTY READY FOR NEXT CHARACTER?
        JMP .-1         /NO TRY AGAIN
        CLA             /AC=0
        JMP I CHROUT    /RETURN
 
/--------------------------------------------------------
/WRITE NUL TERMINATED ASCII STRING TO TTY
/PRE : AC=ADDRESS OF STRING MINUS 1
/POST: AC=0
/--------------------------------------------------------
STROUT, .-.
        DCA AIX0        /STORE POINTER IN AUTO INDEX 0
STRLOP, TAD I AIX0      /GET NEXT CHARACTER FROM STRING
        SNA             /SKIP IF NOT EOT
        JMP I STROUT    /RETURN
        JMS CHROUT      /PRINT CHARACTER
        JMP STRLOP      /GO GET NEXT CHARACTER
 
/--------------------------------------------------------
/WRITE NUMBER IN AC TO TTY AS DECIMAL
/PRE : AC=UNSIGNED NUMBER BETWEEN 0000 AND 7777
/POST: AC=0
/--------------------------------------------------------
NUMOUT, .-.
        SWBA            /SET EAE IN MODE A
        MQL             /MQ=NUM; AC=0
        TAD BUFFER      /LOAD END OF BUFFER
        DCA BUFPTR      /IN BUFPTR
        SKP             /NUM IS ALREADY IN MQ
NUMLOP, MQL             /MQ=NUM; AC=0
        DVI             /MQ=NUM/10; AC=NUM-(NUM/10)*10
        K10             /DECIMAL 10
        TAD ("0         /ADD ASCII ZERO
        DCA I BUFPTR    /STORE CHAR BUFFER, BACK TO FRONT
        CMA             /AC=-1
        TAD BUFPTR      /DECREMENT
        DCA BUFPTR      /BUFFER POINTER
        MQA             /MQ -> AC
        SZA             /READY IF ZERO
        JMP NUMLOP      /GET NEXT DIGIT
        TAD BUFPTR      /LOAD START OF CONVERTED NUMBER
        JMS STROUT      /SEND IT TO TTY
        JMP I NUMOUT    /RETURN
BUFFER, .+4             /ADDRESS OF BUFFER
        *.+4            /RESERVE 4 LOCATIONS (MAX=4095)
        EOT             /END OF BUFFER
BUFPTR, 0               /POINTER IN BUFFER
 
/--------------------------------------------------------
/STRINGS
/--------------------------------------------------------
FIZSTR, .               /FIZZ STRING
        "F; "I; "Z; "Z; EOT
BUZSTR, .               /BUZZ STRING
        "B; "U; "Z; "Z; EOT
LINSTR, .               /NEWLINE STIRNG
        CR; LF; EOT
        $