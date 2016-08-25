sh -v get_latest_pathogen.sh 
cd bundle/
python clone_plugin_repos.py 
cd ..
sh -v unix_make_symbolic_links.sh 
