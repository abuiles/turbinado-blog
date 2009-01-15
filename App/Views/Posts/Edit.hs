markup =  <div>
            <h1>Edit </h1>
            <form  action=(getViewDataValue_u "post-update" :: View String)  method="post">
                      Title :
                      <input type="text" id="title" name="title" value=(getViewDataValue_u "post-title"::View String)></input><br></br><br></br>
                      <textarea name="content" id="content"  cols="40" rows="5">
                                <% getViewDataValue_u "post-body"::View String%>                               
                      </textarea>
                      <br></br>
                      <input type="submit" value="Save changes" />
            </form>
         </div>