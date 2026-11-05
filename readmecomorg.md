# CS301 Final Project: Donald Duck 8086 Assembly Art & Animation
**Course:** CS301 - Computer Organization and Assembly Language  
**Institution:** City College of Calamba — Department of Computing and Informatics  
**Instructor:** Mr. Gerome Sario  
**Class/Section:** 3-CS4  
**Target Platform:** 8086 Microprocessor / Emu8086 Emulator (16-bit Real Mode)  
**Display Specification:** Standard 80x25 Text Mode (`Mode 03H`)  

---

## 1. Project Overview & Screen Layout

The project implements an interactive, animated 8086 Assembly graphic of **Donald Duck** formatted strictly for an **80-column by 25-row (`80x25`) text screen** using BIOS video services (`INT 10H`) and DOS interrupts (`INT 21H`).

As instructed by Mr. Gerome Sario in the class briefing (`Meet - tqa-kbqo-dct.mp4`), the screen is divided into two distinct zones:

```
+---------------------------------------------+------------------------------------+
|                                             | [Cols 46..78, Rows 02..14]         |
|  LEFT VIEWPORT (CHARACTER REGION)           |   D O N A L D   D U C K            |
|  Cols: 00H to 2CH (Columns 0 to 44)         |   (Block-drawn title art)          |
|  Rows: 00H to 18H (Rows 0 to 24)            |                                    |
|                                             +------------------------------------+
|  - Donald Duck Head (Rows 0..20, Cols 0..35)| [Cols 46..78, Rows 16..22]         |
|  - Dynamic offset by (ROW, COL) variables   |   GROUP: TEAM DONALD (3-CS4)       |
|  - 5 Interactive Facial Expressions         |   MOVE: W A S D | NEXT: SPACE      |
|  - Smooth movement & boundary protection    |   1:HAPPY 2:ANGRY 3:WINK           |
|                                             |   4:SHOCK 5:LOVE  | QUIT: Q        |
+---------------------------------------------+------------------------------------+
```

1. **Left Portion (Character Zone — Cols 00H to 2CH / 0 to 44):**
   * Occupies the primary portion of the screen.
   * Houses Donald Duck’s complete head, sailor cap, tassel, eyes, bill, and expression details.
   * Can be dynamically shifted across the viewport using movement keys.
2. **Top-Right Panel (Character Title — Cols 2EH to 4EH, Rows 02H to 0EH):**
   * Displays the title `"DONALD DUCK"` custom-drawn letter-by-letter using `INT 10H, AH=06H` color blocks inside a royal blue card with a black border.
3. **Bottom-Right Panel (Group Credentials & Controls — Cols 2EH to 4EH, Rows 10H to 16H):**
   * Displays your group name, section, and control mappings using DOS `INT 21H, AH=09H` string output inside a cyan-bordered box.

---

## 2. Interactive Controls & Features

| Key | Function / Feature | Visual Behavior on Screen |
| :---: | :--- | :--- |
| **`1`** | **Happy Quack (Default)** | Wide light-cyan eyes with white glints, open yellow beak, and pink quacking tongue. |
| **`2`** | **Angry Tantrum** | Slanted V-shaped angry eyebrows, glaring pupils, wide shouting mouth with red interior. |
| **`3`** | **Wink & Smile** | Curved winking left eye, open cheerful right eye, and a closed smiling beak. |
| **`4`** | **Shocked (`O_O`)** | High raised eyebrows, tiny pinpoint pupils, and a small round `"O"` gasp mouth. |
| **`5`** | **Heart Eyes (In Love)** | Symmetrical bright red hearts in both eyes, pink blushing cheeks, sweet smile. |
| **`SPACE`** | **Cycle Expressions** | Automatically cycles through expressions `1` $\rightarrow$ `2` $\rightarrow$ `3` $\rightarrow$ `4` $\rightarrow$ `5` $\rightarrow$ `1`. |
| **`W` / `w`** | **Move UP** | Decrements `ROW` and shifts the entire character up by 1 row. |
| **`S` / `s`** | **Move DOWN** | Increments `ROW` and shifts the entire character down by 1 row. |
| **`A` / `a`** | **Move LEFT** | Decrements `COL` and shifts the entire character left by 1 column. |
| **`D` / `d`** | **Move RIGHT** | Increments `COL` and shifts the entire character right by 1 column. |
| **`Q` / `q`** | **Quit Program** | Exits cleanly to DOS via `INT 21H, AH=4CH`. |

---

## 3. Strict Lesson & Policy Compliance Audit

Mr. Sario stated explicitly that **using untaught/advanced code results in an automatic score of 0**. The file `DONALD_DUCK.asm` was audited and engineered to use **only the exact instructions, registers, interrupts, and structures taught in class**:

### Summary of Every Token Used:
* **Directives:** `.MODEL SMALL`, `.STACK 100H`, `.DATA`, `.CODE`, `MAIN PROC`, `MAIN ENDP`, `END MAIN`, `DB`.
* **Instructions (9 total):** `MOV`, `LEA`, `ADD`, `INC`, `DEC`, `CMP`, `JE`, `JNE`, `JMP`.
* **BIOS Interrupts:** `INT 10H` (`AX=0003H`, `AH=02H`, `AH=06H`).
* **DOS Interrupts:** `INT 21H` (`AH=08H`, `AH=09H`, `AH=4CH`).
* **Registers:** `AX`, `BX`, `CX`, `DX` (and 8-bit halves `AH`, `AL`, `BH`, `BL`, `CH`, `CL`, `DH`, `DL`), plus segment register `DS`.

### What Was Deliberately Kept Out (to prevent an automatic 0):
* ❌ **NO Sub-procedures (`CALL` / `RET`):** All routines remain strictly flat inside `MAIN PROC` matching `finals.asm` and `Sakuragi.asm`.
* ❌ **NO Direct Video Memory Writing (`0B800H`):** Everything is drawn purely via BIOS `INT 10H`.
* ❌ **NO BIOS Keyboard Interrupt (`INT 16H`):** Keyboard input is handled solely via DOS `INT 21H, AH=08H` as taught in Lesson 7 and `finals.asm`.
* ❌ **NO Untaught Arithmetic or Flags:** No bit shifts (`SHL`/`SHR`), no signed branches (`JG`, `JL`), no bitwise manipulation (`XOR`, `AND`) in the jump paths.
* ❌ **NO Assembler Macros or Advanced Directives:** No `MACRO`, no `EQU`, no `DUP`, no `OFFSET`.

---

## 4. Technical Architecture: How the Code Works

### Step 1: Program Initialization & Video Setup
```assembly
MOV AX, @DATA
MOV DS, AX
MOV AX, 0003H
INT 10H
```
* Initializes the `DS` register so the program can access variables declared in `.DATA`.
* Sets BIOS video mode to `03H` (80 columns $\times$ 25 rows, 16-color text mode).

### Step 2: Drawing Colored Blocks via `INT 10H, AH=06H`
Instead of using standard font ASCII characters, the program draws solid graphical blocks using BIOS Scroll/Clear Window service (`INT 10H, AH=06H`):
* `AH = 06H`: BIOS function to scroll/clear a rectangular window.
* `AL = 00H`: Setting lines to scroll to `00H` blanks/fills the entire rectangle.
* `BH`: The color attribute byte. The high nibble (bits 4–7) defines the background color fill:
  * `00H` = Black
  * `10H` = Blue (Donald's Sailor Hat)
  * `20H` = Green (Screen Background)
  * `30H` = Cyan (Right Panel Accent)
  * `40H` = Red (Angry Mouth / Heart Eyes)
  * `60H` = Brown / Dark Orange (Beak Shading)
  * `90H` = Light Blue (Cap Highlight)
  * `B0H` = Light Cyan (Eye Sclera)
  * `C0H` = Light Red (Tongue)
  * `D0H` = Light Magenta / Pink (Tongue / Cheek Blush)
  * `E0H` = Yellow (Donald's Beak & Title Letters)
  * `F0H` = White (Feathers & Glints)
* `CH, CL`: Upper-left corner coordinates (`CH` = Row, `CL` = Column).
* `DH, DL`: Lower-right corner coordinates (`DH` = Row, `DL` = Column).

### Step 3: Dynamic Positioning via `ADD`
When drawing Donald Duck, the static relative coordinates of each rectangle are shifted dynamically by adding the `ROW` and `COL` variables:
```assembly
MOV CH, 06H
ADD CH, ROW     ; Shifts top row by ROW offset
MOV CL, 0BH
ADD CL, COL     ; Shifts left column by COL offset
MOV DH, 06H
ADD DH, ROW     ; Shifts bottom row by ROW offset
MOV DL, 1EH
ADD DL, COL     ; Shifts right column by COL offset
INT 10H
```

### Step 4: Fast In-Place Facial Expression Switching (`DRAW_FACE_ONLY:`)
* If the user presses a movement key (`W/A/S/D`), the entire character is erased on the left (`CLEAR_LEFT_AREA`) and redrawn at the new `(ROW, COL)`.
* If the user presses an expression key (`1`–`5` or `SPACE`), the program jumps directly to `DRAW_FACE_ONLY:`. This executes a fast localized reset of only the eye and mouth area, then paints the active expression without redrawing the hat or cheek tufts. This eliminates emulator lag.

### Step 5: Keyboard Polling Loop (`MOVEMENT:`)
* Uses `INT 21H, AH=08H` (Console input without echo). Unlike `AH=01H`, `AH=08H` reads the keystroke into `AL` without printing the character on the screen.
* Compares `AL` against upper and lowercase keys (`'w'`, `'W'`, `'1'`, `'q'`, etc.) using `CMP` and `JE`.
* If a boundary is reached (e.g., `ROW == 00H` or `COL >= 08H`), the jump is aborted and returns to `MOVEMENT:`, preventing Donald from clipping out of bounds or colliding with the right-side title card.

---

## 5. Oral Defense Cheatsheet: Top 10 Questions Mr. Sario Might Ask

### Q1: "Paano gumagana yung movement ng character niyo sa screen?"
> **Answer:** *"Sir, gumamit po kami ng parehong technique sa `finals.asm`. May dalawa po kaming variables sa `.DATA`, yung `ROW` at `COL`. Bawat pindot ng `W`, `A`, `S`, o `D`, binabago po natin yung value gamit ang `INC` o `DEC`. Bago po i-redraw si Donald Duck, tinatawag po natin yung `ERASE_CHARACTER` gamit ang `INT 10H, AH=06H` na may background color `20H` (green) para burahin yung dating pwesto, tapos idina-draw po ulit si Donald Duck kung saan bawat coordinate ay ina-`ADD` natin ng `ROW` at `COL`."*

### Q2: "Bakit `INT 10H, AH=06H` ang ginamit niyo pangguhit imbes na ordinaryong text character?"
> **Answer:** *"Sir, sa Lesson 7 slide 17 po, ang `INT 10H, AH=06H` ay BIOS service para sa scroll or clear a text window. Kapag nilagay po natin ang `AL = 00H`, kinukuha po nito ang buong window mula `(CH,CL)` hanggang `(DH,DL)` at pinupuno ito ng color attribute na nasa `BH`. Dahil ang upper 4 bits ng `BH` ay background color, nakakagawa po tayo ng solid color blocks na parang pixels para mabuo ang mukha ni Donald Duck at yung block letters ng title."*

### Q3: "Ano ang ibig sabihin ng mga values sa `BH` tulad ng `E0H`, `10H`, at `20H`?"
> **Answer:** *"Sir, ayon po sa Lesson 7 slide 13 at slides 18–20, ang standard text-mode attribute byte ay binubuo ng background color sa upper 4 bits at foreground color sa lower 4 bits. Kapag `AH=06H` at `AL=00H`, background fill po ang ginagawa. Kaya ang `20H` ay Green (screen background), ang `10H` ay Blue (sumbrero ni Donald), ang `E0H` ay Yellow (tuka ni Donald at title letters), ang `F0H` ay White (mukha), at ang `00H` ay Black (outlines)."*

### Q4: "Bakit `INT 21H, AH=08H` ang ginamit niyo sa input imbes na `AH=01H`?"
> **Answer:** *"Sir, sa Lesson 7 slide 8 po, ang `AH=01H` ay nagbabasa ng keyboard with echo—ibig sabihin lilitaw po sa screen yung letter kapag pinindot. Ang `AH=08H` naman po ay nagbabasa without echo. Dahil graphic screen po ito, kailangan po `AH=08H` para hindi mag-print ng 'w', 'a', 's', 'd' sa ibabaw ng drawing habang gumagalaw ang character."*

### Q5: "Paano niyo ginawa yung drawing ng 'DONALD DUCK' sa upper right?"
> **Answer:** *"Sir, alinsunod po sa instruction ninyo sa class recording, hindi po kami nag-print ng plain font string doon. Bawat letra po ng 'DONALD DUCK' ay iginuhit namin gamit ang 5x4 block layout gamit ang `INT 10H, AH=06H` kung saan ang 'DONALD' ay kulay Yellow (`E0H`) at ang 'DUCK' ay kulay White (`F0H`) sa loob ng blue background card."*

### Q6: "Paano gumagana yung 5 facial expressions (keys 1 to 5) nang hindi bumabagal ang emulator?"
> **Answer:** *"Sir, may variable po tayong `EXPR` na nagtatago ng current expression (1 to 5). Kapag pinindot ang 1, 2, 3, 4, o 5, hindi na po natin kailangang burahin o i-redraw ang sumbrero at pisngi. Dumidiretso po tayo sa `DRAW_FACE_ONLY:` kung saan ni-re-reset lang po natin ang eye at mouth area gamit ang white at green blocks, tapos iginuguhit lang po ang specific pupils, kilay, at lower beak para sa piniling expression."*

### Q7: "Bakit walang `CALL` at `RET` sa code ninyo?"
> **Answer:** *"Sir, sinadya po naming panatilihing flat ang code sa loob ng `MAIN PROC` gaya po ng ipinakita niyo sa `finals.asm` at `Sakuragi.asm`. Sa paraang ito, maiiwasan po natin ang stack overhead at nasisiguro nating 100% compliant tayo sa pinaka-basic na structure ng inyong sample files nang walang anumang advanced sub-procedure issues."*

### Q8: "Bakit may mga intermediate labels kayo tulad ng `CHECK_Q_UPPER` at `WAIT_KEY`?"
> **Answer:** *"Sir, sa 8086 assembly po (Lesson 6 slide 76), ang conditional jumps tulad ng `JE` at `JNE` ay Short Jumps lamang na may limit na -128 hanggang +127 bytes. Kapag malayo po ang luluksuhan, nagkaka-error po sa Emu8086 ng 'jump out of range'. Kaya gumamit po kami ng two-step branching kung saan nag-`JE` o `JNE` muna sa isang malapit na label bago mag-unconditional `JMP`, na suportado ang mas malayong distansya."*

### Q9: "Anong memory model ang ginamit niyo at bakit?"
> **Answer:** *"Sir, `.MODEL SMALL` po ang ginamit natin alinsunod sa Lesson 6 slide 3. Ibig sabihin po nito, mayroon tayong isang Code Segment (hanggang 64KB) at isang Data Segment (hanggang 64KB), na siyang standard at sapat para sa ating standalone assembly program."*

### Q10: "Paano niyo pinipigilan si Donald Duck na lumabas sa screen o pumasok sa right panel?"
> **Answer:** *"Sir, bago po mag-`DEC` o mag-`INC` sa `ROW` at `COL`, may comparison checks po tayo:
* `CMP ROW, 00H` bago mag-Move Up
* `CMP ROW, 04H` bago mag-Move Down
* `CMP COL, 01H` bago mag-Move Left
* `CMP COL, 08H` bago mag-Move Right  
Kapag naabot na po ang limit, nag-j-jump po agad pabalik sa `WAIT_KEY` para hindi lumampas sa screen o tumama sa right panel."*

---

## 6. How to Run in Emu8086

1. Open **Emu8086**.
2. Click **Open** and select `DONALD_DUCK.asm`.
3. *(If you encounter the MyBuild error on your machine)*: Go to **assembler** in the top menu $\rightarrow$ **Set Output Directory...** $\rightarrow$ select your Desktop or local working folder $\rightarrow$ click **OK**.
4. Click **Compile & Run** (or click **Emulate**, then click **Run**).
5. The 80x25 green screen will display with Donald Duck on the left, the block-art title on the top right, and your group credentials on the bottom right.
6. Test keys:
   * Press `1`, `2`, `3`, `4`, `5` to switch facial expressions.
   * Press `SPACE` to cycle through all expressions.
   * Press `W`, `A`, `S`, `D` to walk Donald Duck across the viewport.
   * Press `Q` to quit.
