#! /bin/sh

VUNDLESRC="https://github.com/VundleVim/Vundle.vim.git"

DOTVIM="$HOME/.vim"
VIMRC="$HOME/.vimrc"
VIMRCOLD="$HOME/.vimrc.old"
DOTVIMRC="${DOTVIM}/.vimrc"
echo "Linking ${VIMRC} to ${DOTVIMRC} ..."
if [ -f "${VIMRC}" ]; then
	echo "... old ${VIMRC} found!"
	read -p "Move old ${VIMRC} to ${VIMRCOLD}? (y/N)" yn
	case $yn in
		[Yy]*) mv "${VIMRC}" "${VIMRCOLD}"
			echo "Moved. Although merging .vimrc's is a user responsibility, it is strongly encouraged."
			echo "linking ...";;
		*) echo "Arright, aborting!"
			exit 1;;
	esac
fi
ln -s "${DOTVIMRC}" "${VIMRC}"
echo "... done!"
echo "Cloning Vundle using ${VUNDLESRC} ..."
git clone "${VUNDLESRC}" "${DOTVIM}/bundle/Vundle.vim"
echo "... done!"
echo "Installing bundles ..."
vim -c VundleInstall
echo "... done!"

