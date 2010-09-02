# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ihateexpences_session',
  :secret      => '857f937e882be9e869d1b914a6aea89c2b4cf91dcabc3f55c4abcd9521dedcd9455df643b970f3f5095d1d0cf3d0cafb454d357323ad42948c8ea7219cba1e63'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
