module ListMemberVsSetMember exposing (main)

import Benchmark exposing (Benchmark, benchmark, describe)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Set exposing (Set)
import Set.Any exposing (AnySet)


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    describe "List/Set/AnySet member" <|
        [ benchmark "List.member - element at beginning" <| \() -> List.member 1 listInt5
        , benchmark "List.member - element at end" <| \() -> List.member 5 listInt5
        , benchmark "Set.member" <| \() -> Set.member 5 setInt5
        , benchmark "AnySet.member" <| \() -> Set.Any.member E setEnum5
        ]


listInt5 : List Int
listInt5 =
    [ 1, 2, 3, 4, 5 ]


setInt5 : Set Int
setInt5 =
    Set.fromList [ 1, 2, 3, 4, 5 ]


setEnum5 : AnySet Int A
setEnum5 =
    Set.Any.fromList toComparable [ A, B, C, D, E ]


toComparable : A -> Int
toComparable a =
    case a of
        A ->
            0

        B ->
            1

        C ->
            2

        D ->
            3

        E ->
            4


type A
    = A
    | B
    | C
    | D
    | E
