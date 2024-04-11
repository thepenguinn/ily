.module ily

.area CSEG (ABS)

.org 0x0000

main:
    mov a, #0x77
    mov r0, a
    mov r1, #0x0f

look_for_key_press:
    orl a, r1
    mov p1, a
    mov a, p1
    cpl a
    anl a, r1
    mov b, a

    jnz key_pressed

update_out:
    mov a, r0
    rr a
    mov r0, a
    sjmp look_for_key_press

key_pressed:
    mov a, r0
    cpl a
    anl a, r1
    cjne a, b, not_equal
    rrc a
    sjmp gotem

not_equal:
    mov a, r0
    anl a, r1
    add a, b

gotem:
    add a, #seven_seg_lookup_table
    movc a, @a+dptr
    mov p2, a
    sjmp update_out

seven_seg_lookup_table:
.byte 0x1a
.byte 0xc2
.byte 0x46
.byte 0xe7
.byte 0xfa
.byte 0xef
.byte 0x36
.byte 0xbc
.byte 0x82
.byte 0x52
.byte 0x48
.byte 0x13
.byte 0x0e
.byte 0x06
.byte 0x27
.byte 0x2d
.byte 0x07
.byte 0x02
.byte 0x22
.byte 0xca
.byte 0xad
.byte 0xf2
.byte 0x87
