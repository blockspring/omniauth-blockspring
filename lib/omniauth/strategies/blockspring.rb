require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Blockspring < OmniAuth::Strategies::OAuth2
      option :name, :blockspring

      option :client_options, {
        :site => 'https://auth.blockspring.com',
        :authorize_url => 'https://auth.blockspring.com/oauth/authorize',
        :token_url => 'https://auth.blockspring.com/oauth/token'
      }

      uid { raw_info['id'] }

      info do
        {
          'nickname' => raw_info['username'],
          'name' => raw_info['name'].empty? ? raw_info['username'] : raw_info['name'],
          'organization' => raw_info['organization']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'blockspring', 'Blockspring'
