export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/.platformio/penv/bin"
export VAGRANT_DEFAULT_PROVIDER=parallels
export PATH="$HOME/.rd/bin:$PATH"

PROMPT='%n@%m%f %F{103}%~
%F{38}λ%f '

# Enable the completion system
autoload -Uz compinit && compinit

# Tab completion styling
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion
# zstyle ':completion:*' menu select                      # Graphical menu selection using arrow keys
# zstyle ':completion:*' colored true                     # Colorize completions matching ls colors

# If installed via Homebrew on macOS:
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# ========================================
# quick dry-run yaml generation: kubectl run pod $do > pod.yaml
export do="--dry-run=client -o yaml"
# quick force delete: kubectl delete pod x $now
export now="--force --grace-period=0"

alias kn='kubectl config set-context --current --namespace'
alias kga='kubectl get all'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'
alias kd='kubectl describe'
alias kl='kubectl logs -f'
alias kx='kubectl exec -it'
alias kaf='kubectl apply -f'
alias kdel='kubectl delete'

if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
    compdef _kubectl k
fi
alias k=kubectl