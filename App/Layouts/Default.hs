import Control.Monad.Trans
import Data.List
import qualified Network.HTTP as HTTP
import Network.URI as URI

markup = <html>
          <head>
          <meta http-equiv="content-type" content="text/html; charset=utf-8" />
          <title>A poor-man's blog</title>
          <meta name="keywords" content="turbinado, haskell, mvc, model, view, controller, ruby, rails" > </meta>
          <meta name="description" content="This is a small Blog application written in Turbinado, which  is a Model-View-Controller-ish web framework written in Haskell." > </meta>
          <% styleSheet "default" "screen"%>          
          </head>
          <body>
          ----start header --------------
          <div id="header">
                   <div id="menu">
		           <ul>
	                      <li class="current_page_item"><a href="/Posts/Index"><span class="numbertxt">01 </span>Homepage</a></li>	                      			      
			      <li><a href="/Posts/About"><span class="numbertxt">02 </span>About</a></li>			     
                              <li class="last"> <a href="/Manage/Home"><span class="numbertxt">03 </span>Manage</a></li>
		           </ul>
	           </div>
          </div>
          <div id="logo">
                   <h1><a href="#"> A poor-man's</a></h1>
	           <h1> blog</h1>
          </div>
          --------end header-------------
          --------star page--------------
          <div id="page">
          <div id="content">
		           <% insertDefaultView %>	
	  </div>
	  --- end content --
          -- start sidebar --
	  <div id="sidebar">
		<ul>
			<li id="search">
				<h2>Search</h2>
				<form method="post" action="/Posts/Search" >
					<fieldset>
					<input type="text" id="s" name="s" value=""> </input>
					<input type="submit"  value="Search" > </input>
					</fieldset>
				</form>
			</li>				
		</ul>
	  </div>
	-- end sidebar --
          <div style="clear: both;">&nbsp;</div>
         </div>
        --end page------
        -- start footer --
          <div id="footer">
	          <div id="footer-wrap">
	                   <p id="legal">(c) 2009 A poor-man's blog. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	          </div>
          </div>
       -- end footer --       
         </body>               
         </html>
    
