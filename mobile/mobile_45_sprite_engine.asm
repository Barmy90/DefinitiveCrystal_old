Function115d99: ; 115d99
	ld de, GFX_11601a
	ld hl, vTiles0 tile $60
	lb bc, BANK(GFX_11601a), $14
	call Get2bpp
	xor a
	ld [wc305], a
	ld [wc306], a
	ld [wc309], a
	ld [wc30a], a
	ld [wc30b], a
	ld [wc30c], a
	ld a, $10
	ld [wc307], a
	ld a, $18
	ld [wc308], a
	ret

; 115dc3

Function115dc3: ; 115dc3
	xor a
	ld [wc305], a
	ld a, $a0
	ld hl, Sprites + 31 * 4
	ld bc, 8 * 4
	call ByteFill
	ret

; 115dd3

Function115dd3: ; 115dd3
	ld a, [wc305]
	and a
	ret z
	ld a, $a0
	ld hl, Sprites + 31 * 4
	ld bc, 8 * 4
	call ByteFill
	call Function115e22
	ld a, [wc309]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_115e86
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld de, Sprites + 31 * 4
	ld a, [wc307]
	ld c, a
	ld a, [wc308]
	ld b, a
	ld a, [hli]
.asm_115e04
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .asm_115e04
	ret

; 115e18

Function115e18: ; 115e18
	ld a, c
	ld [wc30a], a
	xor a
	ld [wc30b], a
	jr Function115e2b

; 115e22

Function115e22: ; 115e22
	ld hl, wc30c
	dec [hl]
	ret nz
	ld hl, wc30b
	inc [hl]

Function115e2b: ; 115e2b
	ld a, [wc30a]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_115e59
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	pop hl
	ld a, [wc30b]
	sla a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	cp $ff
	jr nz, .not_end
	xor a
	ld [wc30b], a
	jr Function115e2b

.not_end
	ld [wc309], a
	ld a, [hl]
	ld [wc30c], a
	ret

; 115e59

Unknown_115e59:
	dw Unknown_115e61
	dw Unknown_115e6c
	dw Unknown_115e76
	dw Unknown_115e79

; OAM idx (see Unknown_115e86), flip flags/duration
Unknown_115e61: ; 115e61
	db $04, $08
	db $05, $08
	db $06, $08
	db $07, $08
	db $08, $08
	db -1

Unknown_115e6c: ; 115e6c
	db $01, $08
	db $02, $08
	db $03, $08
	db $09, $08
	db $0a, $08
Unknown_115e76: ; 115e76
	db $00, $08
	db -1

Unknown_115e79: ; 115e79
	db $0b, $08
	db $0c, $08
	db $0d, $08
	db $0e, $08
	db $0f, $08
	db $00, $08
	db -1
; 115e86

Unknown_115e86:
	dw Unknown_115ea6
	dw Unknown_115eb7
	dw Unknown_115ecc
	dw Unknown_115ee1
	dw Unknown_115ef6
	dw Unknown_115f13
	dw Unknown_115f30
	dw Unknown_115f4d
	dw Unknown_115f6a
	dw Unknown_115f87
	dw Unknown_115f9c
	dw Unknown_115fb1
	dw Unknown_115fc6
	dw Unknown_115fdb
	dw Unknown_115ff0
	dw Unknown_116005

Unknown_115ea6: ; 115ea6
	db 4
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115eb7: ; 115eb7
	db 5
	dsprite   0, 0,   1, 0, $64, $00
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115ecc: ; 115ecc
	db 5
	dsprite   0, 0,   1, 0, $65, $00
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115ee1: ; 115ee1
	db 5
	dsprite   0, 0,   1, 0, $66, $00
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115ef6: ; 115ef6
	db 7
	dsprite   0, 0,   0, 0, $67, $01
	dsprite   1, 0,   0, 0, $68, $01
	dsprite   2, 0,   0, 0, $6d, $00
	dsprite   2, 0,   1, 0, $69, $00
	dsprite   2, 0,   2, 0, $6a, $00
	dsprite   3, 0,   1, 0, $6b, $00
	dsprite   3, 0,   2, 0, $6c, $00

Unknown_115f13: ; 115f13
	db 7
	dsprite   0, 0,   0, 0, $67, $01
	dsprite   1, 0,   0, 0, $68, $01
	dsprite   2, 0,   0, 0, $6e, $00
	dsprite   2, 0,   1, 0, $69, $00
	dsprite   2, 0,   2, 0, $6a, $00
	dsprite   3, 0,   1, 0, $6b, $00
	dsprite   3, 0,   2, 0, $6c, $00

Unknown_115f30: ; 115f30
	db 7
	dsprite   0, 0,   0, 0, $67, $01
	dsprite   1, 0,   0, 0, $68, $01
	dsprite   2, 0,   0, 0, $6f, $00
	dsprite   2, 0,   1, 0, $69, $00
	dsprite   2, 0,   2, 0, $6a, $00
	dsprite   3, 0,   1, 0, $6b, $00
	dsprite   3, 0,   2, 0, $6c, $00

Unknown_115f4d: ; 115f4d
	db 7
	dsprite   0, 0,   0, 0, $67, $01
	dsprite   1, 0,   0, 0, $68, $01
	dsprite   2, 0,   0, 0, $70, $00
	dsprite   2, 0,   1, 0, $69, $00
	dsprite   2, 0,   2, 0, $6a, $00
	dsprite   3, 0,   1, 0, $6b, $00
	dsprite   3, 0,   2, 0, $6c, $00

Unknown_115f6a: ; 115f6a
	db 7
	dsprite   0, 0,   0, 0, $67, $01
	dsprite   1, 0,   0, 0, $68, $01
	dsprite   2, 0,   0, 0, $71, $00
	dsprite   2, 0,   1, 0, $69, $00
	dsprite   2, 0,   2, 0, $6a, $00
	dsprite   3, 0,   1, 0, $6b, $00
	dsprite   3, 0,   2, 0, $6c, $00

Unknown_115f87: ; 115f87
	db 5
	dsprite   0, 0,   1, 0, $72, $00
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115f9c: ; 115f9c
	db 5
	dsprite   0, 0,   1, 0, $73, $00
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115fb1: ; 115fb1
	db 5
	dsprite   0, 1,   1, 0, $64, $60
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115fc6: ; 115fc6
	db 5
	dsprite   0, 1,   1, 0, $65, $60
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115fdb: ; 115fdb
	db 5
	dsprite   0, 1,   1, 0, $66, $60
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_115ff0: ; 115ff0
	db 5
	dsprite   0, 1,   1, 0, $72, $60
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01

Unknown_116005: ; 116005
	db 5
	dsprite   0, 1,   1, 0, $73, $60
	dsprite   1, 0,   0, 0, $60, $01
	dsprite   1, 0,   1, 0, $61, $01
	dsprite   2, 0,   0, 0, $62, $01
	dsprite   2, 0,   1, 0, $63, $01
; 11601a

GFX_11601a:: ; 11601a
INCBIN "gfx/unknown/11601a.2bpp"


Function11615a: ; 11615a
	xor a
	ld [wc30d], a
	ld [$c319], a
	ld [wc310], a
	ld [wc311], a
	ld [wc312], a
	ld [wc313], a
	ld [wc314], a
	ld [wc314 + 1], a
	ld [wc314 + 4], a
	ld [wc3f6], a
	ld [wc3f8], a
	ld [wc3f2], a
	ld [wc3f4], a
	ld a, $24
	ld [wc3f5], a
	ld a, $7
	ld [wc3f7], a
	ld a, $b0
	ld [wc30e], a
	ld [wc3f1], a
	ld a, $48
	ld [wc30f], a
	ld [wc3f3], a
	ret

; 11619d

Function11619d: ; 11619d
	ld a, [wc30d]
	and a
	ret z
	ld a, [$c319]
	cp $2
	jr c, .asm_1161b4
	ld a, $a0
	ld hl, Sprites
	ld bc, $0064
	call ByteFill

.asm_1161b4
	call Function1161b8
	ret

; 1161b8

Function1161b8: ; 1161b8
	ld a, [$c319]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

; 1161c7

.Jumptable: ; 1161c7
	dw Function1161d5
	dw Function116294
	dw Function1162cb
	dw Function1162f2
	dw Function1163c0
	dw Function11636e
	dw Function116441
; 1161d5

Function1161d5: ; 1161d5
	ld a, [rSVBK]
	push af

	ld a, $6
	ld [rSVBK], a

	ld hl, Unknown_117356
	ld de, wDecompressScratch
	ld bc, $0300
	call CopyBytes

	di

.wait_for_vblank
; Wait until a vblank would occur had interrupts not just been disabled.
	ld a, [rLY]
	cp $91
	jr nz, .wait_for_vblank

	ld a, $d0
	ld [rHDMA1], a
	ld a, $0
	ld [rHDMA2], a
	ld a, $1c
	ld [rHDMA3], a
	xor a
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $d0
	ld [rHDMA1], a
	ld a, $80
	ld [rHDMA2], a
	ld a, $1c
	ld [rHDMA3], a
	ld a, $80
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $d1
	ld [rHDMA1], a
	ld a, $0
	ld [rHDMA2], a
	ld a, $1d
	ld [rHDMA3], a
	xor a
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $1
	ld [rVBK], a

	ld a, $d1
	ld [rHDMA1], a
	ld a, $80
	ld [rHDMA2], a
	ld a, $1c
	ld [rHDMA3], a
	xor a
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $d2
	ld [rHDMA1], a
	ld a, $0
	ld [rHDMA2], a
	ld a, $1c
	ld [rHDMA3], a
	ld a, $80
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $d2
	ld [rHDMA1], a
	ld a, $80
	ld [rHDMA2], a
	ld a, $1d
	ld [rHDMA3], a
	xor a
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	xor a
	ld [rVBK], a

	ei

	pop af
	ld [rSVBK], a

	farcall ReloadMapPart
	ld a, $8
	ld [MusicFade], a
	ld de, MUSIC_MOBILE_ADAPTER
	ld a, e
	ld [MusicFadeID], a
	ld a, d
	ld [MusicFadeID + 1], a
	ld a, [$c319]
	inc a
	ld [$c319], a
	ret

; 11628c

MenuDataHeader_11628c: ; 11628c
	db $40 ; flags
	db  6,  0 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 116294

Function116294: ; 116294
	farcall Function170d02
	ld a, [$c319]
	inc a
	ld [$c319], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, UnknBGPals palette 6
	ld de, $c320
	ld bc, 2 palettes
	call CopyBytes
	ld hl, Palette_11734e
	ld de, UnknBGPals palette 7
	ld bc, 1 palettes
	call CopyBytes
	call SetPalettes
	pop af
	ld [rSVBK], a
	ld a, $30
	ld [hWY], a
	ret

; 1162cb

Function1162cb: ; 1162cb
	farcall Function170cc6
	ld a, [$c319]
	inc a
	ld [$c319], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_11730e
	ld de, UnknOBPals + 2 palettes
	ld bc, 6 palettes
	call CopyBytes
	call SetPalettes
	pop af
	ld [rSVBK], a
	ret

; 1162f2

Function1162f2: ; 1162f2
	call Function11659d
	call Function116758
	call Function1167a6
	ld a, [wc310]
	cp EGG
	ret z
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1168c5
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wc30e]
	ld c, a
	ld a, [wc30f]
	ld b, a
	ld a, [wc314 + 4]
	ld e, a
	ld a, [hli]
	sub e
	ld de, Sprites + $24
.asm_116321
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .asm_116321
	call Function116468
	ld a, [wc3f5]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1168c5
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wc3f1]
	ld c, a
	ld a, [wc3f3]
	ld b, a
	ld a, [wc3f8]
	ld e, a
	ld a, [hli]
	sub e
	ld de, Sprites
.asm_11635a
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .asm_11635a
	ret

; 11636e

Function11636e: ; 11636e
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld de, UnknBGPals
	ld bc, $0040
	call CopyBytes
	pop af
	ld [rSVBK], a
	call SetPalettes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, $a0
	ld hl, Sprites
	ld bc, 16 * 4
	call ByteFill
	ld a, $90
	ld [hWY], a
	call UpdateSprites
	pop af
	ld [rSVBK], a
	farcall ReloadMapPart
	ld a, $8
	ld [MusicFade], a
	ld a, [wMapMusic]
	ld [MusicFadeID], a
	xor a
	ld [MusicFadeID + 1], a
	xor a
	ld [$c319], a
	ld [wc30d], a
	ret

; 1163c0

Function1163c0: ; 1163c0
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, $a0
	ld hl, Sprites
	ld bc, 16 * 4
	call ByteFill
	call DelayFrame
	farcall Function14146
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, $c320
	ld de, wd030
	ld bc, $0010
	call CopyBytes
	pop af
	ld [rSVBK], a
	call SetPalettes
	call DelayFrame
	ld a, $90
	ld [hWY], a
	call UpdateSprites
	farcall Function14157
	pop af
	ld [rSVBK], a
	farcall ReloadMapPart
	ld a, [wLinkMode]
	cp $4
	jr z, .asm_11642a
	ld a, $8
	ld [MusicFade], a
	ld a, [wMapMusic]
	ld [MusicFadeID], a
	xor a
	ld [MusicFadeID + 1], a
	jr .asm_116439

.asm_11642a
	ld a, $8
	ld [MusicFade], a
	ld a, $0
	ld [MusicFadeID], a
	ld a, $0
	ld [MusicFadeID + 1], a

.asm_116439
	xor a
	ld [$c319], a
	ld [wc30d], a
	ret

; 116441

Function116441: ; 116441
	farcall Function17d405
	ld a, $90
	ld [hWY], a
	farcall ReloadMapPart
	ld a, $8
	ld [MusicFade], a
	ld a, [wMapMusic]
	ld [MusicFadeID], a
	xor a
	ld [MusicFadeID + 1], a
	xor a
	ld [$c319], a
	ld [wc30d], a
	ret

; 116468

Function116468: ; 116468
	call Function116567
	ld a, [wc314]
	cp $d
	jr nz, .asm_1164a8
	ld hl, wc30e
	ld a, [hl]
	cp $50
	jr nc, .asm_116484
	ld a, $50
	sub [hl]
	add $50
	ld [wc3f1], a
	jr .asm_11648d

.asm_116484
	sub $50
	ld c, a
	ld a, $50
	sub c
	ld [wc3f1], a

.asm_11648d
	ld hl, wc30f
	ld a, [hl]
	cp $60
	jr nc, .asm_11649e
	ld a, $60
	sub [hl]
	add $60
	ld [wc3f3], a
	ret

.asm_11649e
	sub $60
	ld c, a
	ld a, $60
	sub c
	ld [wc3f3], a
	ret

.asm_1164a8
	ld hl, wc30e
	ld a, $b0
	cp [hl]
	jr nc, .asm_1164b8
	ld a, [wc3f1]
	and a
	jr z, .asm_11650b
	jr .asm_1164f2

.asm_1164b8
	ld a, [wc3f1]
	sub [hl]
	jr nc, .asm_1164c1
	xor $ff
	inc a

.asm_1164c1
	ld b, a
	ld c, $0
	ld a, $5
.asm_1164c6
	srl b
	rr c
	dec a
	jr nz, .asm_1164c6
	ld a, c
	ld [wc3fa], a
	ld a, b
	ld [wc3f9], a
	ld a, [wc3f1]
	sub [hl]
	jr c, .asm_1164f2
	ld c, $0
	ld a, [wc3fa]
	xor $ff
	add $1
	rl c
	ld [wc3fa], a
	ld a, [wc3f9]
	xor $ff
	add c
	ld [wc3f9], a

.asm_1164f2
	ld a, [wc3f2]
	ld l, a
	ld a, [wc3f1]
	ld h, a
	ld a, [wc3fa]
	ld e, a
	ld a, [wc3f9]
	ld d, a
	add hl, de
	ld a, l
	ld [wc3f2], a
	ld a, h
	ld [wc3f1], a

.asm_11650b
	ld hl, wc30f
	ld a, $b0
	cp [hl]
	jr c, .asm_11654d
	ld a, [wc3f3]
	sub [hl]
	jr nc, .asm_11651c
	xor $ff
	inc a

.asm_11651c
	ld b, a
	ld c, $0
	ld a, $5
.asm_116521
	srl b
	rr c
	dec a
	jr nz, .asm_116521
	ld a, c
	ld [wc3fc], a
	ld a, b
	ld [wc3fb], a
	ld a, [wc3f3]
	sub [hl]
	jr c, .asm_11654d
	ld c, $0
	ld a, [wc3fc]
	xor $ff
	add $1
	rl c
	ld [wc3fc], a
	ld a, [wc3fb]
	xor $ff
	add c
	ld [wc3fb], a

.asm_11654d
	ld a, [wc3f4]
	ld l, a
	ld a, [wc3f3]
	ld h, a
	ld a, [wc3fc]
	ld e, a
	ld a, [wc3fb]
	ld d, a
	add hl, de
	ld a, l
	ld [wc3f4], a
	ld a, h
	ld [wc3f3], a
	ret
