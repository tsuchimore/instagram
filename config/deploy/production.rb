server '52.199.115.174', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yoshi/.ssh/id_rsa'