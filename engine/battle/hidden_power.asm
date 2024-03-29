HiddenPowerDamage: ; fbced
; Override Hidden Power's type and power based on the user's DVs.

	ld hl, BattleMonDVs
	ld a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld hl, EnemyMonDVs
.got_dvs


; Power:

; Take the top bit from each stat

	; Attack
	ld a, [hl]
	swap a
	and 8

	; Defense
	ld b, a
	ld a, [hli]
	and 8
	srl a
	or b

	; Speed
	ld b, a
	ld a, [hl]
	swap a
	and 8
	srl a
	srl a
	or b

	; Special
	ld b, a
	ld a, [hl]
	and 8
	srl a
	srl a
	srl a
	or b

; Multiply by 5
	ld b, a
	add a
	add a
	add b

; Add Special & 3
	ld b, a
	ld a, [hld]
	and 3
	add b

; Divide by 2 and add 30 + 1
	srl a
	add 30
	inc a

	ld d, a


; Type:

	; Def & 3
	ld a, [hl]
	and 3
	ld b, a

	; + (Atk & 3) << 2
	ld a, [hl]
	and 3 << 4
	swap a
	add a
	add a
	or b

; Skip Normal
	inc a

.done

; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	ld [hl], a

; Get the rest of the damage formula variables
; based on the new type, but keep base power.
	ld a, d
	push af
	farcall BattleCommand_DamageStats ; damagestats
	pop af
	ld d, a
	ret
; fbd54
