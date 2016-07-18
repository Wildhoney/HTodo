module Interactive (promptAdd) where

--promptAdd :: String -> [String] -> [String]
promptAdd = do
    putStr $ "Task: "
    todo <- getLine
    return todo
