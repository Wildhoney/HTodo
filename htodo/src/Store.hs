module Store            (addTodo, removeTodo, enumTodos) where

import System.IO        (writeFile, hPutStr, openTempFile)
import System.Directory (removeFile, renameFile)

filename :: String
filename = "./htodo/todos.txt"

addTodo :: String -> IO ()
addTodo task = appendFile filename (task ++ "\n") >> return ()

removeTodo :: Integer -> IO ()
removeTodo index = openTempFile "." "txt" >>= \(name, handle) ->
    enumTodos >>=
    return . filter (\todo -> not $ fst todo == index) >>=
    return . map snd >>=
    hPutStr handle . unlines >>
    removeFile filename >>
    renameFile name filename >>
    return ()

enumTodos :: IO [(Integer, String)]
enumTodos = readFile filename >>= return . lines >>= return . zip [1..]
