# frozen_string_literal: true

SimpleCov.start 'rails' do
  add_filter 'app/channels/application_cable/'
  add_filter 'app/jobs/'
  add_filter 'app/mailers/'
  add_filter 'app/models/application_record.rb'
  minimum_coverage 95
end
