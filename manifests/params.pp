# == Class netrc::params
#
# This class is meant to be called from netrc.
# It sets variables according to platform.
#
class netrc::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'netrc'
      $service_name = 'netrc'
    }
    'RedHat', 'Amazon': {
      $package_name = 'netrc'
      $service_name = 'netrc'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
