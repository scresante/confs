PROMPT="%F{184}%B%n@%m%b%f %F{55}%B${PWD/#$HOME/~}%b%f %(!.#.$) "
RPROMPT='[%*]'
