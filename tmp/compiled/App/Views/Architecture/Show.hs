module App.Views.Architecture.Show where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <div>
           <% insertComponent "Page" "ListOnly" [("pages-prefix", "architecture")] %>
           <% insertComponent "Page" "Show" [] %>
         </div>
-- SPLIT HERE

