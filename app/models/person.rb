class Person < ActiveRecord::Base
  has_many :connections
  has_many :educations
  has_many :positions
  
  def self.oauth_consumer
    OAuth::Consumer.new('n045sa9y9a16', 'in2W00HAuBeknE4L',
    { :site=>"https://api.linkedin.com",
      :scheme => :header,
      :request_token_url => 'https://api.linkedin.com/uas/oauth/requestToken',
      :access_token_url => 'https://api.linkedin.com/uas/oauth/accessToken',
      :authorize_url => "https://api.linkedin.com/uas/oauth/authorize" })
  end
end
