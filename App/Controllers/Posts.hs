--import App.Models.Posts as PostModel
import App.Models.Posts
import qualified Network.URI as URI
import Data.Maybe


new :: Controller ()
new =  do setViewDataValue "save-url" ("Create")          


create :: Controller ()
create = do body_    <- getParam_u "content"
            title_   <- getParam_u "title"
            id'      <- insert Posts {_id=Nothing , body = body_ , title = title_ } True 
            redirectTo $ "/Posts/Show/" ++ Prelude.show(fromJust(id')) 

show :: Controller ()
show =  do id' <- getSetting_u "id" :: Controller String
           p <- find (read id' :: Int64) :: Controller Posts
           setViewDataValue "post-title" (title p)
           setViewDataValue "post-content" (body p)
           
index :: Controller ()
index = do posts <- findAll :: Controller [Posts]           
           setViewDataValue "posts-list" $ map (\p -> (_id p,title p , body p)) posts
           