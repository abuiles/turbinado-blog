markup = <div>
         <button type="button" onClick="location.href='/Posts/New'">New Post</button>
         <hr></hr>
         
            <% do e <- getViewDataValue_u "posts-titles" :: View [(String,String)]
                  mapM items e
            %>
          </div>

items (id,title) = return $ cdata $ unlines $
                   ["<p>"++ title ++ " <a href=\"/Posts/Show/"++ id ++ "\"> Show </a>  <a href=\"/Posts/Edit/"++ id ++ "\"> Edit </a> <a href=\"/Posts/Remove/"++ id ++ "\"> Delete </a> </p>"
                   ]