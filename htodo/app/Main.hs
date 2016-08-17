module Main where

import System.Environment (getArgs)
import System.Exit        (exitWith, ExitCode(..))
import Store              (addTodo, removeTodo, enumTodos)

main = getArgs >>= parse

parse ["+", todo]  = addTodo todo
parse ["-", index] = removeTodo 1
parse []           = enumTodos >>= print >> exit

usage   = putStrLn "Usage: htodo -/+ [todo/index ..]"
version = putStrLn "Haskell htodo 0.1"
exit    = exitWith ExitSuccess
--die     = exitWith (ExitFailure 1)
