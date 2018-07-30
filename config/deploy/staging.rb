# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# set :ssh_options, { 
#   forward_agent: true, 
#   paranoid: true, 
#   keys: "~/.ssh/id_rsa" 
# }

set :ssh_options, {
  user: 'ubuntu',
  keys: ['/Users/mikemo/.ssh/new_lang.pem'],
  forward_agent: true,
  auth_methods: ["publickey"]
}

# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }
# aws
server '34.215.148.11', user: 'ubuntu'
role :web, %w{ubuntu@34.215.148.11}
role :ap, %w{ubuntu@34.215.148.11}
role :db, %w{ubuntu@34.215.148.11}
# mel
#server '52.65.51.97', user: 'tde-ssh'
#role :web, %w{tde-ssh@52.65.51.97}
#role :ap, %w{tde-ssh@52.65.51.97}
#role :db, %w{tde-ssh@52.65.51.97}

# set :magento_deploy_languages, ['en_AU', 'en_US', 'en_NZ']
# set :magento_deploy_jobs, 0

set :deploy_to, '/var/www/mytest'
set :branch, proc { `git rev-parse --abbrev-ref master`.chomp }

# set :magento_deploy_themes, ['Magento/blank', 'MindArc/tde2']

#set :log_level, :info
#set :ssh_options, { verbose: :debug }

