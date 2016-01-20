# == Class netrc::params
#
# This class is meant to be called from netrc.
# It sets variables according to platform.
#
class netrc::params {
  case $::osfamily {
    'Debian': {
      $default_user_dir = '/home'
    }
    'RedHat', 'Amazon': {
      $default_user_dir = '/home'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
