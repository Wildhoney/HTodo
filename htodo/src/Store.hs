module Store (addTodo, removeTodo, enumTodos) where

import Data.List        (delete)
import Data.Either      (Either(..))

filename :: String
filename = "./htodo/todos.txt"

readTodos :: IO [String]
readTodos = readFile filename >>= (\todos -> return $ lines todos)

addTodo :: String -> IO [String]
addTodo task = appendFile filename (task ++ "\n") >> readTodos

removeTodo :: Int -> IO [String]
removeTodo index = readTodos >>= (\todos -> return $ delete (todos !! index) todos)

enumTodos :: IO [(Integer, String)]
enumTodos = readTodos >>= parseLines
    where
        parseLines content = return $ zip [1..] $ content
