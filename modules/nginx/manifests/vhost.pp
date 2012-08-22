define nginx::vhost($port = '80', $ensure = 'present') {
  if $ensure == 'present' {
    file { "/etc/nginx/sites-available/${name}":
      content => template("nginx/vhost.erb"),
      mode    => 664,
      owner   => 'root',
      group   => 'root'
    }

    exec { "ln -s /etc/nginx/sites-available/${name} /etc/nginx/sites-enabled":
      unless  => "readlink -e /etc/nginx/sites-enabled/${name}",
      require => File["/etc/nginx/sites-available/${name}"],
      notify  => Service['nginx']
    }
  } else {
    exec { "rm /etc/nginx/sites-enabled/${name}":
      onlyif => "readlink -e /etc/nginx/sites-enabled/${name}",
      notify  => Service['nginx']
    }
  }
}
