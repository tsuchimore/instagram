server '52.199.228.192', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yoshi/.ssh/id_rsa'