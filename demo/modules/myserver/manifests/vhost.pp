define myserver::vhost (
	$server_name,
	$document_root
) {
	include myserver::apache

	file {"/etc/apache2/sites-enabled/${title}":
		ensure	=> present,
		content => template('myserver/vhost.erb'),
		require => Package['apache2'],
		notify  => Service['apache2'],
	}
}