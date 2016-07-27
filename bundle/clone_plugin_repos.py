#!usr/bin/env python
#coding: utf-8
import os

repos_dict = {
    "surround" : "https://github.com/tpope/vim-surround.git",
    "tcomment" : "https://github.com/tomtom/tcomment_vim.git",
    "mru" : "https://github.com/vim-scripts/mru.vim.git",
    #"zencoding" : "https://github.com/mattn/zencoding-vim.git",
	"emmet (zencoding)" : "https://github.com/mattn/emmet-vim.git",
    "fugitive" : "https://github.com/tpope/vim-fugitive.git",
    # "matchit" : "https://github.com/tsaleh/vim-matchit.git"
    "rust": "https://github.com/rust-lang/rust.vim.git",
    "a.vim": "https://github.com/vim-scripts/a.vim.git",
    "nerdtree": "https://github.com/scrooloose/nerdtree.git",
    "ctrlp": "https://github.com/kien/ctrlp.vim.git",
    "python-mode": "https://github.com/klen/python-mode.git",
     }

# [repos_dict["mru"][repos_dict["mru"].rfind("/")+1:] for x in repos
# element = repos_dict["mru"]
# element[element.rfind("/")+1:]

# expected names of directories after git clone <url>
dirnames = {val[val.rfind("/")+1:-len(".git")]:val for val in repos_dict.values()}
print(dirnames)
print()

def main():
    last = None
    for name, url in repos_dict.items():
        # folder_name = 
       print(name, url)
       
    # dirs = os.listdir(".")
    dirs = dirnames.keys()
    for x in dirs:
        # if the directory doesn't exist, create it so you can clone it
        if not os.path.isdir(x):
            os.mkdir(x)
        # enter directory
        commands = "".join(("cd ",x))
        print("run ",commands)
        os.system(commands)

        # if git repo, execute pull 
        if ".git" in os.listdir(x):
            commands = "".join(("git pull -v"))
        else:
            commands = "".join(("git clone ", dirnames[x]))
        print("run ",commands)
        os.system(commands)
        
        # exit directory
        commands = "".join(("cd .."))
        print("run ",commands)
        os.system(commands)

if __name__ == "__main__":
    main()
