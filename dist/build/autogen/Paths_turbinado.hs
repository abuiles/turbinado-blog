module Paths_turbinado (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,2], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/adolfo/.cabal/bin"
libdir     = "/home/adolfo/.cabal/lib/turbinado-0.2/ghc-6.8.3"
datadir    = "/home/adolfo/.cabal/share/turbinado-0.2"
libexecdir = "/home/adolfo/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "turbinado_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "turbinado_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "turbinado_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "turbinado_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
