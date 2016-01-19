# == Class netrc::service
#
# This class is meant to be called from netrc.
# It ensure the service is running.
#
class netrc::service {

  service { $::netrc::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
