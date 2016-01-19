# Class: netrc
# ===========================
#
# Full description of class netrc here.
#
# Parameters
# ----------
#
# * `credentials`
#   List of hashes of login credentials.
#
# * `user`
#   User to whom the .netrc file belongs. Default: $name
#
# * `path`
#   Absolute path of the .netrc file to deploy. Default: /home/$user/.netrc
#
# Example
# -------
#
# netrc { 'myuser':
#   credentials => [
#     { machine => 'myserver.com', login => 'foobar', password => 'hunter5'},
#     { machine => 'yourserver.com', login => 'alice', password => 'bob256'}
#   ],
# }
#
class netrc (
  $credentials,
  $user = $name,
  $path = "${netrc::params::default_home_path}/${user}/.ṅetrc"
) {
  include $::netrc::params

  # validate parameters here
  validate_string($user)
  validate_absolute_path($path)
  validate_array($credentials)
  $credentials.each | $machine_entry | { validate_hash($machine_entry) }



  # Write the .netrc file
  file { $path:
    ensure  => present,
    owner   => $user,
    group   => $user,
    mode    => '0600',
    content => template('netrc/netrc.erb'),
  }
}
