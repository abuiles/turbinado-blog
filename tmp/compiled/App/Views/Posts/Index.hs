module App.Views.Posts.Index where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup =  <div>
              <h1> A poor-man's Blog</h1>
              <% do l <-  getViewDataValue_u "posts-list" ::View [(String,String,String,String)] 
                    mapM indexItem l
              %>                                
              <a href="New">New Post</a>
          </div>

indexItem (i,t,b,d)  = return $ cdata $ unlines $
                   ["<div style='padding: 0pt 5px;'>"
                   ," <a href=\"/Posts/Show/" ++ i ++"\">"
                   ,"  "++ t ++"- "++"<small>"++d++"</small>" 
                   ," </a>"
                   ,"<font size='1'><a href='/Posts/Remove/"++i++"'>  delete</a>"
                   ,"<a href='/Posts/Edit/"++i++"'>  edit</a></font>"
                   ,"<p>" ++ b ++ "</p>"
                   ,"</div>"
                   ,"<hr>"
                   ]-- SPLIT HERE

