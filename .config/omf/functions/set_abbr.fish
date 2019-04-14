function abbr_set --description 'set abbreviations'
  echo "setting fish abbrevs..."
  # first erase all existing abbreviations
  for ab in (abbr --l)
    abbr --erase "$ab"
  end
  # then source current abbreviations
  source "$HOME/.config/fish/abbreviations.fish"
  set -U fish_abbreviations_set true
end