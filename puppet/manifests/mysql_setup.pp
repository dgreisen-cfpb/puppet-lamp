class mysql_setup (
    $app_mysql_user       = hiera('app_mysql_user', 'app'),
    $app_mysql_password   = hiera('app_mysql_password', 'app'),
    $app_mysql_db_name    = hiera('app_mysql_db_name', 'app'),
    $app_port             = hiera('app_port', '80'),
){
    class { 'mysql::bindings': 
        php_enable => true
    }
    class { 'mysql::server':
        root_password => $app_mysql_password,
    }

    mysql::db { $app_mysql_db_name:
      user     => $app_mysql_user,
      password => $app_mysql_password,
      host     => '%',
      charset => 'utf8',
      grant    => ['ALL'],
    }
    mysql_user { "${app_mysql_user}@localhost":
        ensure => 'present',
        password_hash => mysql_password($app_mysql_password),
        require => Mysql::Db[$app_mysql_db_name],
    }

    mysql_grant { "${app_mysql_user}@localhost/${app_mysql_db_name}":
        ensure => 'present',
        options => ['GRANT'],
        privileges => ['ALL'] ,
        table => "*.*",
        user => "${app_mysql_user}@localhost",
        require => Mysql::Db[$app_mysql_db_name],
    }

}
