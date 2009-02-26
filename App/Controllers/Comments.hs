import App.Models.Comments as CommentsModel 
import Turbinado.Controller


create :: Controller ()
create = do id' <-getSetting_u "id" :: Controller String
            body_ <- getParam_u "body"
            author_ <- getParam_u "author"
            let pId = (Prelude.read id')::Integer
            CommentsModel.insert Comments{author = author_ ,body = body_ ,comment_id =Nothing,post_id = pId} False
            redirectTo $ "/Posts/Show/"++id'
