markup = <div class="post">
         <h1 class="title"><% getViewDataValue_u "post-title":: View String %></h1>
           <p class="entry">
              <% getViewDataValue_u "post-content":: View String %>
           </p>            
            <p>
               <small>
                       Created at: <% getViewDataValue_u "post-createdAt":: View String %>
               </small>
               
           </p>
           <hr></hr>
           <br></br>           
           <h2> Comments </h2>
           <hr></hr>
           <p class="comments"> 
                <% do c <-  getViewDataValue_u "comments-list" ::View [(String,String)] 
                      mapM commentItem c
                %>
           </p>      
           <hr></hr>
           <h3>Add a comment</h3>
            <form  action=(getViewDataValue_u "save-comment-url" :: View String)  method="post">
                      Author :
                      <input type="text" id="author" name="author"></input><br></br><br></br>
                      <textarea name="body" id="body"  cols="40" rows="5">
                               
                      </textarea>
                      <br></br>
                      <input type="submit" value="Submit comment"/>
            </form>
         </div>
            
commentItem (a,b) = return $ cdata $ unlines $
                    ["<div class='comments'>"
                   ,"<p>By: "++ a ++ "</p>"
                   ,"<p>" ++ b ++ "</p>"
                   ,"</div>"
                   ,"<hr>"
                   ]