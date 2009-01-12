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
                   ,"<p>" ++ b ++ "</p>"
                   ,"</div>"
                   ,"<hr>"
                   ]