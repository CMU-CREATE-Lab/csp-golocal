set :stage, :production

set :ssh_username, ask("login:")

server 'golocal.cmucsp.org', user: fetch(:ssh_username, "login:"), roles: [:web]

role :web, %w{golocal.cmucsp.org}
