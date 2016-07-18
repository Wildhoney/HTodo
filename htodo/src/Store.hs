module Todos (add) where

add :: String -> [String] -> [String]
add task tasks = task:tasks
