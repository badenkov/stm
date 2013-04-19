APP_PATH = File.expand_path(File.dirname(__FILE__) + "/..")

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 1)
preload_app true
timeout 15

#listen APP_PATH + "/tmp/unicorn.sock", backlog: 64
#pid APP_PATH + "/tmp/unicorn.pid"
#stderr_path APP_PATH + "/log/unicorn.stderr.log"
#stdout_path APP_PATH + "/log/unicorn.stdout.log"

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end


