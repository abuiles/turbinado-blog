markup = <div>
            <h1>New Post </h1>
            <form  action=(getViewDataValue_u "save-url" :: View String)  method="post">
                      Title :
                      <input type="text" id="title" name="title"></input><br></br><br></br>
                      <textarea name="content" id="content"  cols="40" rows="5">
                               
                      </textarea>
                      <br></br>
                      <input type="submit" value="Save" />
            </form>

         </div>