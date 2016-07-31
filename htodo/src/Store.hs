module Store (addTodo, removeTodo, enumTodos) where

import Data.List   (delete)
import Data.Either (Either(..))

addTodo :: Maybe a -> [a] -> [a]
addTodo (Just task) todos = task:todos
addTodo Nothing todos     = todos

removeTodo :: Eq a => Int -> [a] -> Maybe [a]
removeTodo index todos
    | inRange   = Just $ delete (todos !! index) todos
    | otherwise = Nothing
    where
        inRange = index < length todos

enumTodos :: (Enum a, Num a) => [b] -> [(a, b)]
enumTodos = zip [0..]
