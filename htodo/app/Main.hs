module Main where

import System.Console.CmdArgs (cmdArgs, def, help, (&=), Data, Typeable)
import Args                   (handleArgs, HTodoArgs(..))

main = handleArgs =<< cmdArgs HTodoArgs {
    add    = def &= help "Add a todo",
    remove = def &= help "Remove a todo by its index",
    list   = def &= help "List all todos with their associated indices"
}
