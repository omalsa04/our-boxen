class people::omalsa04(
  $my_sourcedir = $people::omalsa04::params::my_sourcedir,
  $my_homedir   = $people::omalsa04::params::my_homedir,
  $my_username  = $people::omalsa04::params::my_username,
  $my_projects  = $people::omalsa04::params::my_projects
) inherits people::omalsa04::params {
  include people::omalsa04::applications
  include people::omalsa04::osx_settings
  include people::omalsa04::repository
  include people::omalsa04::vagrant_setup
}
