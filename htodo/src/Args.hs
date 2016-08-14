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

handleArgs :: HTodoArgs -> IO [String]
handleArgs HTodoArgs { add    = task@(_:_) }  = addTodo task
--handleArgs HTodoArgs { remove = index@(_:_) } = removeTodo 1
--handleArgs HTodoArgs { list   = (_:_) }       = enumTodos
--handleArgs args                               = print args
