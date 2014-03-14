class myserver::php (
	$display_errors = false
) {
	package { 'php5':
		ensure 	=> latest,
	}
	package { 'php-apc':
		ensure 	=> present,
		require => Package['php5'],
	}

	$display_errors_value = $display_errors ? {
		true  => '1',
		false => '0'
	}
	file { '/etc/php5/conf.d/display_errors.ini':
		ensure  => present,
		content => "display_errors = ${display_errors_value}"
	}
}