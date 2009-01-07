module App.Views.Posts.Show where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <div>
           <h1><% getViewDataValue_u "post-title":: View String %> </h1>
           <p> <% getViewDataValue_u "post-content":: View String %> </p>
         </div>-- SPLIT HERE

