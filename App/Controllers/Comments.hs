import App.Models.Comments as CommentsModel
import qualified Network.URI as URI


create :: Controller ()
create = do id' <-getSetting_u "id" :: Controller String
            body_ <- getParam_u "body"
            author_ <- getParam_u "author"
            let pId = (Prelude.read id')::Int64
            CommentsModel.insert Comments{author = author_ ,body = body_ ,commentId =Nothing,postId = pId} False
            redirectTo $ "/Posts/Show/"++id'