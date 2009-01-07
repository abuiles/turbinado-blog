{- DO NOT EDIT THIS FILE
   THIS FILE IS AUTOMAGICALLY GENERATED AND YOUR CHANGES WILL BE EATEN BY THE GENERATOR OVERLORD

   All changes should go into the Model file (e.g. App/Models/ExampleModel.hs)
-}

module App.Models.Bases.PostsType where

import App.Models.Bases.Common
import Data.Maybe
import System.Time

-- The data type for this model
data Posts = Posts {
    _id :: Maybe Int64,
    body :: String,
    title :: String
    } deriving (Eq, Show)

instance DatabaseModel Posts where
    tableName _ = "posts"

