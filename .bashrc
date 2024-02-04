fnd() {
  if [ $# -gt 0 ]; then
    fzf --preview "bat --style=numbers --color=always {}" --query "$*" | while IFS= read -r file; do nvim "$file";  done
  else
    fzf --preview "bat --style=numbers --color=always {}" | while IFS= read -r file; do nvim "$file"; done
  fi
};

h() {
    if [ $# -gt 0 ]; then
      history | grep "$*" | sort | fzf | awk '{$1=""; print substr($0,2)}'
    else 
      history | sort | fzf | awk '{$1=""; print substr($0,2)}'
    fi
    eval "$cmd"
};

v() {
  if [ $# -gt 0 ]; then
    fzf --query "$*" | while IFS= read -r file; do nohup evince "$file" >/dev/null 2>&1 & done
  else 
    fzf | while IFS= read -r file; do nohup evince "$file" >/dev/null 2>&1 & done
  fi
}
