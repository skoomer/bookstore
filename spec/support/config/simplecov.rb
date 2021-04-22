# frozen_string_literal: true

SimpleCov.start 'rails' do
  add_filter 'app/channels/application_cable/'
  add_filter 'app/jobs/'
  add_filter 'app/mailers/'
  add_filter 'app/models/application_record.rb'
  add_filter 'spec'
  add_filter 'app/helpers'
  minimum_coverage 90
end
