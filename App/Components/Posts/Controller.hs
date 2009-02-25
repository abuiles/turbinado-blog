import Turbinado.Controller
import App.Models.Posts


numberOfComments :: Controller ()
numberOfComments = do pk <- getSetting_u "pk"::Controller String
                      nc <- getNumberOfComments (read pk::Integer)
                      setViewDataValue "nc" $ (show nc)

