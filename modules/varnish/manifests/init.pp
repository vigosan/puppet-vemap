class varnish {
  package { 'varnish':
    ensure => present
  }

  file { '/etc/varnish/default.vcl':
    source  => 'puppet:///modules/varnish/default.vcl',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['varnish']
  }

  file { '/etc/default/varnish':
    source  => 'puppet:///modules/varnish/varnish',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['varnish']
  }

}
