module App.Views.Posts.Test where 

import Config.Master
import Turbinado.View
import Turbinado.View.Helpers
import Control.Monad.Trans

markup :: View XML
markup = <h1> hello </h1>-- SPLIT HERE

