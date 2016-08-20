module Main where

import System.Environment  (getArgs)
import System.Exit         (exitWith, ExitCode(..))
import Store               (addTodo, removeTodo, enumTodos)
import System.Console.ANSI (setSGR, SGR(..), ConsoleLayer(..), ColorIntensity(..), Color(..))

main = getArgs >>= parse

parse :: [String] -> IO ()
parse ["+", todo]  = addTodo todo
parse ["-", index] = removeTodo (read index :: Integer)
parse []           = enumTodos >>= enumerate >> exit
    where
        transform = \todo -> (show (fst todo) :: String) ++ ": " ++ snd todo
        enumerate = \todos ->
                        setSGR [SetColor Foreground Vivid Cyan] >>
                        (putStrLn . unlines . map transform) todos >>
                        setSGR [Reset]

usage   = putStrLn "Usage: htodo -/+ [task/index ..]"
version = putStrLn "Haskell htodo 0.1"
exit    = exitWith ExitSuccess
--die     = exitWith (ExitFailure 1)
