{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS_GHC -fno-cse #-}

module Args (handleArgs, HTodoArgs(..)) where

import System.Console.CmdArgs (Data, Typeable)

data HTodoArgs = HTodoArgs {
    add    :: String,
    remove :: String,
    list   :: String
} deriving (Show, Data, Typeable)

handleArgs :: HTodoArgs -> IO ()
handleArgs HTodoArgs { add    = (_:_) } = print "Adding..."
handleArgs HTodoArgs { remove = (_:_) } = print "Removing..."
handleArgs HTodoArgs { list   = (_:_) } = print "Listing..."
handleArgs args                         = print args
