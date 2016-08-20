module Main where

import System.Environment  (getArgs)
import System.Exit         (exitWith, ExitCode(..))
import Store               (addTodo, removeTodo, enumTodos)
import System.Console.ANSI (setSGR, SGR(SetColor, SetConsoleIntensity, Reset), ConsoleIntensity(..), ConsoleLayer(Foreground),
                            ColorIntensity(Vivid), Color(Cyan))

main :: IO ()
main = title >> getArgs >>= parse

title :: IO ()
title = setSGR [SetColor Foreground Vivid Cyan] >>
        setSGR [SetConsoleIntensity BoldIntensity] >>
        putStrLn "\nHTodo\n" >>
        setSGR [Reset]

parse :: [String] -> IO ()
parse ["+", todo]  = addTodo todo
parse ["-", index] = removeTodo (read index :: Integer)
parse []           = enumTodos >>= enumerate >> exit
    where
        transform = \todo -> " " ++ (show (fst todo) :: String) ++ ": " ++ snd todo
        enumerate = putStrLn . unlines . map transform

usage   = putStrLn "Usage: htodo -/+ [task/index ..]"
version = putStrLn "Haskell htodo 0.1"
exit    = exitWith ExitSuccess
--die     = exitWith (ExitFailure 1)
