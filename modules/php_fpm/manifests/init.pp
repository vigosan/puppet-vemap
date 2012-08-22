class php_fpm {
  package { 'php5-fpm':
    ensure => present
  }

  file { '/etc/php5/fpm/php.ini':
    source  => 'puppet:///modules/php_fpm/php.ini',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['php5-fpm']
  }

  file { '/etc/php5/fpm/pool.d/www.conf':
    source  => 'puppet:///modules/php_fpm/www.conf',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['php5-fpm']
  }

  package { ['php5-common', 'php5-mysql', 'php5-gd', 'php5-cli', 'php5-curl', 'php-apc']:
    ensure => present
  }

  file { '/etc/php5/conf.d/apc.ini':
    source  => 'puppet:///modules/php_fpm/apc.ini',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['php-apc']
  }

}
