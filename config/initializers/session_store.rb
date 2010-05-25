# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_exception2db_demo_session',
  :secret      => 'a4634824c794de326ce7b4eb454fe2411a3648f496e43f1a1c5eebfa746980a2ad81686de6b6f77c3316028cd74e3344746453a4d10a69f21e791aa52eb9ee23'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
