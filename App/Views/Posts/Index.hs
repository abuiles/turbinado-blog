markup =  <div>
              <h1> A poor-man's Blog</h1>
              <% do l <-  getViewDataValue_u "posts-list" ::View [(String,String,String)] 
                    mapM indexItem l
              %>                                
          </div>

indexItem (i,t,b) = return $ cdata $ unlines $
                   ["<div style='padding: 0pt 5px;'>"
                   ," <a href=\"/Posts/Show/" ++ i ++"\">"
                   ,"  "++ t
                   ," </a>"
                   ,"<p>" ++ b ++ "</p>"
                   ,"</div>"
                   ]