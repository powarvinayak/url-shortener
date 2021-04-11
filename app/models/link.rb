class Link < ApplicationRecord
    validates_presence_of :long_url
    validates :long_url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :short_url

end
