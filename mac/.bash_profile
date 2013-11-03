export PATH="$PATH":~/workspace/depot_tools

# ls dircolors-solarized
# using gnu ls
# https://github.com/seebi/dircolors-solarized
# cp dircolors.ansi-dark ~/.dir_colors
eval `gdircolors ~/.dir_colors`
alias ls='gls --color=auto $LS_OPTIONS -hF'
alias ll='gls --color=auto $LS_OPTIONS -lhF'

TXTGRN='\[\e[0;32m\]' # Green
TXTRST='\[\e[0m\]'    # Text Reset
TXTCYN='\[\e[0;36m\]' # Cyan
PS1="┌─( $TXTGRN\u$TXTRST ) - ( $TXTCYN\w$TXTRST )\n└─> "

export GYP_GENERATORS='ninja'
export GYP_DEFINES="component=shared_library disable_nacl=1 remove_webcore_debug_symbols=1"
alias cdtest='cd ~/workspace/chromium-upstream/src/chrome/test/data/extensions/api_test/'
alias cdsysteminfo='cd ~/workspace/chromium-upstream/src/chrome/browser/extensions/api/system_info'
alias cdextensionapi='cd ~/workspace/chromium-upstream/src/chrome/browser/extensions/api'
alias cdbrowser='cd ~/workspace/chromium-upstream/src/chrome/browser'
alias cdapidefinition='cd ~/workspace/chromium-upstream/src/chrome/common/extensions/api'
alias cdgenapidefinition='cd ~/workspace/chromium-upstream/src/out/Debug/gen/chrome/common/extensions/api/'
alias cdtoolidlcomipler='cd ~/workspace/chromium-upstream/src/tools/json_schema_compiler/'
alias chromesrc='cd ~/workspace/chromium-upstream/src'
alias commondoc='cd ~/workspace/chromium-upstream/src/chrome/common/extensions/docs/templates'

alias github='cd ~/GitHub/'
