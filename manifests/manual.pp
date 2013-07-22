class puppet::manual inherits puppet::service {
  Service['puppet'] {
    enable => false,
    ensure => stopped,
  }

  cron { 'puppet': ensure => absent }

}
