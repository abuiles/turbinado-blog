module App.Controllers.Posts where 


import qualified App.Models.Bases.CommentsType as Comment  -- We import the type of the comment.  
import App.Models.Posts -- This is the Post model we get here some generated basic functionalities (CRUD), and  we can add more.
                        -- In App/Models/Bases/PostFunctions.hs   We can find the generated functions.
                              
import Data.Maybe
import Data.Time

import qualified Database.HDBC as HDBC

import Turbinado.Controller -- All Controllers must import Turbinado.Controller


-- This is a basic action, It doens't do anything special just send us to a new view. 
-- The view for this action is in /App/Views/Posts/About.hs
about :: Controller ()  
about = return ()


-- Show a form where We can write a new post .
-- View : /App/Views/Posts/New.hs
new :: Controller ()
new =  do setViewDataValue "save-url" ("Create")   -- setViewDataValue allow the controller to send data to the view .
                                                   -- check : http://www.turbinado.org/Architecture/Show/architecture-5-controllers  

-- Insert a new post in the db
create :: Controller ()
create = do body_    <-  getParam_u "content"  -- Attempt to get a Parameter from the Request query string in this case the parameter is called "content"
-- or POST body.
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
             


search :: Controller ()
search = do sp <- getParam_u "s" :: Controller String            
            posts <- findAllWhere "(body||title) like ?" [toSql $ "%"++sp++"%"]
            setViewDataValue "posts-list" $ map (\p -> (Prelude.show(fromJust(_id p)),title p , body p,Prelude.show(fromJust(created_at p)))) posts

-- SPLIT HERE


