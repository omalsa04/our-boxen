class people::omalsa04::repository(
  $my_sourcedir = $people::omalsa04::params::my_sourcedir,
  $my_homedir   = $people::omalsa04::params::my_homedir,
  $my_username  = $people::omalsa04::params::my_username
) {

  ###############################
  # Git config and repositories #
  ###############################

  git::config::global{ 'user.name':
    value => "Samuel O'Malley",
  }

  git::config::global { 'alias.lg':
    value => "log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order",  }

  git::config::global { 'alias.review':
    value => 'log -p --reverse -M -C -C --patience --no-prefix',
  }

  git::config::global{ 'user.email':
    value => 'omalsa04@gmail.com',
  }

  git::config::global{ 'color.ui':
    value => 'auto',
  }

  git::config::global { 'alias.ll':
    value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat',
  }

  git::config::global { 'alias.dlc':
    value => 'diff --cached HEAD^',
  }

  ###############################
  # Dotfiles Setup              #
  ###############################

  repository { "${my_homedir}/.dotfiles":
    source => 'omalsa04/dotfiles',
  }

  file { "${my_homedir}/.vim/":
    ensure  => link,
    target  => "${my_homedir}/.dotfiles/vim/vim.symlink/",
    require => Repository["${my_homedir}/.dotfiles"],
  }

  file { "${my_homedir}/.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/.dotfiles/tmux/tmux.conf.symlink",
    require => Repository["${my_homedir}/.dotfiles"],
  }

  file { "${my_homedir}/.dev.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/.dotfiles/tmux/dev.tmux.conf.symlink",
    require => Repository["${my_homedir}/.dotfiles"],
  }

  file { "${my_homedir}/.gdbinit":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/.dotfiles/gdb/gdbinit.symlink",
    require => Repository["${my_homedir}/.dotfiles"],
  }

  file { "${my_homedir}/.vimrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/.dotfiles/vim/vimrc.symlink",
    require => Repository["${my_homedir}/.dotfiles"],
  }

  file { "${my_homedir}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/.dotfiles/zsh/zshrc.symlink",
    require => Repository["${my_homedir}/.dotfiles"],
  }

  ###############################
  # Other Links                 #
  ###############################

  file { "/usr/local/share/zsh/site-functions/brew_zsh_completion.zsh":
    ensure  => link,
    target  => "/usr/local/Library/Contributions/brew_zsh_completion.zsh",
    require => Repository["${my_homedir}/.dotfiles"],
  }
}