# Clsas: netrc
# ===========================
#
# Parent class for netrc
#
# Parameters
# ----------
#
# * `user`
#   User to whom the .netrc file belongs.
#
# * `path`
#   Absolute path to .netrc file.
#
# * `group`
#   Group to assign to .netrc file. Default: $user
#
# Example
# -------
#
#
class netrc (
  $user,
  $path,
  $group = $user,
) inherits netrc::params {

  # Validation
  validate_string($user)
  validate_absolute_path($path)
  validate_string($group)


  concat { $path:
    ensure         => present,
    owner          => $user,
    group          => $group,
    mode           => '0600',
    warn           => true,
    ensure_newline => true,
  }

}
