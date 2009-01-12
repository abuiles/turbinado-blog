markup = <div>
           <h1><% getViewDataValue_u "post-title":: View String %></h1>
           <p>
              <% getViewDataValue_u "post-content":: View String %>
           </p>            
            <p>
               <small>
                       Created at: <% getViewDataValue_u "post-createdAt":: View String %>
               </small>
           </p>
           <hr></hr>            
           <h3> Comments </h3>
           <hr></hr>
           <h3>Add a comment</h3>
            <form  action=(getViewDataValue_u "save-comment-url" :: View String)  method="post">
                      Author :
                      <input type="text" id="author" name="Author"></input><br></br><br></br>
                      <textarea name="content" id="content"  cols="40" rows="5">
                               
                      </textarea>
                      <br></br>
                      <input type="submit" value="Submit comment"/>
            </form>
         </div>