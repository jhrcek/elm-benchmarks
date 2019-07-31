module FunctionsInLetBlocks exposing (main)

import Benchmark exposing (Benchmark, benchmark, compare)
import Benchmark.Runner exposing (BenchmarkProgram)


main : BenchmarkProgram
main =
    Benchmark.Runner.program bench


bench : Benchmark
bench =
    compare "Helper in top level versus in let block"
        "Top level"
        (\_ -> functionWithTopLevelHelper list)
        "let block"
        (\_ -> functionWithHelperInLepBlock list)


functionWithHelperInLepBlock : List Int -> List Int
functionWithHelperInLepBlock  =
    let
        isEven x =
            Basics.modBy 2 x == 0
    in
    List.filter isEven


functionWithTopLevelHelper : List Int -> List Int
functionWithTopLevelHelper =
    List.filter isEvenTopLevel

list = List.range 0 1000

isEvenTopLevel : Int -> Bool
isEvenTopLevel x =
    Basics.modBy 2 x == 0
