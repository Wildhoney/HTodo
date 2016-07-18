module Interactive (promptAdd) where

promptAdd :: IO String
promptAdd = do
    putStr $ "Task: "
    todo <- getLine
    return todo
