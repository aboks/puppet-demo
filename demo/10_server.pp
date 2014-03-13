class { 'myserver':
	mode => 'development',
}

file { '/home/moxio/www':
	ensure => directory,
}
file { '/home/moxio/www/index.php':
	ensure => present,
	source => '/root/demo/files/index.php'
}

myserver::vhost { 'demo':
	document_root => '/home/moxio/www',
	server_name => 'puppet-demo',
}