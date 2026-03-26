\version "2.22.1"

\header {
  title = "Caramelldansen (Extracto) - Version Sinfonica para Piano"
  composer = "Caramell (Speedycake Remix)"
  arranger = "Generado por AI"
  tagline = ##f
}

global = {
  \key a \minor
  \time 4/4
  \tempo "Allegro energico" 4 = 160
}

rightHand = \relative c'' {
  \global
  \clef treble
  \dynamicUp

  % Intro (4 compases)
  <a c e a>2^\mp( <b d f b>2) |
  <cis, e a cis>2( <d fis b d>2) |
  <d f a d>2( <e g c e>2) |
  <e g b e>1^\< |

  % Hook (8 compases)
  a8^\mf( e' cis a) a( e' cis a) |
  gis8( d' b gis) gis( d' b gis) |
  a8( e' cis a) a( e' cis a) |
  gis4( b8 d) a4( e) |

  a8( e' cis a) a( e' cis a) |
  gis8( d' b gis) gis( d' b gis) |
  fis8( cis' a fis) gis( d' b gis) |
  e4( b'8 gis) fis4( e) |

  % Variacion melodica (8 compases)
  <a cis e>4^\f <a cis e> <b d f> <a cis e> |
  <a cis e>4 <a cis e> <b d f> <g b d> |
  <a cis e>4 <a cis e> <b d f> <a cis e> |
  <g b d>4 <b d g> <c e a>2 |

  <a cis e>4^\ff <a cis e> <b d f> <a cis e> |
  <a cis e>4 <a cis e> <b d f> <g b d> |
  <e' gis>4 <d fis> <cis e> <b d> |
  <a cis e a>1\arpeggio |

  % Outro (6 compases)
  <a c e a>4^\mf <a c e a> <a c e a> <a c e a> |
  <cis, e a cis>4 <cis e a cis> <cis e a cis> <cis e a cis> |
  <d f a d>4 <d f a d> <d f a d> <d f a d> |
  <e g b e>4 <e g b e> <e g b e> <e g b e> |
  <a, c e a>2 r2 |
  r1 \bar "|."
}

leftHand = \relative c {
  \global
  \clef bass

  % Intro (4 compases)
  a,8^\mp e' a c e c a e |
  e,8 b' e gis b gis e b |
  f,8 c' f a c a f c |
  g,8 d' g b d b g d |

  % Hook (8 compases)
  a,8 e' a c e c a e |
  e,8 b' e gis b gis e b |
  f,8 c' f a c a f c |
  g,8 d' g b d b g d |

  a,8 e' a c e c a e |
  e,8 b' e gis b gis e b |
  f,8 c' f a c a f c |
  g,8 d' g b d b g d |

  % Variacion melodica (8 compases)
  a,4 a' e a, |
  e4 e' b e, |
  f4 f' c f, |
  g4 g' d g, |

  a,4 a' e a, |
  e4 e' b e, |
  f4 g a e |
  a,1 |

  % Outro (6 compases)
  a,8 e' a c e c a e |
  e,8 b' e gis b gis e b |
  f,8 c' f a c a f c |
  g,8 d' g b d b g d |
  a,2 r2 |
  r1
}

\score {
  \new PianoStaff <<
    \set PianoStaff.instrumentName = "Piano"
    \new Staff = "RH" \with {
      midiInstrument = #"acoustic grand"
    } { \rightHand }
    \new Staff = "LH" \with {
      midiInstrument = #"acoustic grand"
    } { \leftHand }
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
