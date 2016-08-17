module Store (addTodo, removeTodo, enumTodos) where

import System.IO        (writeFile, hPutStr, openTempFile)
import System.Directory (removeFile, renameFile)

filename :: String
filename = "./htodo/todos.txt"

readTodos :: IO [String]
readTodos = readFile filename >>= return . lines

addTodo :: String -> IO ()
addTodo task = appendFile filename (task ++ "\n") >> return ()

removeTodo :: Integer -> IO ()
removeTodo index = openTempFile "." "txt" >>= \(name, handle) ->
    enumTodos >>=
    return . filter (\x -> not $ fst x == index) >>=
    return . map snd >>=
    hPutStr handle . unlines >>
    removeFile filename >>
    renameFile name filename >>
    return ()

enumTodos :: IO [(Integer, String)]
enumTodos = readTodos >>= return . zip [1..]
