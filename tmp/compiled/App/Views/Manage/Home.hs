module App.Views.Manage.Home where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <div>
         <button type="button" onClick="location.href='/Posts/New'">New Post</button>
         <hr></hr>
         <h1>Publicated Posts</h1><br></br>
            <% do e <- getViewDataValue_u "posts-titles" :: View [(String,String)]
                  mapM items e
            %>
          </div>

items (id,title) = return $ cdata $ unlines $
                   ["<p>"++ title ++ " <a href=\"/Posts/Show/"++ id ++ "\"> Show </a>  <a href=\"/Posts/Edit/"++ id ++ "\"> Edit </a> <a href=\"/Posts/Remove/"++ id ++ "\"> Delete </a> </p>"
                   ]-- SPLIT HERE

