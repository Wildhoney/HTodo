module Main where

import Control.Monad.IO.Class (liftIO)

import Store (addTodo)
import Interactive (promptAdd)

main :: IO ()
main = do
    task  <- promptAdd
    todos <- return $ addTodo task []
    putStrLn $ show $ todos
    return ()
