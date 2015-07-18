class people::omalsa04::vagrant_setup(
  $my_sourcedir = $people::omalsa04::params::my_sourcedir,
  $my_homedir   = $people::omalsa04::params::my_homedir,
  $my_username  = $people::omalsa04::params::my_username
) {
  class { 'vagrant':
    completion => true,
  }
}
