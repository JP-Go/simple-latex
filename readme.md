# Simple-latex

A set of usefull functions to write LaTeX documents for NeoVim, writen in lua.
(requires Nvim >0.5)

## A brief apology

The main focus of this project is to provide vim users (or even "LaTeX IDEs
users") a **minimal** (just the bare bones essentials) set of tools to write
LaTeX documents. These tools should be minimal in the sense that this plugin
will not have a load of advanced features (hence its name). With this plugin,
you have just the essentials tools to build your LaTeX projects without leaving
vim and losing your focus on editing the document.

For a part LaTeX user, this toolset will not be enough and lack some feature
desired . In that case, [the vimtex](https://https://github.com/lervag/vimtex),
which is a font of inspiration for this plugin, will be more suited for you. It
has a ton of really good features.

## Instalation

1. Use a plugin manager to download the plugin:

* With vim-plug:

```vim
Plug 'JP-Go/simple-latex'
```

* With packer

```lua
use 'JP-Go/simple-latex'
```

1. Add this line to your init file (tip: use an autocommand for this):

* For init.vim:

```vim
lua require('simple-latex')
```

* For init.lua

```lua
require('simple-latex')
```

## Features

* LaTeX compilation with yout prefered LaTeX engine: Compiling your LaTeX file
is easy.Just lauch this command: `:CompileLatex {your prefered engine here}`.

* Pdf preview with your prefered pdf viewer

* Enviroment editing: Change, toggle to star enviroment, and even delete the
enviroments faster.

## Configuration

Before all that, I recommend that you use a special autocommand for this plugin,
to require it only if nedded.

There is (for now) a set of variables that control the behavior of this plugin
that are defined on your init file. They are:

__g:simple_latex_engines__: Your prefered LaTeX engines to compile your LaTeX
documents. Is an array of strings that are executables used to compile a tex
file. The executables must be in your $PATH enviroment variable. If not set by
the user, it defaults to `{"pdflatex","xelatex","lualatex"}`.

__g:simple_latex_viewer__: The document viewer that you will use to preview pdf
files. Also should be an executable on your $PATH. If not user's set, it
defaults to `"xdg-open"`, which should cover most of the Unix operating
systems.

__g:simple_latex_default_mappings__: Tells if the default keymappings should be
used. If you wish to define your own mappings, set this to false. The default
value is `true` (or 1, in Vimscript). More information on the mappings in the
[Keymaps](#Commands-and-keymaps) section.

__g:simple_latex_compile_options__: Allow to set compile options to the LaTeX 
compiler. Should be set as an vimscript array of strings 
(eg.`['-halt-on-error','-draftmode']`) or a lua table, if prefered 
(eg. `{'-halt-on-error','-draftmode'}`) as is set in your prefered LaTeX engine.
(In Lualatex this options are preceded by two dashes instead of one).

__g:simple_latex_synctex__: Enables SyncTex file creation and sets the SyncTex 
option for the compiler. Should be a number following the SyncTex manual. If not 
set or set to 0,the compiler will not generate the syncronization file .

OBS.: For now, we don't support forward an backward searches with SyncTex in 
all viewers out of the box, only in Evince (Linux).

## Commands-and-keymaps

By default, the keymaps are prefixed by the "<space>" key, to avoid making
the user lift his hand of the keyboard. They are set this way to be intuitive
and fairly verbose. The default keymaps are:

### Keymaps
```vim
nnoremap <space>cp <cmd>CompileLatex pdflatex<cr>
nnoremap <space>cx <cmd>CompileLatex xelatex<cr>
nnoremap <space>cl <cmd>CompileLatex lualatex<cr>
nnoremap <silent> <space>vp <cmd>ViewPdf<cr>
nnoremap <silent> <space>vl <cmd>ViewLatexlog<cr>
nnoremap <space>cse <cmd> ChangeSurroudingEnviroment<cr>
nnoremap <space>dse <cmd> DeleteEnviroment<cr>
nnoremap <space>tse <cmd> ToggleStarEnviroment<cr>
```
These keymaps can be set manually, if the user prefers by setting the 
        `simple_latex_default_mappings` to false, explicitly.
###Commands

`CompileLatex compiler`: Compile the current LaTeX file with `compiler`

`ViewPdf`: Opens a pdf file that coresponds to the current LaTeX file

`ViewLatexlog`: Opens the current LaTeX file logs.

`ChangeSurroudingEnviroment`: Change the name of the enviroment that is surrounding the
current cursor position

`DeleteEnviroment`: Delete the enviroment delimiters that surround the current cursor position 

`ToggleStarEnviroment`: Turns the the enviroment that surrounds the cursor into a star (*) enviroment.
Usefull for AMS packages

## Feedback and contributing

I'm a college student right now, so time to develop is not much. But despite of
that, I'll make the effort to analize issues and pull requests as often as
possible.

## PS

(I'm not a native English speaker so... sorry if I butchered it 😄)

## TODO

- [] Allow SyncTex forward and backward searches for more editors

- [] New feature: simple bibtex integration

- [] Change the way to view the log file (It should move to the error line. Maybe use a popup window)

- [] Port to non Unix-based systems (Windows)
