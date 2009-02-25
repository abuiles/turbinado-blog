module App.Components.Page.Views.Show where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <div class="page-content">
           <h1><% getViewDataValue_u "page-title" :: View String %></h1>
           <% (getViewDataValue_u "page-content" :: View String) >>= (return . cdata) %>
         </div>

-- SPLIT HERE

