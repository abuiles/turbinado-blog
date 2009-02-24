module App.Controllers.Posts where 


import App.Models.Bases.PostsRelations
import qualified App.Models.Bases.CommentsType as Comment
import App.Models.Posts
import Data.Maybe
import Data.Time

import qualified Database.HDBC as HDBC

import Turbinado.Controller

test :: Controller ()
test = return ()

about :: Controller ()
about = return ()

new :: Controller ()
new =  do setViewDataValue "save-url" ("Create")          


create :: Controller ()
create = do body_    <-  getParam_u "content"
            title_   <-  getParam_u "title"
            d        <-  lift getZonedTime
            id'      <-  insert(Posts {_id=Nothing , body = body_ , title = title_, created_at = (Just d) }) True 
            redirectTo $ "/Posts/Show/" ++ Prelude.show(fromJust(id')) 


show :: Controller ()
show =  do id' <-getSetting_u "id" :: Controller String
           let pId = (read id' :: Integer)
           p <- find pId  :: Controller Posts
           setViewDataValue "post-createdAt" (Prelude.show(fromJust(created_at p)))
           setViewDataValue "post-title" (title p)
           setViewDataValue "post-content" (body p)
           setViewDataValue "save-comment-url" ("/Comments/Create/"++id')
           comments <-  findAllChildComments p :: Controller [Comment.Comments]
           setViewDataValue "comments-list" $ map(\c -> (Comment.author c,Comment.body c)) comments
           
           
index :: Controller ()
index = do posts <- findAll :: Controller [Posts]                      
           setViewDataValue "posts-list" $ map (\p -> (Prelude.show(fromJust(_id p)),title p , body p,Prelude.show(fromJust(created_at p)))) posts
           

edit :: Controller ()
edit = do id' <- getSetting_u "id" :: Controller String
          let pId = (read id' :: Integer)
          post <- find pId :: Controller Posts
          setViewDataValue "post-title" (title post)
          setViewDataValue "post-body" (body post )
          setViewDataValue "post-update" ("/Posts/UpdateP/"++id')

updateP :: Controller ()
updateP = do id' <- getSetting_u "id" :: Controller String
             let pId = (read id' :: Integer)
             newBody <- getParam_u "content"
             newTitle <- getParam_u "title"
             post <- find pId :: Controller Posts
             let edited_post = Posts{_id=(_id post) , body =newBody , title = newTitle, created_at = (created_at post) }
             update edited_post
             redirectTo $ "/Posts/Show/" ++ id'

remove :: Controller ()
remove = do id' <-getSetting_u "id" :: Controller String
            let pId = (read id' :: Integer)
            post <- find pId :: Controller Posts
            mydelete post
            redirectTo$ "/Manage/Home"                 
             

--SELECT * FROM posts WHERE ((body||title) like '%o%');

search :: Controller ()
search = do sp <- getParam_u "s" :: Controller String            
            posts <- findAllWhere "(body||title) like ?" [toSql $ "%"++sp++"%"]
            setViewDataValue "posts-list" $ map (\p -> (Prelude.show(fromJust(_id p)),title p , body p,Prelude.show(fromJust(created_at p)))) posts

newSearch :: Controller ()
newSearch = return ()-- SPLIT HERE


