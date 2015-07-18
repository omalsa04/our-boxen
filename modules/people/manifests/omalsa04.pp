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

  include osx::global::tap_to_click
  include osx::global::disable_autocorrect
  include osx::finder::show_all_filename_extensions
  include osx::safari::enable_developer_mode
  include osx::disable_app_quarantine
  include osx::software_update
  include osx::keyboard::capslock_to_control
  include osx::finder::empty_trash_securely

  class { 'osx::global::key_repeat_delay':
    delay => 100
  }

  class { 'osx::global::key_repeat_rate':
    rate => 10
  }

  shortcut {
    "iTerm New Window":
      app  => "com.googlecode.iterm2",
      key  => "ctrl-shift-x",
      menu => "New Window";
  }

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

  #sublime_text::package { 'Emmet':
    #source => 'sergeche/emmet-sublime'
  #} 
 
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

  boxen::osx_defaults { 'Display full POSIX path as Finder Window':
    key    => '_FXShowPosixPathInTitle',
    domain => 'com.apple.finder',
    value  => 'true',
  }

  boxen::osx_defaults { 'Always use current directory in default search':
    key    => 'FXDefaultSearchScope',
    domain => 'com.apple.finder',
    value  => 'SCcf',
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

  boxen::osx_defaults { 'Make function keys do real things, and not apple things':
    key    => 'com.apple.keyboard.fnState',
    domain => 'NSGlobalDomain',
    value  => 'true',
  }
 
  # End Config
  ####################
 
  # Dotfile Setup
  repository { 'omalsa04-dotfiles':
    source => 'omalsa04/dotfiles',
    path   => "${env['directories']['dotfiles']}",
  }
}
