class User < ActiveRecord::Base
	has_and_belongs_to_many :preferences
	has_and_belongs_to_many :restrictions

  has_and_belongs_to_many :events

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end