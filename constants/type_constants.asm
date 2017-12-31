; TypeNames indexes (see data/type_names.asm)
; also used in:
; - TypeMatchups (see data/type_matchups.asm)
; - Pokedex_SearchForMons.TypeConversionTable and Pokedex_PlaceSearchScreenTypeStrings.TypeStrings (see engine/pokedex.asm)
	const_def

MOVE_TYPES EQU const_value
	 ; Type order matters for Hidden Power
	 const NORMAL   ; 0
	 const FIGHTING ; 1
	 const FLYING   ; 2
	 const POISON   ; 3
	 const GROUND   ; 4
	 const ROCK     ; 5
	 const BUG      ; 6
	 const GHOST    ; 7
	 const STEEL    ; 8
	 const FIRE     ; 9
	 const WATER    ; 10
	 const GRASS    ; 11
	 const ELECTRIC ; 12
	 const PSYCHIC  ; 13
	 const ICE      ; 14
	 const DRAGON   ; 15
	 const DARK     ; 16
 	 const CURSE_T  ; 17

TYPES_END EQU const_value

UNUSED_TYPES EQU const_value
	const TYPE_10
	const TYPE_11
	const TYPE_12
	const TYPE_13
	const TYPE_14
	const TYPE_15
	const TYPE_16
	const TYPE_17
	const TYPE_18
UNUSED_TYPES_END EQU const_value

	const_def

MOVE_CATEGORIES EQU const_value
	const PHYSICAL
	const SPECIAL
	const STATUS

CATEGORIES_END EQU const_value
