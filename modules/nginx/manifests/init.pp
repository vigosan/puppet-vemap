class nginx {
  package { 'nginx':
    ensure => present,
    before => File['/etc/nginx/nginx.conf']
  }

  service { 'nginx':
    ensure => true,
    enable => true
  }

  file { '/etc/nginx/nginx.conf':
    source  => 'puppet:///modules/nginx/nginx.conf',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['nginx'],
    notify  => Service['nginx']
  }

  file { '/etc/nginx/fastcgi_params':
    source  => 'puppet:///modules/nginx/fastcgi_params',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['nginx'],
    notify  => Service['nginx']
  }

}
