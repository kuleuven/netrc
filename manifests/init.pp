# Class: netrc
# ===========================
#
# Full description of class netrc here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class netrc (
  $package_name = $::netrc::params::package_name,
  $service_name = $::netrc::params::service_name,
) inherits ::netrc::params {

  # validate parameters here

  class { '::netrc::install': } ->
  class { '::netrc::config': } ~>
  class { '::netrc::service': } ->
  Class['::netrc']
}
