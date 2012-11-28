VIM Python IDE
===============

Install the plugins by running the following commands in the root of the
repository : 

1. ``git sudmodule init``
2. ``git submodule update`` 

Python mode configurations
--------------------------

1. To enable code complettion/ import completion you need to set up a project.
To set up a project in the project folders (can be the top level) in a vim
session type ``:RopeOpenProject``. It will create the ``config.py`` where you
can add options such as files to ignore, warnings to ignore, etc.

2. To enable debugging you need to install ipdb

    ``pip install ipdb``


Cheat Sheat
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

