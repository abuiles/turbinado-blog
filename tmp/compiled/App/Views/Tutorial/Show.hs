module App.Views.Tutorial.Show where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <div>
           <% insertComponent "Page" "ListOnly" [("pages-prefix", "tutorial")] %>
           <% insertComponent "Page" "Show" [] %>
         </div>
-- SPLIT HERE

