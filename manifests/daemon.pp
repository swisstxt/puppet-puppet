class puppet::daemon inherits puppet::service {
  Service['puppet'] {
    enable => true,
    ensure => running,
  }

  cron::crond{'puppet':
    ensure => absent
  }

}
