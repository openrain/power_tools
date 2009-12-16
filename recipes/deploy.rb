namespace :deploy do

  # To use mongrel
  # => set(:mongrel_conf) { "#{current_path}/config/mongrel_cluster.yml" } 
  #
  # To use mod_rails
  # => set :passenger_conf, true
  #
  # To use thin
  # => set(:thin_conf) { "#{current_path}/config/thin.yml" }

  desc "Start Rails"
  task :start, roles => :app do
    if fetch(:mongrel_conf, nil)
      run "cd #{deploy_to}/current && mongrel_rails cluster::start -C #{mongrel_conf}"
    elsif fetch(:passenger_conf, nil)
      run "touch #{deploy_to}/current/tmp/restart.txt"
    elsif fetch(:thin_conf, nil)
      run "cd #{deploy_to}/current && thin -C #{thin_conf} start"
    else
      puts "No server configuration found, aborting deploy:start."
    end
  end

  desc "Stop Rails (Rails is unstoppable)"
  task :stop, roles => :app do
    if fetch(:mongrel_conf, nil)
      run "cd #{deploy_to}/current && mongrel_rails cluster::stop -C #{mongrel_conf}"
    elsif fetch(:passenger_conf, nil)
      # No-op
    elsif fetch(:thin_conf, nil)
      run "cd #{deploy_to}/current && thin -C #{thin_conf} stop"
    else
      puts "No server configuration found, aborting deploy:stop."
    end
  end

  desc "Restart Rails"
  task :restart, roles => :app do
    stop
    start
  end

end
