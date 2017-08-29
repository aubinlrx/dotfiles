# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# load rbenv if available
if commad -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in th root of the repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH
