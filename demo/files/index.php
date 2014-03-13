<?php
$banner_file = '/home/moxio/banner.txt';
$cmd = 'cat ' . escapeshellarg($banner_file) . ' | /usr/games/cowsay -n';

print '<pre>';
system($cmd);
print '</pre>';