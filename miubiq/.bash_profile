source ~/.bashrc

# MacPorts Installer addition on 2019-04-12_at_14:13:35: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:/Users/tachibana/.opam/4.07.1/bin/omake:$PATH"

export MCR_ROOT="/Applications/MATLAB/MATLAB_Runtime"
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$MCR_ROOT/v95/runtime/maci64:$MCR_ROOT/v95/sys/os/maci64:$MCR_ROOT/v95/bin/maci64
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$MCR_ROOT/v901/runtime/maci64:$MCR_ROOT/v901/sys/os/maci64:$MCR_ROOT/v901/bin/maci64
# Finished adapting your PATH environment variable for use with MacPorts.

PATH=/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin:/Users/tachibana/.opam/4.07.1/bin/omake:$PATH

# opam configuration
test -r /Users/tachibana/.opam/opam-init/init.sh && . /Users/tachibana/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

alias sshmatlab="ssh -N matlab"
alias setd='export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$MCR_ROOT/v901/runtime/maci64:$MCR_ROOT/v901/sys/os/maci64:$MCR_ROOT/v901/bin/maci64'
alias unsetd="unset DYLD_LIBRARY_PATH"
epsptopdf() {
    unsetd;
    epstopdf $1;
    setd;

}

#ssh change background image
alias ssh='~/Documents/pokemonsh/ssh-change-profile.sh'

#for iterm color
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"
# define for PS1
black=$'\e[30m' # Black - Regular
red=$'\e[31m' # Red
green=$'\e[32m' # Green
yellow=$'\e[33m' # Yellow
blue=$'\e[34m' # Blue
purple=$'\e[35m' # Purple
cyan=$'\e[36m' # Cyan
white=$'\e[37m' # White

# display git status
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

#export PS1="\w\[$red\]parse_git_branch\[$white\]> "
export PS1="\[$green\]\w\[$red\]\`parse_git_branch\`\[$white\] > "
