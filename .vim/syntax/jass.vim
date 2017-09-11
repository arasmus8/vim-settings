" Vim syntax file
" Language:     Jass
" Maintainer:   Me!

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

  syn region	jassComment	start="//" end="$" keepend
  syn region	jassString	start=+L\="+ skip=+\\\\\|\\"+ end=+"+
	syn region  jassLiteral start=+L\='+ end=+'+

  syn keyword	jassType	integer real boolean string code handle ability aidifficulty alliancetype attacktype blendmode boolexpr buff button camerafield camerasetup conditionfunc damagetype defeatcondition destructable dialog dialogevent effect effecttype event eventid fgamestate filterfunc fogmodifier fogstate force gamecache gamedifficulty gameevent gamespeed gamestate gametype group igamestate image item itempool itemtype leaderboard lightning limitop location mapcontrol mapdensity mapflag mapsetting mapvisibility multiboard multiboarditem pathingtype placement player playercolor playerevent playergameresult playerscore playerslotstate playerstate playerunitevent quest questitem race racepreference raritycontrol rect region sound soundtype startlocprio terraindeformation texmapflags texttag timer timerdialog trackable trigger triggeraction triggercondition ubersplat unit unitevent unitpool unitstate unittype version volumegroup weapontype weathereffect widget widgetevent array
  syn keyword	jassLang local set call function endfunction loop endloop if then elseif else endif takes returns true false null exitwhen and or not return nothing

if version >= 508 || !exists("did_c_syn_inits")
	if version < 508
		let did_c_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink jassComment	Comment
	HiLink jassType		Type
	HiLink jassLang		Statement
	HiLink jassString	String
	HiLink jassLiteral	Number

	delcommand HiLink
endif

let b:current_syntax = "jass"

