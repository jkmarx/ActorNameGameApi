require 'rails_helper'
require 'spec_helper'
require 'net/http'
require 'uri'
require File.join(Rails.root, "lib/modules/MovieDetail.rb")

describe MovieDetail do
  let(:timestamp) {'1428553259'}
  let(:nonce) {'ffdc6d7958374bc6a40771d241227be7'}
  let(:tokenSecret){'J6zix3FfA9LofH0awS24M3HcBYXO5nI1iYe8EfBA'}
  let(:request_params) {
      {
        oauth_consumer_key: "fZcUdPbYdkEu64csHixN5dMjM",
        oauth_nonce: "#{nonce}",
        oauth_signature_method: "HMAC-SHA1",
        oauth_timestamp: "#{timestamp}",
        oauth_token: "2993886084-gXAyKxFEm8TjcKNFx0zVwD1b3UhPxeRqdSYRSBO",
        oauth_version: "1.0"
      }
    }


  describe 'MovieDetail::create_signature' do
    it 'returns Base64 encoded signature, tweets' do
      expect(MovieDetail::create_signature(tokenSecret,request_params,'tweets', "count%3D200%26")).to eq 'P5Fo/gCzwjeaedlqCkgKcB1EJ/g='
    end
  end


  describe 'MovieDetail::get_header_string' do
    it 'converts a hash to a string, tweets' do
      expect(MovieDetail::get_header_string(tokenSecret,request_params,'tweets',"count%3D200%26")).to eq "OAuth oauth_consumer_key=\"fZcUdPbYdkEu64csHixN5dMjM\", oauth_nonce=\"ffdc6d7958374bc6a40771d241227be7\", oauth_signature=\"P5Fo%2FgCzwjeaedlqCkgKcB1EJ%2Fg%3D\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"1428553259\", oauth_token=\"2993886084-gXAyKxFEm8TjcKNFx0zVwD1b3UhPxeRqdSYRSBO\", oauth_version=\"1.0\""
    end
  end
end
