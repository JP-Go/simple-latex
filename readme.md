# Simple-latex

A set of usefull functions to write LaTeX documents for NeoVim, developed in lua.

## A brief apology

This plugin is **not** a "Development Enviroment" for LaTeX documents. It is just
set of usefull functions to help LaTeX writers to compile, modify and view their 
documents with ease and in their prefered programs without leaving vim for it. 
It will not highlight keywords, errors, or give sugestions. Such features are 
not present in this plugin.

The main focus of this project is to provide vim users (or even "LaTeX IDEs
users") a minimal set of tools to write LaTeX documents. These tools should be
minimal in the sense that this plugin will not have a load of advanced features
(hence its name). With this plugin, you have just the essentials tools to build
your LaTeX projects without leaving vim and losing your focus on editing the
document. 

For a part LaTeX user, this toolset will not be enough and lack some feature
desired . In that case, [the vimtex](https://https://github.com/lervag/vimtex), 
which is a font of inspiration for this plugin, will be more suited for you. It 
has a ton of really good features.

## Instalation

1. Use a plugin manager to download the plugin:

* With vim-plug:

```
Plug 'JP-Go/simple-latex'
```

* With packer

```
use 'JP-Go/simple-latex'
```

2. Add this line to your init file:

* For init.vim:
```vim
lua require('simple-latex')
```
* For init.lua
```
require('simple-latex')
```
## Features

* LaTeX compilation with yout prefered LaTeX engine: Compiling your LaTeX file 
is easy.Just lauch this command: `:CompileLatex {your prefered engine here}`.

* Pdf preview with yout prefered pdf viewer

* Enviroment editing: Change, toggle to star enviroment, and even 
delete the enviroments faster. [not yet fully implemented]

## Configuration

Before all that, I recommend that you use a special autocommand for this plugin,
to require it only if nedded.

There is (for now) a set of variables that control the behavior of this plugin
that are defined on your init file. They are:

__g:simple_latex_engines__: Your prefered LaTeX engines to compile your LaTeX 
documents. Is an array of strings that are executables used 
to compile a tex file. The executables must be in your $PATH enviroment 
variable. If not set by the user, it defaults to 
`{"pdflatex","xelatex","lualatex"}`.

__g:simple_latex_viewer__: The document viewer that you will use to preview 
pdf files. Also should be an executable on your $PATH. If not user's set, it
defaults to `"xdg-open"`, which should cover most of the Unix operating systems.

__g:simple_latex_default_mappings__: Tells if the default keymappings should be 
used. If you wish to define your own mappings, set this to false. The default 
value is `true` (or 1, in Vimscript). More information on the mappings in the [Keymaps](#Commands-and-keymaps) 
section.


## Commands-and-keymaps

By default, these keymaps are prefixed by the "<space>" key, to avoid making the 
user lift his hand of the keyboard. They are set this way to be intuitive and 
fairly verbose. The default keymaps are:

```vim
nnoremap <space>cp CompileLatex pdflatex
nnoremap <space>cx CompileLatex xelatex
nnoremap <space>cl CompileLatex lualatex
nnoremap <silent> <space>pp PreviewPdf
```
The commands used are usable from the vim command line. Some features not yet
fully implemented are the changing, deleting and toggling of the enviroments 
surrounding the cursor. They can be used by calling the command in the vim command
line.

`ChangeSurroundingEnviroment` changes the name of the surrounding enviroment to 
one of your chosing. It will prompt you to chose it's name.
`ToggleStarEnviroment` will toggle the variant of the enviroment (stared or not 
stared).this is usefull when using some of the amsmath enviroments.
`DeleteSurroundingEnviromet` will delete the enviroment begin and end lines, it 
will not delete the content inside it.

## Feedback and contributing

I'm a college student right now, so time to develop is not much. But despite of 
that, I'll make the effort to analize issues and pull requests as often as 
possible.

### PS

(I'm not a native English speaker so... sorry if I butcher your language 😄)
