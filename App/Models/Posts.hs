module App.Models.Posts
  ( module App.Models.Posts
  , module App.Models.Bases.PostsType
  , module App.Models.Bases.PostsFunctions
  , module App.Models.Bases.PostsRelations
  , module App.Models.Bases.Common
  ) where
import App.Models.Bases.PostsType
import App.Models.Bases.PostsFunctions
import App.Models.Bases.PostsRelations
import App.Models.Bases.Common

import qualified Database.HDBC as HDBC
import Turbinado.Environment.Types
import Turbinado.Environment.Database

import Data.Maybe

mydelete m = do
 conn <- getEnvironment >>= (return . fromJust . getDatabase )
 let pk = _id m
 res <- liftIO $ HDBC.handleSqlError $ HDBC.run conn "DELETE FROM posts WHERE (_id = ? )" [HDBC.toSql $ pk]
 case res of
          0 -> (liftIO $ HDBC.handleSqlError $ HDBC.rollback conn) >>
               (throwDyn $ HDBC.SqlError
                           {HDBC.seState = "",
                            HDBC.seNativeError = (-1),
                            HDBC.seErrorMsg = "Rolling back.  No record found when deleting by Primary Key:posts : " ++ (show pk)
                           })
          1 -> (liftIO $ HDBC.handleSqlError $ HDBC.commit conn) >> return ()
          _ -> (liftIO $ HDBC.handleSqlError $ HDBC.rollback conn) >>
               (throwDyn $ HDBC.SqlError
                           {HDBC.seState = "",
                            HDBC.seNativeError = (-1),
                            HDBC.seErrorMsg = "Rolling back.  Too many records deleted when deleting by Primary Key:posts : " ++ (show pk)
                           }) 

--With this function we return the number of comments that a given post have. It recive the post id
getNumberOfComments pk = do
  conn <- getEnvironment >>= (return . fromJust . getDatabase )
  res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn ("SELECT count (comment_id) from comments WHERE post_id=51") [HDBC.toSql pk];
  return $ 0
 