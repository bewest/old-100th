\version "2.11.32"

\header {
	title = "3. Doxology"
	poet = ""
	composer = ""
	arranger = ""
	translator = ""
	tagline = \markup { \fill-line { \with-url #"http://creativecommons.org/licenses/by/2.5/ca/" "License: Creative Commons Attribution 2.5" "Reactor Core Hymn Repository" \with-url #"http://hymns.reactor-core.org/" "http://hymns.reactor-core.org/" } }
	source = "A Christian-Israelite Hymn Book"
}

#(set-global-staff-size 14)
global = {
	\key g \major
	\time 4/4
	\set Staff.printPartCombineTexts = ##f
}

sopranointro = \relative g' { 
	\partial 2 g2 | g4 fis e d    | g2 a     | b 
}
soprano = \relative g' { 
	\partial 2 g2 | g4 fis e d    | g2 a     | b b       |
	b4 b a g      | c2 b          | a g      | a4 b a g  |
	e2 fis        | g d'          | b4 g a c | b2 a      |
	g1 \bar "||"
}
sopranoamen = \relative g' { 
	g1            | g \bar "|."
}
altointro = \relative g' { 
	\partial 2 d2 | e4 d b a       | b4 ( c ) d2 | d 
}
alto = \relative g' { 
	\partial 2 d2 | e4 d b a       | b4 ( c ) d2 | d dis      |
	e4 cis dis e  |  e4 ( fis ) g2 | fis e       | fis4 g e d |
	c2 e4 ( dis ) | e2 f           | fis4 e e a  | g2 fis     |
	g1
} 
altoamen = \relative g' { 
	e1             | d
} 
tenorintro = \relative f { 
	\partial 2 b2 | b4 a g a      | g2 g4 ( fis ) | g2 
}
tenor = \relative f { 
	\partial 2 b2 | b4 a g a      | g2 g4 ( fis ) | g2 fis      |
	g4 g a b      | c2 d          | d b           | d4 d c b    |
	g ( a ) b2    | b a           | b4 b c e      | d2 d4 ( c ) |
	b1
}
tenoramen = \relative f { 
	c'1            | b
}
bassintro = \relative f {
	\partial 2 g,2 | c4 d e fis    | e2 d       | g,
}
bass = \relative f {
	\partial 2 g,2 | c4 d e fis    | e2 d       | g, b       |
	e4 g fis e     | a,2 b4 ( c )  | d2 e       | d4 g, a b  |
	c2 b           | e d           | dis4 e c a | b ( c ) d2 |
	g1
}
bassamen = \relative f {
	c1           | g
}
\score { << 
		\new Staff { \global \tempo 4=110 \unfoldRepeats { \transpose g g { \sopranointro \tempo 4=127 s2 \tempo 4=110 \repeat unfold 1 { \soprano \tempo 4=127 s2 \tempo 4=110 } \sopranoamen \tempo 4=127 s2} } }
		\new Staff { \global \tempo 4=110 \unfoldRepeats { \transpose g g { \altointro \tempo 4=127 s2 \tempo 4=110 \repeat unfold 1 { \alto \tempo 4=127 s2 \tempo 4=110 } \altoamen \tempo 4=127 s2} } }
		\new Staff { \global \tempo 4=110 \unfoldRepeats { \transpose g g { \tenorintro \tempo 4=127 s2 \tempo 4=110 \repeat unfold 1 { \tenor \tempo 4=127 s2 \tempo 4=110 } \tenoramen \tempo 4=127 s2} } }
		\new Staff { \global \tempo 4=110 \unfoldRepeats { \transpose g g { \bassintro \tempo 4=127 s2 \tempo 4=110 \repeat unfold 1 { \bass \tempo 4=127 s2 \tempo 4=110 } \bassamen \tempo 4=127 s2} } }
	>>
	\midi {
		\context { \Staff midiInstrument = #"church organ" }
	}
}
