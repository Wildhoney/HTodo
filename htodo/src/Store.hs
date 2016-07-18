module Store (addTodo) where

import Data.List (delete)

addTodo :: Maybe a -> [a] -> [a]
addTodo (Just task) tasks = task:tasks
addTodo Nothing tasks     = tasks

removeTodo :: Eq a => Int -> [a] -> [a]
removeTodo index tasks    = delete (tasks !! index) tasks
