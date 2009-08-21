# include Oauth::UserRelationships in your User model
module Oauth
  module UserRelationships
    def self.included(user)
      user.instance_eval do
        has_many :client_applications
        has_many :tokens, :class_name => "OauthToken", :order => "authorized_at desc", :include => [:client_application]
      end
    end
  end
end
