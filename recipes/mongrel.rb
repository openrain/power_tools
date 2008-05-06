namespace :deploy do

  desc "Start Mongrel cluster"
  task :start, roles => :app do 
    run "cd #{deploy_to}/current && mongrel_rails cluster::start -C #{mongrel_conf}"
  end

  desc "Stop Mongrel cluster"
  task :stop, roles => :app do
    run "cd #{deploy_to}/current && mongrel_rails cluster::stop -C #{mongrel_conf}"
  end

  desc "Restart Mongrel cluster"
  task :restart, roles => :app do
    stop
    start
  end

end
