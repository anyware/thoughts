# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_thoughts_session',
  :secret      => 'ba8b54d989f227f753b5103ffec4194ca35eaccd02f7873e60de6404d8e2af1acaeac6f6d352c39b4e9c2f8389e32c056e12461ba3a31fb969587e907ffb8f7f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
