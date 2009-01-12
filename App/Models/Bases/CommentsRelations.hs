{- DO NOT EDIT THIS FILE
   THIS FILE IS AUTOMAGICALLY GENERATED AND YOUR CHANGES WILL BE EATEN BY THE GENERATOR OVERLORD

   All changes should go into the Model file (e.g. App/Models/ExampleModel.hs)
-}

module App.Models.Bases.CommentsRelations where

import App.Models.Bases.Common
import qualified Database.HDBC as HDBC
import Data.Maybe
import System.Time

 -- Model imports
import App.Models.Bases.CommentsType

import qualified App.Models.Bases.PostsType as PostsType
import qualified App.Models.Bases.PostsFunctions as PostsFunctions


import Turbinado.Environment.Types
import Turbinado.Environment.Database









parentPosts :: (HasEnvironment m) => Comments -> m PostsType.Posts
parentPosts self = findOneWhere "_id = ?" [HDBC.toSql $ postId self]

