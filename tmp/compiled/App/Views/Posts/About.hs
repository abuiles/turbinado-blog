module App.Views.Posts.About where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <p size="large"> This is a small blog written in <a href="http://www.turbinado.org/">Turbinado</a>
         </p>-- SPLIT HERE

