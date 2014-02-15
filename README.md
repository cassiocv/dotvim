Arquivos de configurações do Vim
	*by Cassio Chaves Vieira*


*Baixar a versão do Repositório:*

cd ~

git clone https://github.com/cassiocv/dotvim.git

ln -s ~/.vim/vimrc ~/.vimrc

ln -s ~/.vim/gvimrc ~/.gvimrc


*Baixar os novos plugins:*
git submodule init

git submodule update



*Instalar um plugin:*

cd ~/.vim

git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive

git commit -m "Instalação de fugitive"

git push
