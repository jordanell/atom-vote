require 'dotenv/tasks'

namespace :devops do

  env = ENV['ENVIRONMENT'] || 'staging'
  branch = ENV['BRANCH'] || 'master'

  # Make task
  task :make => :environment do
    puts "Creating a new web instance for #{env}."
    run_ansible_playbook("make", env)
  end

  # Administration task
  task :admin => :environment do
    puts "Administering web instances for #{env}."
    run_ansible_playbook("admin", env)
  end

  # Deploy task
  task :deploy => :environment do
    puts "Deploying to web instance for #{env}."
    run_ansible_playbook("deploy", env, branch)
  end

end

def run_ansible_playbook(script, env = 'staging', branch = 'master')
  return unless script
  sh "ansible-playbook -i ansible/hosts -e environment=#{env} -e branch=#{branch} --private-key=~/.ssh/ansible-atomvote-key.pem ansible/#{script}.yml"
end
