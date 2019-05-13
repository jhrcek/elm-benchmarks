module SetDiff exposing (main)

import Benchmark exposing (Benchmark, benchmark, describe)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import List
import Set exposing (Set)


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    let
        big =
            Set.fromList <| List.range 0 99

        small =
            Set.fromList <| List.range 90 99
    in
    describe "Set.filter vs. Set.diff" <|
        [ benchmark "Set.filter (big - small)" <| \() -> removeByFilter big small
        , benchmark "Set.diff   (big - small)" <| \() -> Set.diff big small
        , benchmark "Set.filter (big - big)" <| \() -> removeByFilter big big
        , benchmark "Set.diff   (big - big)" <| \() -> Set.diff big big
        , benchmark "Set.filter (small - big)" <| \() -> removeByFilter small big
        , benchmark "Set.diff   (small - big)" <| \() -> Set.diff small big
        , benchmark "Set.filter (small - small)" <| \() -> removeByFilter small small
        , benchmark "Set.diff   (small - small)" <| \() -> Set.diff small small
        ]


removeByFilter : Set comparable -> Set comparable -> Set comparable
removeByFilter a b =
    Set.filter (\e -> not <| Set.member e b) a
