" Title:        Sendit
" Description:  Simple plugin that sends highlighted text to REPLs or
" interpreted environments.
" Last Change:  27 December 2023
" Maintainer:   Logan Van Vuren <https://github.com/lovur>

" Not exactly sure how this code works, but pulled it from Nathaniel Stickman @ https://www.linode.com/docs/guides/write-a-neovim-plugin-with-lua/

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_exampleplugin")
    finish
endif
let g:loaded_exampleplugin = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/sendit/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"
