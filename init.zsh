if [ ! -f /opt/homebrew/bin/brew ]
then
  return
fi

eval $(/opt/homebrew/bin/brew shellenv)

alias ibrew='arch -x86_64 /usr/local/bin/brew'

gnu=(export coreutils findutils gnu-indent gnu-sed gnutls grep gnu-tar gawk)

for package in "${gnu[@]}"
do
  path=/opt/homebrew/opt/$package/libexec/gnubin
  if [ ! -f "$path" ]
  then
    brew install $package
  fi
  export PATH=$path:$PATH
done

tools=(wget rsync curl ripgrep fd direnv git htop)

for package in "${tools[@]}"
do
  if [ ! -f "/opt/homebrew/$package" ]
  then
    brew install $package
  fi
done