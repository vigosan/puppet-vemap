node 'app' {
  include 'nginx'
  include 'php_fpm'
  include 'varnish'
  include 'mysql'
}
