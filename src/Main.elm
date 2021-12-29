module Main exposing (..)

import Browser
import Html exposing (Html, button, div, li, text, ul)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    List ( Int, String )


type Mark
    = X
    | O


init : Model
init =
    List.indexedMap Tuple.pair [ "", "", "", "", "", "", "", "", "" ]



-- UPDATE


type Msg
    = AddMark Int


updateEntry : Int -> ( Int, String ) -> ( Int, String )
updateEntry index tuple =
    if index == Tuple.first tuple then
        ( index, "X" )

    else
        tuple


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddMark index ->
            List.map (\x -> updateEntry index x) model



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "root" ]
        [ ul [ class "board ul" ]
            [ li [ class "cell" ] [ button [ class "button", onClick (AddMark 0) ] [ text "" ] ]
            , li [ class "cell" ] [ button [ class "button", onClick (AddMark 1) ] [ text "" ] ]
            , li [ class "cell" ] [ button [ class "button", onClick (AddMark 2) ] [ text "" ] ]
            , li [ class "cell" ] [ button [ class "button", onClick (AddMark 3) ] [ text "" ] ]
            , li [ class "cell" ] [ button [ class "button", onClick (AddMark 4) ] [ text "" ] ]
            , li [ class "cell" ] [ button [ class "button", onClick (AddMark 5) ] [ text "" ] ]
            , li [ class "cell" ] [ button [ class "button", onClick (AddMark 6) ] [ text "" ] ]
            , li [ class "cell" ] [ button [ class "button", onClick (AddMark 7) ] [ text "" ] ]
            , li [ class "cell" ] [ button [ class "button", onClick (AddMark 8) ] [ text "" ] ]
            ]
        ]
