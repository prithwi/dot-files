VIM Python IDE
===============

Install the plugins by running the following commands in the root of the
repository : 

1. ``git sudmodule init``
2. ``git submodule update`` 

Python mode configurations
--------------------------

1. To enable code completion/ import completion you need to set up a project.
To set up a project in the project folders (can be the top level) in a vim
session type ``:RopeOpenProject``. It will create the ``config.py`` where you
can add options such as files to ignore, warnings to ignore, etc.

2. To enable debugging you need to install ipdb

    ``pip install ipdb``


Cheat Sheet
------------

List of some commands according to the ``.vimrc`` present

* Code Completion: ``<Ctrl><space>``

* File search : ``<Ctrl>n``

* Folding code:

    * Only one block: ``,f``
    * All the blocks: ``,F``

* Goto definition : ``,g``

* Breakpoint :

    * Insert breakpoint : ``,b``
    * step into : ``s``
    * next line : ``n``
    * next breakpoint : ``c``
    * step up : ``up``
    * help : ``?``

* Sorting Imports :  Visual mode selction and ``<Ctrl>i``



TMUX Configurations
===================
Prefix key is ``\```  
    
    ` c             # create a new window  
    ` ,             # name the window (test, vim, console, log, etc.)  
    ` "             # split pane horizontally  
    ` %             # split pane vertically  
    ` j (or k)      # move up or down a pane  
    ` h (or l)      # move left or right a pane  
    ` x             # kill a pane or window  
    ` <number>      # move to window <number>  
    ` n (or p)      # move to next (or previous) window  
    ` l             # move to previously selected window  
    ` f             # find window by name  
    ` Alt+<left>    # Resize Windows left/right/etc. 

Session management
-------------------
    attach (or a) # attaches a session
    detach (or d) # detaches a session
    kill-session -t <session id>
    rename-session -t <old> <new>


