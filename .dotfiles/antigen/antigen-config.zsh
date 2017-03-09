#Load the oh-my-zsh's library
antigen use oh-my-zsh

#Theme
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
#antigen theme https://gist.github.com/3750104.git agnoster

#Bundles for the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle sorin-ionescu/prezto
antigen bundle peterhurford/git-aliases.zsh
antigen bundle chrissicool/zsh-256color
antigen bundle caarlos0/zsh-add-upstream
antigen bundle caarlos0/zsh-pg
antigen bundle ascii-soup/zsh-url-highlighter
antigen bundle robbyrussell/oh-my-zsh plugins/pip
antigen-apply
