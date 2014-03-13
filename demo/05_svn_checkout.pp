$repository_url = 'https://github.com/sebastianbergmann/phpcpd/trunk'
$local_path = '/home/moxio/phpcpd'

exec { 'checkout-phpcpd':
	command => "/usr/bin/svn checkout ${repository_url} ${local_path}",
}