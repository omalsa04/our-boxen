class people::omalsa04::osx_settings(
  $my_sourcedir = $people::omalsa04::params::my_sourcedir,
  $my_homedir   = $people::omalsa04::params::my_homedir,
  $my_username  = $people::omalsa04::params::my_username
) {
  include osx::global::tap_to_click
  include osx::global::disable_autocorrect
  include osx::finder::show_all_filename_extensions
  include osx::safari::enable_developer_mode
  include osx::disable_app_quarantine
  include osx::software_update
  include osx::keyboard::capslock_to_control
  include osx::finder::empty_trash_securely

  # Sane Defaults
  Boxen::Osx_defaults {
    user => $::luser,
  }

  # Set key repeat delay time
  class { 'osx::global::key_repeat_delay':
    delay => 15
  }

  # Set key repeat speed
  class { 'osx::global::key_repeat_rate':
    rate => 3
  }

  shortcut {
    'iTerm New Window':
      app  => 'com.googlecode.iterm2',
      key  => 'ctrl-shift-x',
      menu => 'New Window';
  }

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
}
