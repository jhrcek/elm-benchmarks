module PrependingItemsToList exposing (concat1, main, prepend1, suite)

import Benchmark exposing (Benchmark, benchmark, describe)
import Benchmark.Runner exposing (BenchmarkProgram, program)


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    describe "Adding items to the beginning of the list (x::) vs ([x] ++)"
        [ benchmark "1 item (::) empty" <| prepend1 []
        , benchmark "1 item (++) empty" <| concat1 []
        , benchmark "2 items (::) empty" <| prepend2 []
        , benchmark "2 items (++) empty" <| concat2 []
        , benchmark "10 items (::) empty" <| prepend10 []
        , benchmark "10 items (++) empty" <| concat10 []
        , benchmark "1 item (::) hundred" <| prepend1 hundred
        , benchmark "1 item (++) hundred" <| concat1 hundred
        , benchmark "2 items (::) hundred" <| prepend2 hundred
        , benchmark "2 items (++) hundred" <| concat2 hundred
        , benchmark "10 items (::) hundred" <| prepend10 hundred
        , benchmark "10 items (++) hundred" <| concat10 hundred
        ]


prepend1 : List Int -> () -> List Int
prepend1 ys () =
    1 :: ys


prepend2 : List Int -> () -> List Int
prepend2 ys () =
    1 :: 2 :: ys


prepend10 : List Int -> () -> List Int
prepend10 ys () =
    1 :: 2 :: 3 :: 4 :: 5 :: 6 :: 7 :: 8 :: 9 :: 10 :: ys


concat1 : List Int -> () -> List Int
concat1 ys () =
    [ 1 ] ++ ys


concat2 : List Int -> () -> List Int
concat2 ys () =
    [ 1, 2 ] ++ ys


concat10 : List Int -> () -> List Int
concat10 ys () =
    [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ++ ys


hundred : List Int
hundred =
    [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100 ]
