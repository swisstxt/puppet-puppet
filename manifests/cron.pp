class puppet::cron inherits puppet::service {
  Service['puppet'] {
    enable => false,
    ensure => stopped,
  }

  cron::crond{'puppet':
    command => "sleep $((RANDOM\\%59)) && /usr/bin/puppet agent --config ${puppet::dir}/puppet.conf --onetime --no-daemonize",
    user    => root,
    minute  => ip_to_cron($puppet::cron_interval, $puppet::cron_range),
  }
}
