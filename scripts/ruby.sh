ruby_packages=(
  rails
)

# we init rbenv in init.fish, we need to do it 
# the first time too bc fish config might not have loaded yet
eval "$(rbenv init -)"
echo "Installing Ruby version $USER_RUBY_VERSION..."
rbenv install $USER_RUBY_VERSION
echo "Global Ruby version  set to $USER_RUBY_VERSION..."
rbenv global $USER_RUBY_VERSION
echo "Installing Rails version $USER_RUBY_VERSION..."
# gem install rails -v $USER_RAILS_VERSION
# run `rehash` anytime you install a gem that provides commands
rbenv rehash


echo "Installing gems..."
echo ${ruby_packages[@]}
# gem install ${ruby_packages[@]} -v $USER_RAILS_VERSION
echo "Installing SDK, sudo required..."
echo "(Mojave broke pg, nokogiri, any gem that uses C extensions)"
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /