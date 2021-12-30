module Main exposing (..)

import Browser
import Html exposing (Html, button, div, li, p, text, ul)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    List ( Int, String )


init : Model
init =
    List.indexedMap Tuple.pair (List.repeat 9 "")



-- UPDATE


type Msg
    = AddMark Int


updateMark : Int -> ( Int, String ) -> String -> ( Int, String )
updateMark index tuple mark =
    if index == Tuple.first tuple && Tuple.second tuple == "" then
        ( index, mark )

    else
        tuple


swap : Int -> Int -> String
swap numOfX numOfO =
    if numOfX == 0 && numOfO == 0 then
        "X"

    else if numOfX <= numOfO then
        "X"

    else
        "O"


isX : ( Int, String ) -> Bool
isX tuple =
    if Tuple.second tuple == "X" then
        True

    else
        False


isO : ( Int, String ) -> Bool
isO tuple =
    if Tuple.second tuple == "O" then
        True

    else
        False


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddMark index ->
            List.map (\tuple -> updateMark index tuple (swap (List.length (List.filter isX model)) (List.length (List.filter isO model)))) model



-- VIEW


winningCombination : Model -> Html Msg
winningCombination model =
    if
        List.member ( 0, "X" ) model
            && List.member ( 1, "X" ) model
            && List.member ( 2, "X" ) model
            || List.member ( 3, "X" ) model
            && List.member ( 4, "X" ) model
            && List.member ( 5, "X" ) model
            || List.member ( 6, "X" ) model
            && List.member ( 7, "X" ) model
            && List.member ( 8, "X" ) model
            || List.member ( 0, "X" ) model
            && List.member ( 4, "X" ) model
            && List.member ( 8, "X" ) model
            || List.member ( 2, "X" ) model
            && List.member ( 4, "X" ) model
            && List.member ( 6, "X" ) model
            || List.member ( 0, "X" ) model
            && List.member ( 3, "X" ) model
            && List.member ( 6, "X" ) model
            || List.member ( 1, "X" ) model
            && List.member ( 4, "X" ) model
            && List.member ( 7, "X" ) model
            || List.member ( 2, "X" ) model
            && List.member ( 5, "X" ) model
            && List.member ( 8, "X" ) model
    then
        div [ class "overlay" ] [ p [] [ text "Player X wins!" ] ]

    else if
        List.member ( 0, "O" ) model
            && List.member ( 1, "O" ) model
            && List.member ( 2, "O" ) model
            || List.member ( 3, "O" ) model
            && List.member ( 4, "O" ) model
            && List.member ( 5, "O" ) model
            || List.member ( 6, "O" ) model
            && List.member ( 7, "O" ) model
            && List.member ( 8, "O" ) model
            || List.member ( 0, "O" ) model
            && List.member ( 4, "O" ) model
            && List.member ( 8, "O" ) model
            || List.member ( 2, "O" ) model
            && List.member ( 4, "O" ) model
            && List.member ( 6, "O" ) model
            || List.member ( 0, "O" ) model
            && List.member ( 3, "O" ) model
            && List.member ( 6, "O" ) model
            || List.member ( 1, "O" ) model
            && List.member ( 4, "O" ) model
            && List.member ( 7, "O" ) model
            || List.member ( 2, "O" ) model
            && List.member ( 5, "O" ) model
            && List.member ( 8, "O" ) model
    then
        div [ class "overlay" ] [ p [] [ text "Player O wins!" ] ]

    else
        text ""


displayCell : ( Int, String ) -> Html Msg
displayCell tuple =
    li [ class "cell" ] [ button [ class "button", onClick (AddMark (Tuple.first tuple)) ] [ text (Tuple.second tuple) ] ]


view : Model -> Html Msg
view model =
    div [ class "root" ]
        [ winningCombination model
        , ul [ class "board ul" ] (List.map displayCell model)
        ]
