module Store (addTodo, removeTodo, enumTodos) where

import Data.List (delete)
import System.IO (openFile, writeFile)
import System.Directory (removeFile, renameFile)

filename :: String
filename = "./htodo/todos.txt"

tmpFilename :: String
tmpFilename = "./htodo/todos.tmp"

readTodos :: IO [String]
readTodos = readFile filename >>= (\todos -> return $ lines todos)

addTodo :: String -> IO [String]
addTodo task = appendFile filename (task ++ "\n") >> readTodos

removeTodo :: Integer -> IO ()
removeTodo index = removeBy index >>= stripIndexes >>= writeTemp >>= copyFile
    where
        removeBy index     = enumTodos >>= (\todos -> return $ filter (\x -> not $ fst x == index) todos)
        stripIndexes todos = return $ map snd todos
        writeTemp todos    = writeFile tmpFilename $ unlines todos
        copyFile           = return $ removeFile filename >> renameFile tmpFilename filename

enumTodos :: IO [(Integer, String)]
enumTodos = readTodos >>= parseLines
    where
        parseLines content = return $ zip [1..] $ content
