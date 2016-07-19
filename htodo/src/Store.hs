module Store (addTodo, removeTodo) where

import Data.List   (delete)
import Data.Either (Either(..))

addTodo :: Maybe a -> [a] -> [a]
addTodo (Just task) tasks = task:tasks
addTodo Nothing tasks     = tasks

removeTodo :: Eq a => Int -> [a] -> Either String [a]
removeTodo index tasks | inRange   = Right $ delete (tasks !! index) tasks
                       | otherwise = Left "Index too large"
    where
        inRange = index < length tasks
