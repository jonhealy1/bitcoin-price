{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_bitcoin_price (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/comp/haskell/bitcoin-price/.stack-work/install/x86_64-osx/8c86912137a1df9c27765d389baa2e80dc82153a9ea5eba583a95991a8f04f43/8.10.6/bin"
libdir     = "/Users/comp/haskell/bitcoin-price/.stack-work/install/x86_64-osx/8c86912137a1df9c27765d389baa2e80dc82153a9ea5eba583a95991a8f04f43/8.10.6/lib/x86_64-osx-ghc-8.10.6/bitcoin-price-0.1.0.0-HOIYripbnf43g8PeP0Cxpn-bitcoin-price"
dynlibdir  = "/Users/comp/haskell/bitcoin-price/.stack-work/install/x86_64-osx/8c86912137a1df9c27765d389baa2e80dc82153a9ea5eba583a95991a8f04f43/8.10.6/lib/x86_64-osx-ghc-8.10.6"
datadir    = "/Users/comp/haskell/bitcoin-price/.stack-work/install/x86_64-osx/8c86912137a1df9c27765d389baa2e80dc82153a9ea5eba583a95991a8f04f43/8.10.6/share/x86_64-osx-ghc-8.10.6/bitcoin-price-0.1.0.0"
libexecdir = "/Users/comp/haskell/bitcoin-price/.stack-work/install/x86_64-osx/8c86912137a1df9c27765d389baa2e80dc82153a9ea5eba583a95991a8f04f43/8.10.6/libexec/x86_64-osx-ghc-8.10.6/bitcoin-price-0.1.0.0"
sysconfdir = "/Users/comp/haskell/bitcoin-price/.stack-work/install/x86_64-osx/8c86912137a1df9c27765d389baa2e80dc82153a9ea5eba583a95991a8f04f43/8.10.6/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bitcoin_price_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bitcoin_price_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "bitcoin_price_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "bitcoin_price_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bitcoin_price_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bitcoin_price_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
