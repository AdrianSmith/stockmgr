# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_team_session',
  :secret      => '987ad1a144509f5cb72c4542034c1bf60a23e93c7309822c51afc7eaa677cb31904b707cb39cd62b4fba85b4b9fbb89afc619f3b3d7705563d78fa8796a03502'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
