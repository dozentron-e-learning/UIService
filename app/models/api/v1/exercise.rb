class Api::V1::Exercise < ApplicationResource
  include SaveWithRestClient

  self.site = Rails.configuration.service_urls.exercise_service
  self.prefix = '/api/v1/'
end