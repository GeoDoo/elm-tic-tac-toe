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


updateMark : Int -> ( Int, String ) -> ( Int, String )
updateMark index tuple =
    if index == Tuple.first tuple then
        ( index, "X" )

    else
        tuple


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddMark index ->
            List.map (\x -> updateMark index x) model



-- VIEW


displayCell : ( Int, String ) -> Html Msg
displayCell tuple =
    li [ class "cell" ] [ button [ class "button", onClick (AddMark (Tuple.first tuple)) ] [ text (Tuple.second tuple) ] ]


view : Model -> Html Msg
view model =
    div [ class "root" ]
        [ ul [ class "board ul" ] (List.map displayCell model)
        ]
