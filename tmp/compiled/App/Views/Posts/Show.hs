module App.Views.Posts.Show where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <div>
           <h1><% getViewDataValue_u "post-title":: View String %></h1>
           <p>
              <% getViewDataValue_u "post-content":: View String %>
           </p>            
            <p>
               <small>
                       Created at: <% getViewDataValue_u "post-createdAt":: View String %>
               </small>
               <br></br><a href="/Posts/Index">Index</a>
           </p>
           <hr></hr>
           <br></br>           
           <h3> Comments </h3>
           <hr></hr>
           <p> 
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
                    ["<div style='padding: 0pt 5px;'>"
                   ,"<p>By: "++ a ++ "</p>"
                   ,"<p>" ++ b ++ "</p>"
                   ,"</div>"
                   ,"<hr>"
                   ]-- SPLIT HERE

