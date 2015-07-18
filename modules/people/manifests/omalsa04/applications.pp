class people::omalsa04::applications(
  $my_sourcedir = $people::omalsa04::params::my_sourcedir,
  $my_homedir   = $people::omalsa04::params::my_homedir,
  $my_username  = $people::omalsa04::params::my_username
) {
  include chrome
  include dropbox
  include iterm2::dev
  include virtualbox
  include skype
  include sublime_text
  include vlc
  include tmux
  include java

  include zsh
  include homebrew
  include iterm2::dev

 $homebrew_packages = [
    'tree',
    'curl',
    'gawk',
    'wget',
    'python',
    'python3',
	'zsh-completions',
  ]

  ## Declare all Homebrew packages at once
  package { $homebrew_packages: }

  package { 'reattach-to-user-namespace':
	ensure => installed,
    provider => 'homebrew',
    install_options => '--wrap-pbcopy-and-pbpaste',
  }
}
