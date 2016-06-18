
class apache::config {

$app_server 		= 	"192.168.1.104"
$virtual_host_url 	= 	"mypuppet.node.com"

file { '/etc/apache2/apache2.conf':
  ensure  => 'file',
  owner   => '0',
  group   => '0',
  source  => 'puppet:///modules/apache/config/apache2.conf',
  notify => Service['apache2'],
} 

file { '/etc/apache2/worker.properties':
  ensure  => 'file',
  owner   => '0',
  group   => '0',
 # source  => 'puppet:///modules/apache/config/worker.properties',
  content  => template('apache/config/worker.properties.erb'),
  notify => Service['apache2'],
}

file { '/etc/apache2/sites-available/default':
  ensure  => 'file',
  owner   => '0',
  group   => '0',
  #source  => 'puppet:///modules/apache/config/sites-available/default',
  content => template('apache/config/sites-available/default.erb'),
  notify => Service['apache2'],
}

file { '/etc/apache2/mods-available/jk.conf':
  ensure  => 'file',
  owner   => '0',
  group   => '0',
  source  => 'puppet:///modules/apache/config/mods-available/jk.conf',
  notify => Service['apache2'],
}

service { 'apache2':
  ensure => 'running',
  enable => 'true',
}

}
