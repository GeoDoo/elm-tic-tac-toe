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


init : Model
init =
    List.indexedMap Tuple.pair (List.repeat 9 "")



-- UPDATE


type Msg
    = AddMark Int


updateMark : Int -> ( Int, String ) -> String -> ( Int, String )
updateMark index tuple mark =
    if index == Tuple.first tuple then
        ( index, mark )

    else
        tuple


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddMark index ->
            List.map (\tuple -> updateMark index tuple "X") model



-- VIEW


displayCell : ( Int, String ) -> Html Msg
displayCell tuple =
    li [ class "cell" ] [ button [ class "button", onClick (AddMark (Tuple.first tuple)) ] [ text (Tuple.second tuple) ] ]


view : Model -> Html Msg
view model =
    div [ class "root" ]
        [ ul [ class "board ul" ] (List.map displayCell model)
        ]
