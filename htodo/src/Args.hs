{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS_GHC -fno-cse #-}

module Args (handleArgs, HTodoArgs(..)) where

import System.Console.CmdArgs (Data, Typeable)
import Store                  (addTodo, removeTodo, enumTodos)

data HTodoArgs = HTodoArgs {
    add    :: String,
    remove :: String,
    list   :: String
} deriving (Show, Data, Typeable)

handleArgs :: HTodoArgs -> IO ()
handleArgs HTodoArgs { add    = task@(_:_) }  = print $ "Add: " ++ task
handleArgs HTodoArgs { remove = index@(_:_) } = print $ "Remove: " ++ index
handleArgs HTodoArgs { list   = (_:_) }       = print "Listing..."
handleArgs args                               = print args
