module CachingIntermediateResultsInLet exposing (main)

import Benchmark exposing (Benchmark, benchmark, describe)
import Benchmark.Runner exposing (BenchmarkProgram, program)


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    describe "Is it faster if we cache results of expensive computations?"
        [ benchmark "expensive computation - called multiple times" multi
        , benchmark "expensive computation - result cached" cached
        ]


maxNum : Int
maxNum =
    1000


multi : () -> Int
multi () =
    let
        one =
            expensiveComputation maxNum

        two =
            expensiveComputation maxNum

        three =
            expensiveComputation maxNum
    in
    one + two + three


cached : () -> Int
cached () =
    let
        cachedResult =
            expensiveComputation maxNum

        one =
            cachedResult

        two =
            cachedResult

        three =
            cachedResult
    in
    one + two + three


expensiveComputation : Int -> Int
expensiveComputation x =
    List.range 0 x
        |> List.maximum
        |> Maybe.withDefault 0
