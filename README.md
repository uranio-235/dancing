# Dancing - Arreglos LilyPond

Proyecto de trabajo para crear y probar arreglos musicales en LilyPond, incluyendo una base melódica y una versión con percusión tipo batá afrocubana.

## Contenido del proyecto

- `base.ly`: versión base del extracto.
- `array1.ly`: arreglo derivado con DrumStaff y patrón de batá.
- `array1.pdf`: partitura renderizada desde `array1.ly`.
- `array1.mid`: salida MIDI generada desde `array1.ly`.

## Requisitos

- LilyPond instalado (recomendado 2.24.x o compatible).
- Windows PowerShell (o terminal equivalente).
- VS Code con la extension VSLilyPond (`lhl2617.vslilypond`): https://marketplace.visualstudio.com/items?itemName=lhl2617.VSLilyPond

## Compilar una partitura

Desde la carpeta del proyecto:

```powershell
lilypond .\array1.ly
```

Para la base:

```powershell
lilypond .\base.ly
```

## Salidas esperadas

Al compilar un archivo `.ly`, LilyPond genera normalmente:

- PDF con la partitura.
- MIDI para reproducción.
- Mensajes en consola con advertencias o errores de sintaxis.

## Notas de instrumentación MIDI

En algunas instalaciones, `synth lead` puede aparecer como instrumento no reconocido por el backend MIDI de LilyPond. Esto no impide compilar PDF/MIDI, pero puede afectar el timbre de reproducción.

Si quieres evitar advertencias, usa nombres General MIDI comunes como:

- `lead 1 (square)`
- `lead 2 (sawtooth)`
- `synth brass 1`

## Flujo recomendado de trabajo

1. Editar el archivo `.ly` del arreglo.
2. Compilar con LilyPond.
3. Revisar el PDF y escuchar el MIDI.
4. Ajustar ritmo, articulación y dinámica.

## Próximos pasos sugeridos

- Crear nuevas variantes: `array2.ly`, `array3.ly`.
- Separar patrones de percusión en bloques reutilizables.
- Añadir versiones por tempo (por ejemplo 140, 160, 180 BPM).
