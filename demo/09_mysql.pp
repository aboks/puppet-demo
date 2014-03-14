package { 'mysql-server':
	ensure => present,
}

file { '/etc/mysql/conf.d/fulltext-search.cnf':
	ensure  => present,
	content => "[mysqld]\nft_min_word_len = 2",
	require => Package['mysql-server'],
}

service { 'mysql':
	ensure	  => running,
	enable	  => true,
	subscribe => File['/etc/mysql/conf.d/fulltext-search.cnf'],
}