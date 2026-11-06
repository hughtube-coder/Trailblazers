;====================================================================
; SUBJECT: CS301 - Computer Organization and Assembly Language
; PROJECT: Final Project - Assembly Art (Donald Duck)
; GROUP NAME: Team Donald
; MEMBERS: Raymundo, Hugh Daniel J., [Member 2], [Member 3]
; SECTION: 3-CS4
; DATE STARTED: 11/05/2026
; DATE FINISHED: 11/05/2026
;====================================================================

.MODEL SMALL
.STACK 100H

.DATA
    ; Position and expression state variables (same style as finals.asm)
    ROW      DB 02H
    COL      DB 04H
    EXPR     DB 01H

    ; Group Name and Controls (String values with $ terminator)
    GRP_STR1 DB 'GROUP: TEAM DONALD (3-CS4)$'
    GRP_STR2 DB 'MOVE: W A S D | NEXT: SPACE$'
    GRP_STR3 DB '1:HAPPY 2:ANGRY 3:WINK$'
    GRP_STR4 DB '4:SHOCK 5:LOVE  | QUIT: Q$'

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Set standard text mode: 80x25 (from finals.asm)
    MOV AX, 0003H
    INT 10H

    ; Clear entire 80x25 screen with GREEN (20H) background
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 20H
    MOV CH, 00H
    MOV CL, 00H
    MOV DH, 18H
    MOV DL, 4FH
    INT 10H

    ;================================================================
    ; RIGHT PANEL: Draw 'DONALD DUCK' in blocks and Group Name below
    ;================================================================
    ; Right title box black outer border
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 02H
    MOV CL, 2EH
    MOV DH, 0EH
    MOV DL, 4EH
    INT 10H

    ; Right title box blue background
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 10H
    MOV CH, 03H
    MOV CL, 2FH
    MOV DH, 0DH
    MOV DL, 4DH
    INT 10H

    ; Drawn letter 'D' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 30H
    MOV DH, 07H
    MOV DL, 30H
    INT 10H

    ; Drawn letter 'D' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 31H
    MOV DH, 03H
    MOV DL, 32H
    INT 10H

    ; Drawn letter 'D' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 07H
    MOV CL, 31H
    MOV DH, 07H
    MOV DL, 32H
    INT 10H

    ; Drawn letter 'D' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 33H
    MOV DH, 06H
    MOV DL, 33H
    INT 10H

    ; Drawn letter 'O' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 35H
    MOV DH, 07H
    MOV DL, 35H
    INT 10H

    ; Drawn letter 'O' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 38H
    MOV DH, 07H
    MOV DL, 38H
    INT 10H

    ; Drawn letter 'O' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 36H
    MOV DH, 03H
    MOV DL, 37H
    INT 10H

    ; Drawn letter 'O' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 07H
    MOV CL, 36H
    MOV DH, 07H
    MOV DL, 37H
    INT 10H

    ; Drawn letter 'N' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 3AH
    MOV DH, 07H
    MOV DL, 3AH
    INT 10H

    ; Drawn letter 'N' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 3DH
    MOV DH, 07H
    MOV DL, 3DH
    INT 10H

    ; Drawn letter 'N' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 3BH
    MOV DH, 04H
    MOV DL, 3BH
    INT 10H

    ; Drawn letter 'N' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 3CH
    MOV DH, 05H
    MOV DL, 3CH
    INT 10H

    ; Drawn letter 'A' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 3FH
    MOV DH, 07H
    MOV DL, 3FH
    INT 10H

    ; Drawn letter 'A' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 42H
    MOV DH, 07H
    MOV DL, 42H
    INT 10H

    ; Drawn letter 'A' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 40H
    MOV DH, 03H
    MOV DL, 41H
    INT 10H

    ; Drawn letter 'A' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 05H
    MOV CL, 40H
    MOV DH, 05H
    MOV DL, 41H
    INT 10H

    ; Drawn letter 'L' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 44H
    MOV DH, 07H
    MOV DL, 44H
    INT 10H

    ; Drawn letter 'L' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 07H
    MOV CL, 45H
    MOV DH, 07H
    MOV DL, 47H
    INT 10H

    ; Drawn letter 'D' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 49H
    MOV DH, 07H
    MOV DL, 49H
    INT 10H

    ; Drawn letter 'D' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 03H
    MOV CL, 4AH
    MOV DH, 03H
    MOV DL, 4BH
    INT 10H

    ; Drawn letter 'D' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 07H
    MOV CL, 4AH
    MOV DH, 07H
    MOV DL, 4BH
    INT 10H

    ; Drawn letter 'D' in DONALD
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 04H
    MOV CL, 4CH
    MOV DH, 06H
    MOV DL, 4CH
    INT 10H

    ; Drawn letter 'D' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 35H
    MOV DH, 0DH
    MOV DL, 35H
    INT 10H

    ; Drawn letter 'D' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 36H
    MOV DH, 09H
    MOV DL, 37H
    INT 10H

    ; Drawn letter 'D' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 0DH
    MOV CL, 36H
    MOV DH, 0DH
    MOV DL, 37H
    INT 10H

    ; Drawn letter 'D' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 0AH
    MOV CL, 38H
    MOV DH, 0CH
    MOV DL, 38H
    INT 10H

    ; Drawn letter 'U' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 3AH
    MOV DH, 0CH
    MOV DL, 3AH
    INT 10H

    ; Drawn letter 'U' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 3DH
    MOV DH, 0CH
    MOV DL, 3DH
    INT 10H

    ; Drawn letter 'U' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 0DH
    MOV CL, 3BH
    MOV DH, 0DH
    MOV DL, 3CH
    INT 10H

    ; Drawn letter 'C' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 0AH
    MOV CL, 3FH
    MOV DH, 0CH
    MOV DL, 3FH
    INT 10H

    ; Drawn letter 'C' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 40H
    MOV DH, 09H
    MOV DL, 42H
    INT 10H

    ; Drawn letter 'C' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 0DH
    MOV CL, 40H
    MOV DH, 0DH
    MOV DL, 42H
    INT 10H

    ; Drawn letter 'K' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 44H
    MOV DH, 0DH
    MOV DL, 44H
    INT 10H

    ; Drawn letter 'K' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 0BH
    MOV CL, 45H
    MOV DH, 0BH
    MOV DL, 45H
    INT 10H

    ; Drawn letter 'K' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    MOV CL, 46H
    MOV DH, 0AH
    MOV DL, 47H
    INT 10H

    ; Drawn letter 'K' in DUCK
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 0CH
    MOV CL, 46H
    MOV DH, 0DH
    MOV DL, 47H
    INT 10H

    ; Group info box cyan border
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 30H
    MOV CH, 10H
    MOV CL, 2EH
    MOV DH, 16H
    MOV DL, 4EH
    INT 10H

    ; Group info box black interior
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 11H
    MOV CL, 2FH
    MOV DH, 15H
    MOV DL, 4DH
    INT 10H

    ; Display Group Name & Section string
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 11H
    MOV DL, 30H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR1
    INT 21H

    ; Display Movement Controls string
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 12H
    MOV DL, 30H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR2
    INT 21H

    ; Display Expressions 1-3 string
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 13H
    MOV DL, 30H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR3
    INT 21H

    ; Display Expressions 4-5 & Quit string
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 14H
    MOV DL, 30H
    INT 10H

    MOV AH, 09H
    LEA DX, GRP_STR4
    INT 21H

    ; Display the initial character (same jump structure as finals.asm)
    JMP DRAW_CHARACTER

    ;================================================================
    ; MOVEMENT: Read keypress for W/A/S/D, 1-5, SPACE, or Q
    ;================================================================
MOVEMENT:
    ; Read a key without echo
    MOV AH, 08H
    INT 21H
    MOV BL, AL

    ; Exit when q or Q is pressed
    CMP BL, 'q'
    JNE CHECK_Q_UPPER
    JMP EXIT_PROGRAM
CHECK_Q_UPPER:
    CMP BL, 'Q'
    JNE CHECK_KEY_1
    JMP EXIT_PROGRAM

    ; Check facial expression keys 1, 2, 3, 4, 5
CHECK_KEY_1:
    CMP BL, '1'
    JE SET_EXPR_1
    CMP BL, '2'
    JE SET_EXPR_2
    CMP BL, '3'
    JE SET_EXPR_3
    CMP BL, '4'
    JE SET_EXPR_4
    CMP BL, '5'
    JE SET_EXPR_5
    CMP BL, ' '
    JE NEXT_EXPR
    JMP CHECK_WASD

SET_EXPR_1:
    MOV EXPR, 01H
    JMP DRAW_FACE_ONLY

SET_EXPR_2:
    MOV EXPR, 02H
    JMP DRAW_FACE_ONLY

SET_EXPR_3:
    MOV EXPR, 03H
    JMP DRAW_FACE_ONLY

SET_EXPR_4:
    MOV EXPR, 04H
    JMP DRAW_FACE_ONLY

SET_EXPR_5:
    MOV EXPR, 05H
    JMP DRAW_FACE_ONLY

NEXT_EXPR:
    INC EXPR
    CMP EXPR, 06H
    JNE GO_FACE_ONLY
    MOV EXPR, 01H
GO_FACE_ONLY:
    JMP DRAW_FACE_ONLY

    ; Check W, A, S, D keys for movement
CHECK_WASD:
    CMP BL, 'w'
    JE MOVE_UP
    CMP BL, 'W'
    JE MOVE_UP

    CMP BL, 's'
    JE MOVE_DOWN
    CMP BL, 'S'
    JE MOVE_DOWN

    CMP BL, 'a'
    JE MOVE_LEFT
    CMP BL, 'A'
    JE MOVE_LEFT

    CMP BL, 'd'
    JE MOVE_RIGHT
    CMP BL, 'D'
    JE MOVE_RIGHT

WAIT_KEY:
    JMP MOVEMENT

MOVE_UP:
    CMP ROW, 00H
    JE WAIT_KEY
    DEC ROW
    JMP ERASE_CHARACTER

MOVE_DOWN:
    CMP ROW, 04H
    JE WAIT_KEY
    INC ROW
    JMP ERASE_CHARACTER

MOVE_LEFT:
    CMP COL, 01H
    JE WAIT_KEY
    DEC COL
    JMP ERASE_CHARACTER

MOVE_RIGHT:
    CMP COL, 08H
    JE WAIT_KEY
    INC COL
    JMP ERASE_CHARACTER

ERASE_CHARACTER:
    ; Erase previous Donald Duck on left side with GREEN (20H)
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 20H
    MOV CH, 00H
    MOV CL, 00H
    MOV DH, 18H
    MOV DL, 2CH
    INT 10H

    ;================================================================
    ; DRAW_CHARACTER: Draw Donald Duck Base at (ROW, COL)
    ;================================================================
DRAW_CHARACTER:
    ; Hat top outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 00H
    ADD CH, ROW
    MOV CL, 14H
    ADD CL, COL
    MOV DH, 00H
    ADD DH, ROW
    MOV DL, 1FH
    ADD DL, COL
    INT 10H

    ; Hat upper outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 10H
    ADD CL, COL
    MOV DH, 02H
    ADD DH, ROW
    MOV DL, 22H
    ADD DL, COL
    INT 10H

    ; Hat lower crown outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 03H
    ADD CH, ROW
    MOV CL, 09H
    ADD CL, COL
    MOV DH, 04H
    ADD DH, ROW
    MOV DL, 21H
    ADD DL, COL
    INT 10H

    ; Hat upper blue fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 10H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 12H
    ADD CL, COL
    MOV DH, 02H
    ADD DH, ROW
    MOV DL, 20H
    ADD DL, COL
    INT 10H

    ; Hat mid blue fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 10H
    MOV CH, 02H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 03H
    ADD DH, ROW
    MOV DL, 1FH
    ADD DL, COL
    INT 10H

    ; Hat left brim blue fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 10H
    MOV CH, 04H
    ADD CH, ROW
    MOV CL, 0AH
    ADD CL, COL
    MOV DH, 05H
    ADD DH, ROW
    MOV DL, 14H
    ADD DL, COL
    INT 10H

    ; Hat light blue highlight
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 90H
    MOV CH, 01H
    ADD CH, ROW
    MOV CL, 15H
    ADD CL, COL
    MOV DH, 02H
    ADD DH, ROW
    MOV DL, 1DH
    ADD DL, COL
    INT 10H

    ; Hat fold crease line
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 03H
    ADD CH, ROW
    MOV CL, 12H
    ADD CL, COL
    MOV DH, 03H
    ADD DH, ROW
    MOV DL, 16H
    ADD DL, COL
    INT 10H

    ; Black hatband
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 04H
    ADD CH, ROW
    MOV CL, 15H
    ADD CL, COL
    MOV DH, 05H
    ADD DH, ROW
    MOV DL, 1DH
    ADD DL, COL
    INT 10H

    ; Black tassel upper ribbon
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 04H
    ADD CH, ROW
    MOV CL, 04H
    ADD CL, COL
    MOV DH, 05H
    ADD DH, ROW
    MOV DL, 09H
    ADD DL, COL
    INT 10H

    ; Black tassel mid ribbon
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 05H
    ADD CH, ROW
    MOV CL, 02H
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 07H
    ADD DL, COL
    INT 10H

    ; Black tassel left fork tip
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 01H
    ADD CL, COL
    MOV DH, 07H
    ADD DH, ROW
    MOV DL, 03H
    ADD DL, COL
    INT 10H

    ; Black tassel right fork tip
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 05H
    ADD CL, COL
    MOV DH, 07H
    ADD DH, ROW
    MOV DL, 06H
    ADD DL, COL
    INT 10H

    ; Head top outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 06H
    ADD CH, ROW
    MOV CL, 0BH
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 1EH
    ADD DL, COL
    INT 10H

    ; Head main black outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 09H
    ADD CL, COL
    MOV DH, 0CH
    ADD DH, ROW
    MOV DL, 20H
    ADD DL, COL
    INT 10H

    ; Cheek tufts outer outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 07H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 22H
    ADD DL, COL
    INT 10H

    ; Cheek tufts widest tips
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 06H
    ADD CL, COL
    MOV DH, 0AH
    ADD DH, ROW
    MOV DL, 23H
    ADD DL, COL
    INT 10H

    ; Head top white feathers
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 06H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Forehead center feather dip
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 06H
    ADD CH, ROW
    MOV CL, 13H
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 16H
    ADD DL, COL
    INT 10H

    ; Head main white fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 0BH
    ADD CL, COL
    MOV DH, 0CH
    ADD DH, ROW
    MOV DL, 1EH
    ADD DL, COL
    INT 10H

    ; Cheek tufts white fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 09H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 20H
    ADD DL, COL
    INT 10H

    ; Cheek tufts outer white fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 08H
    ADD CL, COL
    MOV DH, 0AH
    ADD DH, ROW
    MOV DL, 21H
    ADD DL, COL
    INT 10H

    ; Upper beak main black outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 0CH
    ADD CH, ROW
    MOV CL, 06H
    ADD CL, COL
    MOV DH, 0FH
    ADD DH, ROW
    MOV DL, 23H
    ADD DL, COL
    INT 10H

    ; Beak top bridge outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 0BH
    ADD CH, ROW
    MOV CL, 12H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 17H
    ADD DL, COL
    INT 10H

    ; Left beak upturned corner yellow
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 0CH
    ADD CH, ROW
    MOV CL, 07H
    ADD CL, COL
    MOV DH, 0DH
    ADD DH, ROW
    MOV DL, 0AH
    ADD DL, COL
    INT 10H

    ; Right beak upturned corner yellow
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 0CH
    ADD CH, ROW
    MOV CL, 1FH
    ADD CL, COL
    MOV DH, 0DH
    ADD DH, ROW
    MOV DL, 22H
    ADD DL, COL
    INT 10H

    ; Beak center bridge yellow dome
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 0CH
    ADD CH, ROW
    MOV CL, 12H
    ADD CL, COL
    MOV DH, 0CH
    ADD DH, ROW
    MOV DL, 17H
    ADD DL, COL
    INT 10H

    ; Upper beak main yellow fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 0DH
    ADD CH, ROW
    MOV CL, 07H
    ADD CL, COL
    MOV DH, 0FH
    ADD DH, ROW
    MOV DL, 22H
    ADD DL, COL
    INT 10H

    ; Upper beak bridge orange shading
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 0DH
    ADD CH, ROW
    MOV CL, 12H
    ADD CL, COL
    MOV DH, 0DH
    ADD DH, ROW
    MOV DL, 17H
    ADD DL, COL
    INT 10H

    ; Mouth center smile line
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 0FH
    ADD CH, ROW
    MOV CL, 0BH
    ADD CL, COL
    MOV DH, 0FH
    ADD DH, ROW
    MOV DL, 1EH
    ADD DL, COL
    INT 10H

    ;================================================================
    ; DRAW_FACE_ONLY: Reset eye/mouth region and draw active EXPR (1-5)
    ;================================================================
DRAW_FACE_ONLY:
    ; Restore top white forehead feathers
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 06H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Restore forehead center feather dip
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 06H
    ADD CH, ROW
    MOV CL, 13H
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 16H
    ADD DL, COL
    INT 10H

    ; Reset eye area to white
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 0BH
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 1EH
    ADD DL, COL
    INT 10H

    ; Reset cheek area to white
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 0AH
    ADD CH, ROW
    MOV CL, 09H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 20H
    ADD DL, COL
    INT 10H

    ; Restore beak top bridge outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 0BH
    ADD CH, ROW
    MOV CL, 12H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 17H
    ADD DL, COL
    INT 10H

    ; Left eye top/bottom oval cyan
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0B0H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 0EH
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 11H
    ADD DL, COL
    INT 10H

    ; Left eye wide mid cyan
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0B0H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 12H
    ADD DL, COL
    INT 10H

    ; Right eye top/bottom oval cyan
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0B0H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Right eye wide mid cyan
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0B0H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 17H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Clear lower bill area to green background
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 20H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0AH
    ADD CL, COL
    MOV DH, 14H
    ADD DH, ROW
    MOV DL, 1FH
    ADD DL, COL
    INT 10H

    ; Branch to selected facial expression (1, 2, 3, 4, or 5)
    CMP EXPR, 01H
    JNE CHECK_EXPR_2
    JMP DRAW_EXPR_1
CHECK_EXPR_2:
    CMP EXPR, 02H
    JNE CHECK_EXPR_3
    JMP DRAW_EXPR_2
CHECK_EXPR_3:
    CMP EXPR, 03H
    JNE CHECK_EXPR_4
    JMP DRAW_EXPR_3
CHECK_EXPR_4:
    CMP EXPR, 04H
    JNE DRAW_EXPR_5
    JMP DRAW_EXPR_4

    ; --- EXPRESSION 5: HEART EYES / IN LOVE ---
DRAW_EXPR_5:
    ; Left heart top-left lobe
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 0FH
    ADD DL, COL
    INT 10H

    ; Left heart top-right lobe
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 10H
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 12H
    ADD DL, COL
    INT 10H

    ; Left heart top notch
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 08H
    ADD DH, ROW
    MOV DL, 10H
    ADD DL, COL
    INT 10H

    ; Left heart middle
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 0AH
    ADD DH, ROW
    MOV DL, 12H
    ADD DL, COL
    INT 10H

    ; Left heart bottom point
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 0BH
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 10H
    ADD DL, COL
    INT 10H

    ; Right heart top-left lobe
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 17H
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 19H
    ADD DL, COL
    INT 10H

    ; Right heart top-right lobe
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 1AH
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Right heart top notch
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 19H
    ADD CL, COL
    MOV DH, 08H
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    ; Right heart middle
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 17H
    ADD CL, COL
    MOV DH, 0AH
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Right heart bottom point
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 0BH
    ADD CH, ROW
    MOV CL, 19H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    ; Left cheek pink blush
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0D0H
    MOV CH, 0AH
    ADD CH, ROW
    MOV CL, 09H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 0BH
    ADD DL, COL
    INT 10H

    ; Right cheek pink blush
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0D0H
    MOV CH, 0AH
    ADD CH, ROW
    MOV CL, 1EH
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 20H
    ADD DL, COL
    INT 10H

    ; Love smile lower bill outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Love smile chin bottom outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 13H
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 13H
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    ; Love smile yellow rim
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0EH
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Love smile pink tongue
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0D0H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 11H
    ADD CL, COL
    MOV DH, 11H
    ADD DH, ROW
    MOV DL, 18H
    ADD DL, COL
    INT 10H

    JMP MOVEMENT

    ; --- EXPRESSION 4: SHOCKED / SURPRISED (O_O) ---
DRAW_EXPR_4:
    ; Shocked high left brow
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 06H
    ADD CH, ROW
    MOV CL, 0EH
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 11H
    ADD DL, COL
    INT 10H

    ; Shocked high right brow
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 06H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 06H
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Shocked tiny left pupil
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 0AH
    ADD DH, ROW
    MOV DL, 10H
    ADD DL, COL
    INT 10H

    ; Shocked tiny right pupil
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 19H
    ADD CL, COL
    MOV DH, 0AH
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    ; Shocked O-mouth black outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 10H
    ADD CL, COL
    MOV DH, 14H
    ADD DH, ROW
    MOV DL, 19H
    ADD DL, COL
    INT 10H

    ; Shocked O-mouth yellow rim
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 11H
    ADD CL, COL
    MOV DH, 13H
    ADD DH, ROW
    MOV DL, 18H
    ADD DL, COL
    INT 10H

    ; Shocked O-mouth dark center
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 11H
    ADD CH, ROW
    MOV CL, 13H
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 16H
    ADD DL, COL
    INT 10H

    ; Shocked tiny pink tongue
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0D0H
    MOV CH, 12H
    ADD CH, ROW
    MOV CL, 14H
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 15H
    ADD DL, COL
    INT 10H

    JMP MOVEMENT

    ; --- EXPRESSION 3: WINK & SMILE ---
DRAW_EXPR_3:
    ; Cover left eye with white feather for wink
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 12H
    ADD DL, COL
    INT 10H

    ; Left wink upper curve
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 0EH
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 11H
    ADD DL, COL
    INT 10H

    ; Left wink left tip
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 0AH
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 0AH
    ADD DH, ROW
    MOV DL, 0EH
    ADD DL, COL
    INT 10H

    ; Left wink right tip
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 0AH
    ADD CH, ROW
    MOV CL, 11H
    ADD CL, COL
    MOV DH, 0AH
    ADD DH, ROW
    MOV DL, 12H
    ADD DL, COL
    INT 10H

    ; Right pupil black
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    ; Right pupil white glint
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 18H
    ADD DL, COL
    INT 10H

    ; Closed lower bill outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0CH
    ADD CL, COL
    MOV DH, 11H
    ADD DH, ROW
    MOV DL, 1DH
    ADD DL, COL
    INT 10H

    ; Closed chin bottom outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 12H
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    ; Closed lower bill yellow fill
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 11H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Closed mouth smile shadow
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 10H
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    JMP MOVEMENT

    ; --- EXPRESSION 2: ANGRY TANTRUM ---
DRAW_EXPR_2:
    ; Angry left brow outer
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 0CH
    ADD CL, COL
    MOV DH, 07H
    ADD DH, ROW
    MOV DL, 0FH
    ADD DL, COL
    INT 10H

    ; Angry left brow mid
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 0EH
    ADD CL, COL
    MOV DH, 08H
    ADD DH, ROW
    MOV DL, 11H
    ADD DL, COL
    INT 10H

    ; Angry left brow inner V
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 10H
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 13H
    ADD DL, COL
    INT 10H

    ; Angry right brow outer
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 07H
    ADD CH, ROW
    MOV CL, 1AH
    ADD CL, COL
    MOV DH, 07H
    ADD DH, ROW
    MOV DL, 1DH
    ADD DL, COL
    INT 10H

    ; Angry right brow mid
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 08H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 08H
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Angry right brow inner V
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 16H
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 19H
    ADD DL, COL
    INT 10H

    ; Angry left glaring pupil
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 0AH
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 11H
    ADD DL, COL
    INT 10H

    ; Angry right glaring pupil
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 0AH
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    ; Angry wide lower bill outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0AH
    ADD CL, COL
    MOV DH, 13H
    ADD DH, ROW
    MOV DL, 1FH
    ADD DL, COL
    INT 10H

    ; Angry chin bottom outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 14H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 14H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Angry lower bill yellow rim
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0BH
    ADD CL, COL
    MOV DH, 13H
    ADD DH, ROW
    MOV DL, 1EH
    ADD DL, COL
    INT 10H

    ; Angry shouting red mouth interior
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 40H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Angry bright red tongue
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0C0H
    MOV CH, 11H
    ADD CH, ROW
    MOV CL, 12H
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 17H
    ADD DL, COL
    INT 10H

    JMP MOVEMENT

    ; --- EXPRESSION 1: HAPPY QUACK (DEFAULT) ---
DRAW_EXPR_1:
    ; Left pupil black
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 11H
    ADD DL, COL
    INT 10H

    ; Left pupil white glint
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 0FH
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 0FH
    ADD DL, COL
    INT 10H

    ; Right pupil black
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 0BH
    ADD DH, ROW
    MOV DL, 1AH
    ADD DL, COL
    INT 10H

    ; Right pupil white glint
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0F0H
    MOV CH, 09H
    ADD CH, ROW
    MOV CL, 18H
    ADD CL, COL
    MOV DH, 09H
    ADD DH, ROW
    MOV DL, 18H
    ADD DL, COL
    INT 10H

    ; Open lower bill outer outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0BH
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 1EH
    ADD DL, COL
    INT 10H

    ; Open lower chin outline
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 00H
    MOV CH, 13H
    ADD CH, ROW
    MOV CL, 0DH
    ADD CL, COL
    MOV DH, 14H
    ADD DH, ROW
    MOV DL, 1CH
    ADD DL, COL
    INT 10H

    ; Open lower bill yellow rim
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0CH
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 1DH
    ADD DL, COL
    INT 10H

    ; Open lower chin yellow rim
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0E0H
    MOV CH, 13H
    ADD CH, ROW
    MOV CL, 0EH
    ADD CL, COL
    MOV DH, 13H
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Open mouth orange interior
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 60H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 0EH
    ADD CL, COL
    MOV DH, 12H
    ADD DH, ROW
    MOV DL, 1BH
    ADD DL, COL
    INT 10H

    ; Pink tongue inside mouth
    MOV AH, 06H
    MOV AL, 00H
    MOV BH, 0D0H
    MOV CH, 10H
    ADD CH, ROW
    MOV CL, 13H
    ADD CL, COL
    MOV DH, 11H
    ADD DH, ROW
    MOV DL, 16H
    ADD DL, COL
    INT 10H

    JMP MOVEMENT

EXIT_PROGRAM:
    ; Exit program (from finals.asm)
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
