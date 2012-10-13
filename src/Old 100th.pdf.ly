\version "2.11.32"

\header {
	title = "100. Old 100th"
	poet = ""
	composer = "Loys Bourgeois (c.1510 – c.1560)"
	arranger = "Ben West"
	translator = ""
	tagline = \markup { \fill-line { \with-url #"http://creativecommons.org/licenses/by/2.5/ca/" "License: Creative Commons Attribution 2.5" "Reactor Core Hymn Repository" \with-url #"http://hymns.reactor-core.org/" "http://hymns.reactor-core.org/" } }
	source = "Pseaumes Octante Trois de David (1551)"
}

#(set-global-staff-size 14)
#(set-default-paper-size "letter" 'portrait)

\paper {
	pagenumber = no
	linewidth = 120\mm
	indent = 0\mm
}

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
Words = <<
\lyricsto "sopvox" \context Lyrics = a { \set stanza = "1. "
}
\lyricsto "sopvox" \context Lyrics = b { \set stanza = "2. "
}
\lyricsto "sopvox" \context Lyrics = c { \set stanza = "3. "
}
\lyricsto "sopvox" \context Lyrics = d { \set stanza = "4. "
}
\lyricsto "sopvox" \context Lyrics = e { \set stanza = "5. "
}
\lyricsto "sopvox" \context Lyrics = f { \set stanza = "6. "
}
>>
\score { \new ChoirStaff << 
	\new Staff << \new Voice = sopvox { \voiceOne \global \clef treble \transpose g g { \soprano \sopranoamen } }
		\new Voice = altvox { \voiceTwo \transpose g g { \alto \altoamen } } >>
	\new Lyrics \Words
	\new Staff << \new Voice = tnrvox { \voiceOne \global \clef bass \transpose g g { \tenor \tenoramen } }
		\new Voice = bssvox { \voiceTwo \transpose g g { \bass \bassamen } } >>
	>>
	\layout {
		\context { \Score \override MetronomeMark #'transparent = ##t }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \ChoirStaff \accepts "Lyrics" }
		\context {
			\Lyrics \override LyricSpace #'minimum-distance = #1.2
			\override LyricText #'self-alignment-X = #LEFT
			\consists "Bar_engraver"
			\consists "Separating_line_group_engraver"
			\override BarLine #'transparent = ##t
		}
	}
}
