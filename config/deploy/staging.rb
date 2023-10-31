set :stage, :staging

set :ssh_username, ask("login:")

set :branch, "deploy-staging"

set :linked_files, %w{ db/csp-golocal-staging.sqlite3 config/master.key }

server 'golocal.cmucsp.org', user: fetch(:ssh_username, "login:"), roles: [:web]

role :web, %w{golocal.cmucsp.org}
