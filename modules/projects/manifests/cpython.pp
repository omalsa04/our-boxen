class projects::cpython {
  include gdb

  package { 'hg':
    ensure => present,
  }
}
