module Main where

import Store       (addTodo, removeTodo)
import Interactive (promptAdd)

main :: IO ()
main = do
    task     <- promptAdd
    let todos = addTodo task []
    putStrLn $ show $ todos
