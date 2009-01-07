import Control.Monad.Trans
import Data.List
import qualified Network.HTTP as HTTP
import Network.URI as URI

markup =
    <html>
         <head> 
            <title> A poor-man's Blog </title>
         </head>
         <body>
              <div> 
                  <% insertDefaultView %>
              </div>
         </body>
    </html>
    