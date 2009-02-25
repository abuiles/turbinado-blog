module App.Views.Posts.NewSearch where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <div> 
             <h2>Search</h2>
	     <form method="post" action="/Posts/Search">
					<fieldset>
					<input type="text" id="s" name="s" value="" ></input>
					<input type="submit" value="Search" ></input>
                                       </fieldset>
              </form>
         </div> -- SPLIT HERE

