\version "2.22.1"

\header {
  title = "Caramelldansen (Extracto)"
  composer = "Caramell (Speedycake Remix)"
  arranger = "Generado por AI"
  tagline = ##f
}

global = {
  \key a \minor
  \time 4/4
  \tempo "Allegro Velocissimo" 4 = 160
}

melody = \relative c'' {
  \global
  \set Staff.midiInstrument = #"synth lead"
  
  % Intro (4 compases) - Energía creciente
  a4^\mf a a a |
  cis,4 cis cis cis |
  d4 d d d |
  e4 e e e |
  
  % Estribillo Principal (Hook) - 16 compases
  % "O-o-oa-o-o-oa..."
  a8 a a a a4 cis8 a |
  gis4 gis a4. a8 |
  a8 a a a a4 cis8 a |
  gis4 gis a2 |
  
  a8 a a a a4 cis8 a |
  gis4 gis a4. a8 |
  fis4 fis gis4. gis8 |
  e4 e fis2 |
  
  % Variación Melódica - 8 compases
  a4^\f cis e cis |
  a4 cis d b |
  a4 cis e cis |
  b4 d e2 |
  
  a4^\f cis e cis |
  a4 cis d b |
  cis4 b a gis |
  a2 r4 r4 |
  
  % Outro (6 compases) - Fade out rítmico
  a4^\mf a a a |
  cis,4 cis cis cis |
  d4 d d d |
  e4 e e e |
  a,2 r4 r4 |
  r1 \bar "|."
}

harmonies = \chordmode {
  % Progresión simple de sintetizador
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
}

lyrics = \lyricmode {
  % Letra simplificada del hook icónico
  In -- tro in -- stru -- men -- tal
  O o oa o o oa Ca -- ra -- mell -- dan -- sen
  O o oa o o oa Ca -- ra -- mell -- dan -- sen
  Vien -- ne a -- qui baila con no -- so -- tros
  Mue -- ve las ma -- nos ha -- cia arri -- ba
  O o oa o o oa Ca -- ra -- mell -- dan -- sen
  Fi -- nal in -- stru -- men -- tal
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Staff \with {
      instrumentName = "Melodía"
      midiInstrument = #"synth lead"
    } { \melody }
    \new Lyrics \lyricsto "melody" { \lyrics }
  >>
  \layout {
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
    ragged-last = ##t
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 160 4)
    }
  }
}