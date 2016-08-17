{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS_GHC -fno-cse #-}

module Args (handleArgs, HTodoArgs(..)) where

import System.Console.CmdArgs (Data, Typeable)
import Store                  (addTodo, removeTodo, enumTodos)

data HTodoArgs = HTodoArgs {
    add    :: String,
    remove :: Integer,
    list   :: String
} deriving (Show, Data, Typeable)

handleArgs :: HTodoArgs -> IO [(Integer, String)]
handleArgs HTodoArgs { add    = task@(_:_) } = addTodo task >> enumTodos
handleArgs HTodoArgs { remove = index }      = removeTodo index >> enumTodos
handleArgs HTodoArgs { list   = (_:_) }      = enumTodos
