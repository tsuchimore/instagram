server '52.198.161.80', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yoshi/.ssh/id_rsa'