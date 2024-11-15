DATA SEGMENT
    MSG1 DB 13,10, 'ENTER A STRING: $'
    MSG2 DB 13,10, 'THE STRING IS A PALINDROME$'
    MSG3 DB 13,10, 'THE STRING IS NOT A PALINDROME$'
    STR1 DB 50 DUP(0)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:
        MOV AX,DATA
        MOV DS,AX

        ;PRINTING MSG1
        LEA DX,MSG1
        MOV AH,09H
        INT 21H

        LEA SI,STR1
        LEA DI,STR1

        MOV AH,01H
        
    NEXT:
        INT 21H ;ACCEPTING CHARACTER INPUT

        CMP AL,0DH ;CHECKING IF CHARACTER IS CARRIAGE RETURN
        JE TERMINATE

        MOV [DI],AL
        INC DI
        JMP NEXT
    
    TERMINATE:
        MOV AL,'$'
        MOV [DI],AL ;ADDING END OF STRING CHARACTER

    DOTHIS:
        DEC DI
        MOV AL,[SI]
    
        
        CMP [DI],AL
        JNE NOTPALINDROME
        INC SI
        CMP SI,DI
        JL DOTHIS

    PALINDROME:
        MOV AH,09H
        LEA DX,MSG2
        INT 21H
        JMP XX

    NOTPALINDROME:
        MOV AH,09H
        LEA DX,MSG3
        INT 21H

    XX:
        MOV AH,4CH
        INT 21H

CODE ENDS
END START
        
