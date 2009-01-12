module App.Controllers.Posts where 

import Config.Master
import Turbinado.Controller

--import App.Models.Posts as PostModel

import App.Models.Posts
import qualified Network.URI as URI
import Data.Maybe
import System.Time


new :: Controller ()
new =  do setViewDataValue "save-url" ("Create")          


create :: Controller ()
create = do body_    <-  getParam_u "content"
            title_   <-  getParam_u "title"
            d        <-  lift getClockTime
            id'      <-  insert(Posts {_id=Nothing , body = body_ , title = title_, createdAt = (Just d) }) True 
            redirectTo $ "/Posts/Show/" ++ Prelude.show(fromJust(id')) 


show :: Controller ()
show =  do id' <-getSetting_u "id" :: Controller String
           p <- find (read id' :: Int64) :: Controller Posts
           setViewDataValue "post-createdAt" (Prelude.show(fromJust(createdAt p)))
           setViewDataValue "post-title" (title p)
           setViewDataValue "post-content" (body p)
           setViewDataValue "save-comment-url" ("/Comments/Create/"++id')
           
index :: Controller ()
index = do posts <- findAll :: Controller [Posts]                      
           setViewDataValue "posts-list" $ map (\p -> (Prelude.show(fromJust(_id p)),title p , body p,Prelude.show(fromJust(createdAt p)))) posts

-- SPLIT HERE


