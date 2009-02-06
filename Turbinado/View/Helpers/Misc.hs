module Turbinado.View.Helpers.Misc ( 
  breadCrumbs
  ) where

import Data.List
import Data.Maybe
import qualified Network.URI as URI
import qualified Network.HTTP as HTTP
import System.FilePath


import Turbinado.View


breadCrumbs :: View XML
breadCrumbs = do e <- getEnvironment
                 let r  = fromJust $ getRequest e
                     ps = tail $ splitDirectories $ URI.uriPath $ HTTP.rqURI r
                 return $ cdata $"<div class='breadcrumbs'>" ++ (concat $ intersperse " : " ps) ++ "</div>" 
