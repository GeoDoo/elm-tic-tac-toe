module Main exposing (..)

import Browser
import Html exposing (Html, div)
import Html.Attributes exposing (class)



-- MAIN


main : Program () Model msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    List Mark


init : Model
init =
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]


type Mark
    = X
    | O
    | Nothing



-- UPDATE


type Msg
    = None String


update : msg -> Model -> Model
update _ model =
    model



-- VIEW


view : Model -> Html msg
view _ =
    div [ class "root" ]
        [ div [ class "board" ]
            [ div [ class "cell" ] []
            , div [ class "cell" ] []
            , div [ class "cell" ] []
            , div [ class "cell" ] []
            , div [ class "cell" ] []
            , div [ class "cell" ] []
            , div [ class "cell" ] []
            , div [ class "cell" ] []
            , div [ class "cell" ] []
            ]
        ]
