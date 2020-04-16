module Fusion exposing (main)

import Benchmark exposing (Benchmark, benchmark, describe)
import Benchmark.Runner exposing (BenchmarkProgram, program)


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    describe "map fusion" <|
        [ benchmark "map (f . g)" <| \() -> List.map (f << g) xs
        , benchmark "map f . map g" <| \() -> List.map f <| List.map g xs
        ]


f x =
    x + 1


g x =
    x * 2


xs =
    List.range 1 1000
