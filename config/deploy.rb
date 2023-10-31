# config valid only for current version of Capistrano
lock '~> 3.17'

# app/deployment info
set :application, 'csp-golocal'
set :deploy_to, "/var/www/#{fetch(:application)}/#{fetch(:stage)}"

set :linked_dirs, %w{ log storage public/system tmp/cache }

# shared resources (currently defined in each deploy/stage file)
#set :linked_dirs, %w(log public/system tmp/cache)
#set :linked_files, %w(config/database.yml config/secrets.yml config/environment.rb config/environments/production.rb)

# git/version control info
# [Deprecation Notice] `set :scm, :git` is deprecated.
#To ensure your project is compatible with future versions of Capistrano,
#remove the :scm setting and instead add these lines to your Capfile after
#`require "capistrano/deploy"`:
#
#      require "capistrano/scm/git"
#      install_plugin Capistrano::SCM::Git
#set :scm, :git

set :repo_url, 'https://github.com/CMU-CREATE-Lab/csp-golocal.git'
set :branch, "main"
set :repo_path, "#{fetch(:deploy_to)}/repo"

#set :rvm1_ruby_version, "default"
set :rvm1_ruby_version, "ruby-3.1.4"


# deploy tasks
namespace :deploy do


  # remove the RVM scripts that capistrano creates (breaks when trying to chmod from someone else)
  before "rvm1:hook", :remove_rvmscripts do
    on roles(:web) do
      sudo(:rm,"-rf","#{fetch(:deploy_to)}/rvm1scripts")
    end
  end


  # ASSERT: group 'rvm' exists and all deploy users are members
  before :starting, :fix_permissions do
    on roles(:web) do
      begin
        within "#{fetch(:deploy_to)}" do
          sudo(:chown, "-R", "#{fetch(:ssh_username)}:rvm", "#{fetch(:deploy_to)}")
        end
      rescue
        puts "Directory #{fetch(:deploy_to)} DNE; skipping."
      end
      begin
        within "#{fetch(:tmp_dir)}" do
          sudo(:chown, "-R", "#{fetch(:ssh_username)}:rvm", "#{fetch(:tmp_dir)}")
        end
      rescue
        puts "Directory #{fetch(:tmp_dir)} DNE; skipping."
      end
    end
  end


  after :started, :uninit_git_dir do
    begin
      on roles(:web) do
        within "#{fetch(:repo_path)}" do
          # execute(:git, "config", "--unset", "core.logallrefupdates")
          # execute(:git, "config", "--unset", "core.worktree")
          execute(:git, "config", "core.bare", "true")
        end
      end
    rescue
      puts "Directory #{fetch(:repo_path)} DNE; skipping uninit_git_dir (NOTE: this should only happen the first time the repo is deployed to the server; otherwise, something terrible probably happened)"
    end
  end


  after :finished, :reinit_git_dir do
    on roles(:web) do
      within "#{fetch(:deploy_to)}/current" do
        execute(:git, "init", "--separate-git-dir=#{fetch(:repo_path)}")
        execute(:git, "reset", "--hard", fetch(:branch))
        execute(:mkdir,"-p","tmp")
        sudo(:chmod, "-R", "777", "tmp")
        sudo(:chown, "-R", "#{fetch(:ssh_username)}:rvm", "#{fetch(:deploy_to)}")
        execute(:touch,"tmp/restart.txt")
      end
    end
  end

end
