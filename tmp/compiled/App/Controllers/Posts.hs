module App.Controllers.Posts where 


import qualified  App.Models.Bases.PostsRelations as PostRelations
import qualified App.Models.Bases.CommentsType as CommentType
import qualified App.Models.Posts as PostModel
import Data.Maybe
import System.Time

import Turbinado.Controller

about :: Controller ()
about = return ()

new :: Controller ()
new =  do setViewDataValue "save-url" ("Create")          


create :: Controller ()
create = do body_    <-  getParam_u "content"
            title_   <-  getParam_u "title"
            d        <-  PostModel.lift getClockTime
            id'      <-  PostModel.insert(PostModel.Posts {PostModel._id=Nothing , PostModel.body = body_ , PostModel.title = title_, PostModel.created_at = (Just d) }) True 
            redirectTo $ "/Posts/Show/" ++ Prelude.show(fromJust(id')) 


show :: Controller ()
show =  do id' <-getSetting_u "id" :: Controller String
           let pId = (read id' :: PostModel.Int64)
           p <- PostModel.find pId  :: Controller PostModel.Posts
           setViewDataValue "post-createdAt" (Prelude.show(fromJust(PostModel.created_at p)))
           setViewDataValue "post-title" (PostModel.title p)
           setViewDataValue "post-content" (PostModel.body p)
           setViewDataValue "save-comment-url" ("/Comments/Create/"++id')
           comments <-  PostRelations.findAllChildComments p :: Controller [CommentType.Comments]
           setViewDataValue "comments-list" $ map(\c -> (CommentType.author c,CommentType.body c)) comments
           
           
index :: Controller ()
index = do posts <- PostModel.findAll :: Controller [PostModel.Posts]                      
           setViewDataValue "posts-list" $ map (\p -> (Prelude.show(fromJust(PostModel._id p)),PostModel.title p , PostModel.body p,Prelude.show(fromJust(PostModel.created_at p)))) posts

edit :: Controller ()
edit = do id' <- getSetting_u "id" :: Controller String
          let pId = (read id' :: PostModel.Int64)
          post <- PostModel.find pId :: Controller PostModel.Posts
          setViewDataValue "post-title" (PostModel.title post)
          setViewDataValue "post-body" (PostModel.body post )
          setViewDataValue "post-update" ("/Posts/UpdateP/"++id')

updateP :: Controller ()
updateP = do id' <- getSetting_u "id" :: Controller String
             let pId = (read id' :: PostModel.Int64)
             newBody <- getParam_u "content"
             newTitle <- getParam_u "title"
             post <- PostModel.find pId :: Controller PostModel.Posts
             let edited_post = PostModel.Posts{PostModel._id=(PostModel._id post) , PostModel.body =newBody , PostModel.title = newTitle, PostModel.created_at = (PostModel.created_at post) }
             PostModel.update edited_post
             redirectTo $ "/Posts/Show/" ++ id'

remove :: Controller ()
remove = do id' <-getSetting_u "id" :: Controller String
            let pId = (read id' :: PostModel.Int64)
            --PostModel.delete pId
            redirectTo$ "/Posts/Index"                 
             
             
-- SPLIT HERE


