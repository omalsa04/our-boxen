class people::omalsa04 {
  # Applications
  include chrome
  include dropbox
  include zsh
  include homebrew
  include iterm2::dev
  include java
  include virtualbox
  include skype
  include vlc
  include sublime_text
  include tmux


  # Sane Defaults
  Boxen::Osx_defaults {
    user => $::luser,
  }
 
  # Configuration Setup
  $env = {
    directories => {
      home      => '/Users/sam',
      dotfiles  => '/Users/sam/.dotfiles'
    },
    packages => {
      brew   => [
        'wget',
        'gpg2',
		'reattach-to-user-namespace',
      ]
    }
  }

  # Install evernote from homebrew
  # Doesn't work without "brewcask" installed
  # package { 'evernote': provider => 'brewcask' }
 
  # Install Brew Applications
  package { $env['packages']['brew']:
    provider => 'homebrew',
  }

  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  } 
 
  ####################
  # Start Config
 
  # OSX Defaults
  boxen::osx_defaults { 'Disable Dashboard':
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => 'YES',
  }
  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }
  boxen::osx_defaults { 'Disable press-and-hold character picker':
    key    => 'ApplePressAndHoldEnabled',
    domain => 'NSGlobalDomain',
    value  => 'false',
  }
  boxen::osx_defaults { 'Display full POSIX path as Finder Window':
    key    => '_FXShowPosixPathInTitle',
    domain => 'com.apple.finder',
    value  => 'true',
  }
  boxen::osx_defaults { 'Secure Empty Trash':
    key    => 'EmptyTrashSecurely',
    domain => 'com.apple.finder',
    value  => 'true',
  }
  boxen::osx_defaults { 'Always use current directory in default search':
    key    => 'FXDefaultSearchScope',
    domain => 'com.apple.finder',
    value  => 'SCcf',
  }
  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }
  #boxen::osx_defaults { "Disable 'natural scrolling'":
  #key    => 'com.apple.swipescrolldirection',
  #domain => 'NSGlobalDomain',
  #value  => 'false',
  #}
  boxen::osx_defaults { 'Disable the "Are you sure you want to open this application?" dialog':
    key    => 'LSQuarantine',
    domain => 'com.apple.LaunchServices',
    value  => 'true',
  }
  boxen::osx_defaults { 'fucking sane key repeat':
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    value  => '0',
  }
  boxen::osx_defaults { 'Expand save panel by default':
      key    => 'NSNavPanelExpandedStateForSaveMode',
      domain => 'NSGlobalDomain',
      value  => 'true',
  }
  boxen::osx_defaults { 'Expand print panel by default':
      key    => 'PMPrintingExpandedStateForPrint',
      domain => 'NSGlobalDomain',
      value  => 'true',
  }
  boxen::osx_defaults { 'Minimize on Double-Click':
      key    => 'AppleMiniaturizeOnDoubleClick',
      domain => 'NSGlobalDomain',
      value  => 'true',
  }
  #boxen::osx_defaults { 'Put my Dock on the left':
  #key    => 'orientation',
  #domain => 'com.apple.dock',
  #value  => 'left',
  #}
  boxen::osx_defaults { 'Make function keys do real things, and not apple things':
    key    => 'com.apple.keyboard.fnState',
    domain => 'NSGlobalDomain',
    value  => 'true',
  }
 
  # # Disable GateKeeper
  # exec { 'Disable Gatekeeper':
  # command => 'spctl --master-disable',
  # unless  => 'spctl --status | grep disabled',
  # }
 
  # End Config
  ####################
 
  # Dotfile Setup
  repository { 'omalsa04-dotfiles':
    source => 'omalsa04/dotfiles',
    path   => "${env['directories']['dotfiles']}",
  }
}
