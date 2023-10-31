set :stage, :production

set :ssh_username, ask("login:")

#set :branch, "main"

set :linked_files, %w{ db/csp-golocal-production.sqlite3 config/master.key }

server 'golocal.cmucsp.org', user: fetch(:ssh_username, "login:"), roles: [:web]

role :web, %w{golocal.cmucsp.org}

namespace :deploy do

  after :finished, :precompile_assets do
    on roles(:web) do
      within "#{fetch(:deploy_to)}/current" do
        # since cache is now symlinked we have to specify the dir
        sudo(:chmod, "-R", "777", "tmp/cache/*")
        execute(:rake, "assets:precompile")
        execute(:touch,"tmp/restart.txt")
      end
    end
  end

end
