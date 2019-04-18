module ListConcat exposing (main)

import Benchmark exposing (Benchmark, benchmark, describe)
import Benchmark.Runner exposing (BenchmarkProgram, program)


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    describe "List.concat vs fastConcat" <|
        List.concatMap
            (\p ->
                [ mkBench "List.concat" p List.concat
                , mkBench "fastConcat" p fastConcat
                ]
            )
            [ ( 10, 1000 ), ( 100, 100 ), ( 1000, 10 ) ]


mkBench : String -> ( Int, Int ) -> (List (List Int) -> List Int) -> Benchmark
mkBench functionName ( m, n ) concatFuction =
    benchmark (functionName ++ " (" ++ String.fromInt m ++ " lists of lenth " ++ String.fromInt n ++ ")") <|
        \() -> concatFuction (mkList m n)


fastConcat : List (List a) -> List a
fastConcat =
    List.foldr (\x acc -> x ++ acc) []


mkList : Int -> Int -> List (List Int)
mkList m n =
    List.repeat m (List.range 1 n)
