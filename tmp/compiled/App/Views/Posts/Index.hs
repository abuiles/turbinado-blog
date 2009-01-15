module App.Views.Posts.Index where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup =  <div>              
              <% do l <-  getViewDataValue_u "posts-list" ::View [(String,String,String,String)] 
                    mapM indexItem l
              %>                                              
          </div>

indexItem (i,t,b,d)  = return $ cdata $ unlines $
                   ["<div class=\"post\">"
	            ,"<h2 class=\"title\">"++ t ++"</h2>"
		    ,"<div class=\"entry\">"
		    ,"<p>"++ b ++"</p>"
		    ,"</div>"
		    ,"<div class=\"meta\">"
		    ,"<p class=\"byline\">Posted on"++ d ++"</p>"
		    ,"<p class=\"links\"><a href=\"/Posts/Show/"++ i ++"\" class=\"more\">Read full article</a> <b>|</b> <a href=\"#\" class=\"comments\">Comments</a></p>"
		    ,"</div>"
		    ,"</div>"
                   ]


	          -- SPLIT HERE

