class apache_setup (){
    class {'apache': }

    service { "iptables":
        ensure => "stopped",
        enable => false,
    }

    apache::vhost { '*':
      port    => '80',
      docroot => $apache::docroot,
    }

    class {'apache::mod::php': }
}
