file { '/tmp/file4':
	ensure  => present,
}
file { '/tmp/file5':
	ensure  => present,
	require => File['/tmp/file4'],
}
file { '/tmp/file6':
	ensure => present,
	require => File['/tmp/file5'],
}