set :stage, :staging

set :ssh_username, ask("login:")

set :branch, "deploy-staging"

server 'golocal.cmucsp.org', user: fetch(:ssh_username, "login:"), roles: [:web]

role :web, %w{staging.golocal.cmucsp.org}
