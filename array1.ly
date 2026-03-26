\version "2.22.1"

\header {
  title = "Caramelldansen (Extracto) + Bata Afro-Cubano"
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

  % Intro (4 compases)
  a4^\mf a a a |
  cis,4 cis cis cis |
  d4 d d d |
  e4 e e e |

  % Estribillo principal (16 compases)
  a8 a a a a4 cis8 a |
  gis4 gis a4. a8 |
  a8 a a a a4 cis8 a |
  gis4 gis a2 |

  a8 a a a a4 cis8 a |
  gis4 gis a4. a8 |
  fis4 fis gis4. gis8 |
  e4 e fis2 |

  % Variacion melodica (8 compases)
  a4^\f cis e cis |
  a4 cis d b |
  a4 cis e cis |
  b4 d e2 |

  a4^\f cis e cis |
  a4 cis d b |
  cis4 b a gis |
  a2 r4 r4 |

  % Outro (6 compases)
  a4^\mf a a a |
  cis,4 cis cis cis |
  d4 d d d |
  e4 e e e |
  a,2 r4 r4 |
  r1 \bar "|."
}

harmonies = \chordmode {
  % 34 compases total (4 + 16 + 8 + 6)
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m | f | g |
  a1:m | e:m |
}

songLyrics = \lyricmode {
  In -- tro in -- stru -- men -- tal
  O o oa o o oa Ca -- ra -- mell -- dan -- sen
  O o oa o o oa Ca -- ra -- mell -- dan -- sen
  Vien -- ne a -- qui bai -- la con no -- so -- tros
  Mue -- ve las ma -- nos ha -- cia arri -- ba
  O o oa o o oa Ca -- ra -- mell -- dan -- sen
  Fi -- nal in -- stru -- men -- tal
}

% Mapeo de batá en un set de percusion de LilyPond:
%   hh  = iya (agudo)
%   tommh = itotele (medio)
%   tomml = okonkolo (grave)
% Patron base: campana de pulso + llamada/respuesta sincopada.
bataIntro = \drummode {
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
}

bataHookA = \drummode {
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
}

bataHookB = \drummode {
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
}

bataVariation = \drummode {
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
}

bataOutro = \drummode {
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh8 tommh hh tomml hh tommh hh tomml |
  hh4 tomml r2 |
  r1
}

bata = {
  \bataIntro
  \bataHookA
  \bataHookA
  \bataHookB
  \bataHookB
  \bataVariation
  \bataOutro
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }

    \new Staff \with {
      instrumentName = "Melodia"
      midiInstrument = #"synth lead"
    } <<
      \new Voice = "lead" { \melody }
    >>

    \new Lyrics \lyricsto "lead" { \songLyrics }

    \new DrumStaff \with {
      instrumentName = "Bata"
      shortInstrumentName = "Bt."
      midiInstrument = #"woodblock"
    } {
      \global
      \bata
    }
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
