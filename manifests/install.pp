# == Class netrc::install
#
# This class is called from netrc for install.
#
class netrc::install {

  package { $::netrc::package_name:
    ensure => present,
  }
}
