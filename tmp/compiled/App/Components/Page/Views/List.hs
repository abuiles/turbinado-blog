module App.Components.Page.Views.List where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup= <div class="page-listing">
          <h1>
            Pages
          </h1>
          <% do l <- getViewDataValue_u "component-pages-list" :: View [(String, String)]
                mapM indexItem l 
          %>
        </div>

indexItem (t,i) = return $ cdata $ unlines $
                   ["<div style='padding: 0pt 5px;'>"
                   ," <a href=\"" ++ i ++"\">"
                   ,"  "++ t
                   ," </a>"
                   ,"</div>"
                   ]
-- SPLIT HERE

