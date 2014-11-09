class User < ActiveRecord::Base
	has_and_belongs_to_many :preferences
	has_and_belongs_to_many :restrictions

  has_many :restrics
  has_many :prefs

  has_many :events,  class_name: 'Event', foreign_key: 'host_id'
  has_and_belongs_to_many :events

  def restrics
    Restriction.all.order(:name)
  end

  def has_pref(restric)
    restrictions.include?(restric)
  end

  def upcomingEvents
    events.where("date >= #{Date.today}").order("date DESC")
  end

  def pastEvents
    events.where("date < #{Date.today}").order("date DESC")
  end

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