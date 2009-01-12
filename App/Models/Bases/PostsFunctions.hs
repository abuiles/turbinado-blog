{- DO NOT EDIT THIS FILE
   THIS FILE IS AUTOMAGICALLY GENERATED AND YOUR CHANGES WILL BE EATEN BY THE GENERATOR OVERLORD

   All changes should go into the Model file (e.g. App/Models/ExampleModel.hs)
-}

module App.Models.Bases.PostsFunctions where

import App.Models.Bases.Common
import qualified Database.HDBC as HDBC
import Data.Maybe
import System.Time

 -- My type
import App.Models.Bases.PostsType

import Turbinado.Environment.Types
import Turbinado.Environment.Database


instance HasFindByPrimaryKey Posts  (Int64)  where
    find pk@(pk1) = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn ("SELECT _id , body , created_at , title FROM posts WHERE (_id = ? )") [HDBC.toSql pk1]
        case res of
          [] -> throwDyn $ HDBC.SqlError
                           {HDBC.seState = "",
                            HDBC.seNativeError = (-1),
                            HDBC.seErrorMsg = "No record found when finding by Primary Key:posts : " ++ (show pk)
                           }
          r:[] -> return $ Posts (HDBC.fromSql (r !! 0)) (HDBC.fromSql (r !! 1)) (HDBC.fromSql (r !! 2)) (HDBC.fromSql (r !! 3))
          _ -> throwDyn $ HDBC.SqlError
                           {HDBC.seState = "",
                            HDBC.seNativeError = (-1),
                            HDBC.seErrorMsg = "Too many records found when finding by Primary Key:posts : " ++ (show pk)
                           }

    update m = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.run conn "UPDATE posts SET (_id , body , created_at , title) = (?,?,?,?) WHERE (_id = ? )"
                  [HDBC.toSql $ _id m , HDBC.toSql $ body m , HDBC.toSql $ createdAt m , HDBC.toSql $ title m, HDBC.toSql $ _id m]
        liftIO $ HDBC.handleSqlError $ HDBC.commit conn
        return ()

    delete m = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.run conn "DELETE FROM posts WHERE (_id = ? )"
                  [HDBC.toSql $ _id m]
        liftIO $ HDBC.handleSqlError $ HDBC.commit conn
        return ()   

instance IsModel Posts where
    insert m returnId = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res  <- liftIO $ HDBC.handleSqlError $ HDBC.run conn (" INSERT INTO posts (_id,body,created_at,title) VALUES (" ++ (case (_id m) of Nothing -> "DEFAULT"; Just x -> "?") ++ ",?," ++ (case (createdAt m) of Nothing -> "DEFAULT"; Just x -> "?") ++ ",?)")  ( (case (_id m) of Nothing -> []; Just x -> [HDBC.toSql x]) ++ [HDBC.toSql $ body m] ++ (case (createdAt m) of Nothing -> []; Just x -> [HDBC.toSql x]) ++ [HDBC.toSql $ title m])
        liftIO $ HDBC.handleSqlError $ HDBC.commit conn
        if returnId
          then do i <- liftIO $ HDBC.catchSql (HDBC.handleSqlError $ HDBC.quickQuery' conn "SELECT lastval()" []) (\_ -> HDBC.commit conn >> (return $ [[HDBC.toSql (0 :: Int)]]) ) 
                  return $ HDBC.fromSql $ head $ head i
          else return Nothing
    findAll = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn "SELECT _id , body , created_at , title FROM posts" []
        return $ map (\r -> Posts (HDBC.fromSql (r !! 0)) (HDBC.fromSql (r !! 1)) (HDBC.fromSql (r !! 2)) (HDBC.fromSql (r !! 3))) res
    findAllWhere ss sp = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn ("SELECT _id , body , created_at , title FROM posts WHERE (" ++ ss ++ ") ")  sp
        return $ map (\r -> Posts (HDBC.fromSql (r !! 0)) (HDBC.fromSql (r !! 1)) (HDBC.fromSql (r !! 2)) (HDBC.fromSql (r !! 3))) res
    findAllOrderBy op = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn ("SELECT _id , body , created_at , title FROM posts ORDER BY ?") [HDBC.toSql op]
        return $ map (\r -> Posts (HDBC.fromSql (r !! 0)) (HDBC.fromSql (r !! 1)) (HDBC.fromSql (r !! 2)) (HDBC.fromSql (r !! 3))) res
    findAllWhereOrderBy ss sp op = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn ("SELECT _id , body , created_at , title FROM posts WHERE (" ++ ss ++ ") ORDER BY ? ")  (sp ++ [HDBC.toSql op])
        return $ map (\r -> Posts (HDBC.fromSql (r !! 0)) (HDBC.fromSql (r !! 1)) (HDBC.fromSql (r !! 2)) (HDBC.fromSql (r !! 3))) res
    findOneWhere ss sp = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn ("SELECT _id , body , created_at , title FROM posts WHERE (" ++ ss ++ ") LIMIT 1") sp
        return $ (\r -> Posts (HDBC.fromSql (r !! 0)) (HDBC.fromSql (r !! 1)) (HDBC.fromSql (r !! 2)) (HDBC.fromSql (r !! 3))) (head res)
    findOneOrderBy op = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn ("SELECT _id , body , created_at , title FROM posts ORDER BY ? LIMIT 1")  [HDBC.toSql op]
        return $ (\r -> Posts (HDBC.fromSql (r !! 0)) (HDBC.fromSql (r !! 1)) (HDBC.fromSql (r !! 2)) (HDBC.fromSql (r !! 3))) (head res)
    findOneWhereOrderBy ss sp op = do
        conn <- getEnvironment >>= (return . fromJust . getDatabase )
        res <- liftIO $ HDBC.handleSqlError $ HDBC.quickQuery' conn ("SELECT _id , body , created_at , title FROM posts WHERE (" ++ ss ++ ") ORDER BY ? LIMIT 1")  (sp ++ [HDBC.toSql op])
        return $ (\r -> Posts (HDBC.fromSql (r !! 0)) (HDBC.fromSql (r !! 1)) (HDBC.fromSql (r !! 2)) (HDBC.fromSql (r !! 3))) (head res)
