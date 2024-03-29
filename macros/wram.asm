; Used in wram.asm

flag_array: MACRO
	ds ((\1) + 7) / 8
ENDM

box_struct: MACRO
\1Species::        db
\1Item::           db
\1Moves::          ds NUM_MOVES
\1ID::             dw
\1Exp::            ds 3
\1StatExp::
\1HPExp::          dw
\1AtkExp::         dw
\1DefExp::         dw
\1SpdExp::         dw
\1SpcExp::         dw
\1DVs::            dw
\1PP::             ds NUM_MOVES
\1Happiness::      db
\1PokerusStatus::  db
\1CaughtData::
\1CaughtTime::
\1CaughtLevel::    db
\1CaughtGender::
\1CaughtLocation:: db
\1Level::          db
\1End::
ENDM

party_struct: MACRO
	box_struct \1
\1Status::         db
\1Unused::         db
\1HP::             dw
\1MaxHP::          dw
\1Stats:: ; big endian
\1Attack::         dw
\1Defense::        dw
\1Speed::          dw
\1SpclAtk::        dw
\1SpclDef::        dw
\1StatsEnd::
ENDM

red_box_struct: MACRO
\1Species::    db
\1HP::         dw
\1BoxLevel::   db
\1Status::     db
\1Type::
\1Type1::      db
\1Type2::      db
\1CatchRate::  db
\1Moves::      ds NUM_MOVES
\1OTID::       dw
\1Exp::        ds 3
\1HPExp::      dw
\1AttackExp::  dw
\1DefenseExp:: dw
\1SpeedExp::   dw
\1SpecialExp:: dw
\1DVs::        dw
\1PP::         ds NUM_MOVES
ENDM

red_party_struct: MACRO
	red_box_struct \1
\1Level::      db
\1Stats::
\1MaxHP::      dw
\1Attack::     dw
\1Defense::    dw
\1Speed::      dw
\1Special::    dw
ENDM


battle_struct: MACRO
\1Species::   db
\1Item::      db
\1Moves::     ds NUM_MOVES
\1MovesEnd::
\1DVs::       dw
\1PP::        ds NUM_MOVES
\1Happiness:: db
\1Level::     db
\1Status::    ds 2
\1HP::        dw
\1MaxHP::     dw
\1Stats:: ; big endian
\1Attack::    dw
\1Defense::   dw
\1Speed::     dw
\1SpclAtk::   dw
\1SpclDef::   dw
\1StatsEnd::
\1Type::
\1Type1::     db
\1Type2::     db
\1StructEnd::
ENDM

box: MACRO
\1::
\1Count::           db
\1Species::         ds MONS_PER_BOX + 1
\1Mons::
\1Mon1::            box_struct \1Mon1
\1Mon2::            ds BOXMON_STRUCT_LENGTH * (MONS_PER_BOX +- 1)
\1MonOT::           ds NAME_LENGTH * MONS_PER_BOX
\1MonNicknames::    ds PKMN_NAME_LENGTH * MONS_PER_BOX
\1MonNicknamesEnd::
\1End::             ds 2 ; padding
ENDM


map_connection_struct: MACRO
\1ConnectedMapGroup::       db
\1ConnectedMapNumber::      db
\1ConnectionStripPointer::  dw
\1ConnectionStripLocation:: dw
\1ConnectionStripLength::   db
\1ConnectedMapWidth::       db
\1ConnectionStripYOffset::  db
\1ConnectionStripXOffset::  db
\1ConnectionWindow::        dw
ENDM

channel_struct: MACRO
; Addreses are Channel1 (c101).
\1MusicID::           dw
\1MusicBank::         db
\1Flags::             db ; 0:on/off 1:subroutine 3:sfx 4:noise 5:rest
\1Flags2::            db ; 0:vibrato on/off 2:duty 4:cry pitch
\1Flags3::            db ; 0:vibrato up/down
\1MusicAddress::      dw
\1LastMusicAddress::  dw
                      dw
\1NoteFlags::         db ; 5:rest
\1Condition::         db ; conditional jumps
\1DutyCycle::         db ; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
\1Intensity::         db ; hi:pressure lo:velocity
\1Frequency:: ; 11 bits
\1FrequencyLo::       db
\1FrequencyHi::       db
\1Pitch::             db ; 0:rest 1-c:note
\1Octave::            db ; 7-0 (0 is highest)
\1PitchOffset::       db ; raises existing octaves (to repeat phrases)
\1NoteDuration::      db ; frames remaining for the current note
\1Field0x16::         ds 1 ; c117
                      ds 1 ; c118
\1LoopCount::         db
\1Tempo::             dw
\1Tracks::            db ; hi:left lo:right
\1SFXDutyLoop::       db ; c11d
\1VibratoDelayCount:: db ; initialized by \1VibratoDelay
\1VibratoDelay::      db ; number of frames a note plays until vibrato starts
\1VibratoExtent::     db
\1VibratoRate::       db ; hi:frames for each alt lo:frames to the next alt
\1PitchWheelTarget::  dw ; frequency endpoint for pitch wheel
\1PitchWheelAmount::  db ; c124
\1PitchWheelAmountFraction::   db ; c125
\1Field0x25::         db ; c126
                      ds 1 ; c127
\1CryPitch::          dw
\1Field0x29::         ds 1
\1Field0x2a::         ds 2
\1Field0x2c::         ds 1
\1NoteLength::        db ; frames per 16th note
\1Field0x2e::         ds 1 ; c12f
\1Field0x2f::         ds 1 ; c130
\1Field0x30::         ds 1 ; c131
                      ds 1 ; c132
ENDM

battle_tower_struct: MACRO
\1Name:: ds NAME_LENGTH +- 1
\1TrainerClass:: ds 1
\1Pkmn1:: party_struct \1Pkmn1
\1Pkmn1Name:: ds PKMN_NAME_LENGTH
\1Pkmn1NameEnd::
\1Pkmn2:: party_struct \1Pkmn2
\1Pkmn2Name:: ds PKMN_NAME_LENGTH
\1Pkmn2NameEnd::
\1Pkmn3:: party_struct \1Pkmn3
\1Pkmn3Name:: ds PKMN_NAME_LENGTH
\1Pkmn3NameEnd::
\1TrainerData:: ds BATTLETOWER_TRAINERDATALENGTH
\1TrainerEnd::
ENDM

mailmsg: MACRO
\1Message::    ds MAIL_MSG_LENGTH
\1MessageEnd:: ds 1
\1Author::     ds PLAYER_NAME_LENGTH
\1AuthorNationality:: ds 2
\1AuthorID::   dw
\1Species::    db
\1Type::       db
\1End::
ENDM

roam_struct: MACRO
\1Species::   db
\1Level::     db
\1MapGroup::  db
\1MapNumber:: db
\1HP::        db
\1DVs::       dw
ENDM

bugcontestwinner: MACRO
\1WinnerID:: db
\1Mon::      db
\1Score::    dw
ENDM

hof_mon: MACRO
\1Species::  db
\1ID::       dw
\1DVs::      dw
\1Level::    db
\1Nickname:: ds PKMN_NAME_LENGTH +- 1
\1End::
ENDM

hall_of_fame: MACRO
\1WinCount:: db
\1Mon1:: hof_mon \1Mon1
\1Mon2:: hof_mon \1Mon2
\1Mon3:: hof_mon \1Mon3
\1Mon4:: hof_mon \1Mon4
\1Mon5:: hof_mon \1Mon5
\1Mon6:: hof_mon \1Mon6
\1End:: ds 1
ENDM

link_battle_record: MACRO
\1Name::   ds NAME_LENGTH +- 1
\1ID::     dw
\1Wins::   dw
\1Losses:: dw
\1Draws::  dw
ENDM

trademon: MACRO
\1Species::     db ; wc6d0 | wc702
\1SpeciesName:: ds PKMN_NAME_LENGTH ; wc6d1 | wc703
\1Nickname::    ds PKMN_NAME_LENGTH ; wc6dc | wc70e
\1SenderName::  ds NAME_LENGTH ; wc6e7 | wc719
\1OTName::      ds NAME_LENGTH ; wc6f2 | wc724
\1DVs::         dw ; wc6fd | wc72f
\1ID::          dw ; wc6ff | wc731
\1CaughtData::  db ; wc701 | wc733
\1End::
ENDM

move_struct: MACRO
\1Animation:: ds 1
\1Effect:: ds 1
\1Power:: ds 1
\1Type:: ds 1
\1Accuracy:: ds 1
\1PP:: ds 1
\1EffectChance:: ds 1
\1Category:: ds 1
endm

slot_reel: MACRO
\1ReelAction::   db
\1TilemapAddr::  dw
\1Position::     db
\1SpinDistance:: db
\1SpinRate::     db
\1OAMAddr::      dw
\1XCoord::       db
\1ManipCounter:: db
\1ManipDelay::   db
\1Slot0b::       ds 1
\1Slot0c::       ds 1
\1Slot0d::       ds 1
\1Slot0e::       ds 1
\1StopDelay::    db
ENDM

object_struct: MACRO
\1Struct::
\1Sprite::            db
\1MapObjectIndex::    db
\1SpriteTile::        db
\1MovementType::      db
\1Flags::             dw
\1Palette::           db
\1Walking::           db
\1Direction::         db
\1StepType::          db
\1StepDuration::      db
\1Action::            db
\1ObjectStepFrame::   db
\1Facing::            db
\1StandingTile::      db ; collision
\1LastTile::          db ; collision
\1StandingMapX::      db
\1StandingMapY::      db
\1LastMapX::          db
\1LastMapY::          db
\1ObjectInitX::       db
\1ObjectInitY::       db
\1Radius::            db
\1SpriteX::           db
\1SpriteY::           db
\1SpriteXOffset::     db
\1SpriteYOffset::     db
\1MovementByteIndex:: db
\1Object28::          ds 1
\1Object29::          ds 1
\1Object30::          ds 1
\1Object31::          ds 1
\1Range::             db
	ds 7
\1StructEnd::
ENDM

map_object: MACRO
\1Object::
\1ObjectStructID::  db
\1ObjectSprite::    db
\1ObjectYCoord::    db
\1ObjectXCoord::    db
\1ObjectMovement::  db
\1ObjectRadius::    db
\1ObjectHour::      db
\1ObjectTimeOfDay:: db
\1ObjectColor::     db
\1ObjectRange::     db
\1ObjectScript::    dw
\1ObjectEventFlag:: dw
	ds 2
ENDM

sprite_anim_struct: MACRO
\1Index::          db
\1FramesetID::     db
\1AnimSeqID::      db
\1TileID::         db
\1XCoord::         db
\1YCoord::         db
\1XOffset::        db
\1YOffset::        db
\1Duration::       db
\1DurationOffset:: db
\1FrameIndex::     db
\1Sprite0b::       ds 1
\1Sprite0c::       ds 1
\1Sprite0d::       ds 1
\1Sprite0e::       ds 1
\1Sprite0f::       ds 1
ENDM

battle_anim_struct: MACRO
; Placeholder until we can figure out what it all means
\1_Index::              db
\1_Anim01::             ds 1
\1_Anim02::             ds 1
\1_FramesetIndex::      db
\1_FunctionIndex::      db
\1_Anim05::             ds 1
\1_TileID::             db
\1_XCoord::             db
\1_YCoord::             db
\1_XOffset::            db
\1_YOffset::            db
\1_Anim0b::             ds 1
\1_Anim0c::             ds 1
\1_Anim0d::             ds 1
\1_AnonJumptableIndex:: db
\1_Anim0f::             ds 1
\1_Anim10::             ds 1
\1_Anim11::             ds 1
\1_Anim12::             ds 1
\1_Anim13::             ds 1
\1_Anim14::             ds 1
\1_Anim15::             ds 1
\1_Anim16::             ds 1
\1_Anim17::             ds 1
ENDM

battle_bg_effect: MACRO
\1_Function:: db
\1_01::       ds 1
\1_02::       ds 1
\1_03::       ds 1
ENDM
