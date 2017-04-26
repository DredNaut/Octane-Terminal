echo Exporting packages
echo .vimrc
mv vimrc ~/.vimrc
echo .bashrc
mv bashrc ~/.bashrc
echo .tmux.conf
mv tmux.conf ~/.tmux.conf
echo .tmux_snap
mv tmux_snap ~/.tmux_snap
echo
cd ~/.vim
mkdir bundle
mkdir autoload
cd autoload
echo Installing Pathogen
git clone https://github.com/tpope/vim-pathogen.git
echo Downloading Vim Plugins
cd ../bundle
echo Vim Airline
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
echo Vim Color-schemes
git clone https://github.com/flazz/vim-colorschemes.git
echo Vim Vinegar
git clone https://github.com/tpope/vim-vinegar.git
echo Tmuxline
git clone https://github.com/edkolev/tmuxline.vim.git
echo Vim Bufferline
git clone https://github.com/bling/vim-bufferline.git
cd
echo Installing Powerline Fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
