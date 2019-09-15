module SaveWithRestClient
  include ActiveSupport::Concern

  def save
    return false unless valid?

    begin
      if persisted?
        response = RestClient.patch "#{Rails.configuration.service_urls.exercise_service}#{collection_path}", {api_v1_exercise: attributes}
      else
        response = RestClient.post "#{Rails.configuration.service_urls.exercise_service}#{custom_method_element_url(self.id).remove '.json'}", {api_v1_exercise: attributes}
      end

      attributes.merge! JSON.parse(response)
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error e
      JSON.parse(e.response).each do |k, values|
        values.each do |v|
          self.errors.add k, v
        end
      end
    end

    self.errors.empty?
  end

  def update(new_attributes)
    return false unless valid?

    begin
      response = RestClient.patch "#{Rails.configuration.service_urls.exercise_service}#{custom_method_element_url(self.id).remove '.json'}", {api_v1_exercise: new_attributes}

      attributes.merge! JSON.parse(response)
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error e
      JSON.parse(e.response).each do |k, values|
        next unless values.respond_to? :each
        values.each do |v|
          self.errors.add k, v
        end
      end
    end

    self.errors.empty?
  end
end