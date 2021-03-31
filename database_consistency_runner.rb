# First of all, you need to load all models
# The following example is for Rails, but it can be anything
require_relative 'config/environment'
Rails.application.eager_load!

# Now start the check
require 'database_consistency'
result = DatabaseConsistency.run
exit result
