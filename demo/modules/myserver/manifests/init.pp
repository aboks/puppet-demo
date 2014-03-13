class myserver (
	$mode = 'production'
) {
	case $mode {
		'production':  { $display_errors = false }
		'development': { $display_errors = true }
		default:       { fail('Unsupported $mode') }
	}

	class { 'myserver::php':
		display_errors => $display_errors
	}
	class { 'myserver::apache':
		require => Class['myserver::php'],
	}

	file { '/var/www/phpinfo.php':
		ensure  => present,
		source  => 'puppet:///modules/myserver/phpinfo.php',
		require => Class['myserver::apache'],
	}
}