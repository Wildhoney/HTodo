module Interactive (promptAdd) where

promptAdd :: IO (Maybe String)
promptAdd = do
    putStr $ "Task: "
    todo <- getLine
    if not $ null todo then return $ Just todo else return Nothing
