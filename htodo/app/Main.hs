{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS_GHC -fno-cse #-}

module Main where

import System.Console.CmdArgs (cmdArgs, help, (&=), Data, Typeable)
import Store                  (addTodo, removeTodo, enumTodos)
import Args                   (handleArgs, HTodoArgs(..))

main = handleArgs =<< cmdArgs HTodoArgs {
    add    = "" &= help "Add a todo",
    remove = "" &= help "Remove a todo by its index",
    list   = "" &= help "List all todos with their associated indices"
}
