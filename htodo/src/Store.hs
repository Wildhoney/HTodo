module Store (addTodo, removeTodo, enumTodos) where

import Data.List (delete)
import System.IO (openFile, writeFile)
import System.Directory (removeFile, renameFile)

filename :: String
filename = "./htodo/todos.txt"

tmpFilename :: String
tmpFilename = "./htodo/todos.tmp"

readTodos :: IO [String]
readTodos = readFile filename >>= return . lines

addTodo :: String -> IO ()
addTodo task = appendFile filename (task ++ "\n") >> return ()

removeTodo :: Integer -> IO ()
removeTodo index = removeWhere index >>= stripIndexes >>= writeTemp >>= copyFile >> return ()
    where
        removeWhere index = enumTodos >>= return . filter (\x -> not $ fst x == index)
        stripIndexes      = return . map snd
        writeTemp         = writeFile tmpFilename . unlines
        copyFile          = return $ removeFile filename >> renameFile tmpFilename filename

enumTodos :: IO [(Integer, String)]
enumTodos = readTodos >>= parseLines
    where
        parseLines content = return $ zip [1..] $ content
