require 'securerandom'
class Link < ApplicationRecord
    validates_presence_of :long_url
    validates :long_url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :short_url
    before_validation :generate_short_url

    def generate_short_url
        self.short_url = SecureRandom.uuid[0..4] if self.short_url.nil?
    end   

end
