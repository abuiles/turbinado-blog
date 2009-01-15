module App.Views.Posts.About where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <p size="medium">Hi! I am Adolfo Builes and I am the person behind this  poor blog application which has been written <br></br>
               using Turbinado; Turbinado is a Model-View-Controller-ish web framework written in Haskell by Alson Kemp
         </p>-- SPLIT HERE

