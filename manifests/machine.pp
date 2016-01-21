# Type: netrc::machine
# ===========================
#
# Defined type representing a single .netrc entry
#
# Parameters
# ----------
#
# * `machine`
#   Remote machine this .netrc is targetted at. Default: $name
#
# * `netrc_path`
#   Path to .netrc file.
#
# * `login`
#   Login user on remote machine
#
# * `password`
#   Login password on remote machine
#
# Example
# -------
#
# netrc::machine { 'foo.bar.com':
#   netrc_path => '/home/myuser/.netrc',
#   login      => 'remote_user',
#   password   => 'hunter5',
# }
#
define netrc::machine (
  $netrc_path,
  $login,
  $password,
  $machine      = $name,
) {
  include ::netrc::params


  # validate parameters here
  validate_string($machine)
  validate_string($netrc_path)
  validate_string($login)
  validate_string($password)


  # Write the .netrc file
  concat::fragment{ "netrc_fragment_${machine}":
    target  => $netrc_path,
    content => template('netrc/netrc.erb'),
  }
}
