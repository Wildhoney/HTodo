module Main where

import System.Environment (getArgs)
import System.Exit        (exitWith, ExitCode(..))
import Store              (addTodo, removeTodo, enumTodos)

main = getArgs >>= parse

parse ["+", todo]  = addTodo todo
parse ["-", index] = removeTodo (read index :: Integer)
parse []           = enumTodos >>= enumerate >> exit
    where
        enumerate = putStrLn . unlines . map transform
        transform = (\todo -> (show (fst todo) :: String) ++ ": " ++ snd todo)

usage   = putStrLn "Usage: htodo -/+ [task/index ..]"
version = putStrLn "Haskell htodo 0.1"
exit    = exitWith ExitSuccess
--die     = exitWith (ExitFailure 1)
