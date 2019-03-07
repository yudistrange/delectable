module Main exposing (main)

import Browser
import Html exposing (Html, text)
import Http
import Json.Decode exposing (Decoder, field)



-- Main


main =
    Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }



-- Model


type Model
    = Failure
    | Weird
    | Loading
    | Success String


init : () -> ( Model, Cmd Msg )
init _ =
    ( Success "Hello World!", Cmd.none )



-- Update


type Msg
    = More
    | GotNum (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotNum result ->
            case result of
                Ok url ->
                    ( Success url, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )

        _ ->
            ( Weird, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Random Number" ]
        , viewGif model
        ]


viewGif : Model -> Html Msg
viewGif model =
    case model of
        Failure ->
            div []
                [ text "I could not load a random cat for some reason." ]

        Loading ->
            text "Loading..."

        Success url ->
            div []
                [ text "Success" ]

        Weird ->
            text "Weird things are happening"



-- HTTP


getRandomNumber : Cmd Msg
getRandomNumber =
    Http.get { url = "localhost:4000/api", expect = Http.expectJson GotNum numDecoder }


numDecoder : Decoder String
numDecoder =
    field "val"
