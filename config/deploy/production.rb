server '35.166.102.168', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yoshi/.ssh/id_rsa'