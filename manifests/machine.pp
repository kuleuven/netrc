# Type: netrc::machine
# ===========================
#
# Defined type representing a single .netrc entry
#
# Parameters
# ----------
#
# * `machine`
#   Remote machine this .netrc is targeted at. Default: $name
#
# * `path`
#   Required. Path to the .netrc file to write. Should match that specified in the related `netrc` resource.
#
# * `netrc_path`
#   Equivalent to `path`. Deprecated in v1.0.0
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
#   path     => '/home/myuser/.netrc',
#   login    => 'remote_user',
#   password => 'hunter5',
# }
#
define netrc::machine (
  String $login,
  String $password,
  Optional[String] $path         = undef,
  Optional[String] $netrc_path   = undef,
  String $machine                = $name,
) {

  if $path == undef {
    if $netrc_path != undef {
      warning('[DEPRECATED] `netrc_path` parameter is deprecated in v1.0.0. Use `path` instead')
      $target_path = $netrc_path
    } else {
      fail('`path` parameter is required, and should match that of the netrc resource')
    }
  } else {
    $target_path = $path
  }

  # Write the .netrc file
  concat::fragment{ "netrc_fragment_${machine}":
    target  => $target_path,
    content => template('netrc/netrc.erb'),
  }
}
