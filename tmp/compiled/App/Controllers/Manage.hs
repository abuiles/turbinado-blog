module App.Controllers.Manage where 


import Turbinado.Controller
import App.Models.Posts as PostsModel


home::Controller()
home = do posts <- PostsModel.findAll :: Controller [Posts]
          setViewDataValue "posts-titles" $ map (\p -> (Prelude.show(fromJust(_id p)),title p)) posts
          return ()


-- SPLIT HERE


