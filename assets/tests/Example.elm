module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Very first simple test"
        [test "first test case" <|
             \_ -> 1 + 1 |> Expect.equal 2
        ]
