*-----------------------------------------------------------
* Title      : Reading a Text File with 68K Assembly
* Written by : Thanapoom Phatthanaphan
* Date       : 8/12/2022
* Description: Assembly 3 Project
*-----------------------------------------------------------
        ORG    $1000
START:                  ; first instruction of program
        lea     filename, a1
        move    #51, d0
        trap    #15
        
        move.l  #filesize, d2
        lea     buffer, a1
        move    #53, d0
        trap    #15
        move    #5, d3
        
convert_loop:
        tst.b   d3
        beq     done
        sub.b   #$30, (a1)+
        sub.b   #1, d3
        bra     convert_loop

done:
        SIMHALT         ; halt simulator
        
        org     $2000

filename    dc.b    'testfile.txt', 0
buffer      ds.b    80
filesize    dc.b    80

        END     START   ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
