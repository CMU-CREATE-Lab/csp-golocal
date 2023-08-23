set :stage, :dev

set :ssh_username, ask("login:")

set :branch, "deploy-dev"

server 'golocal.cmucsp.org', user: fetch(:ssh_username, "login:"), roles: [:web]

role :web, %w{golocal.cmucsp.org}
