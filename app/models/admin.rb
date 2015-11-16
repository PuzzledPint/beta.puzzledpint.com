class Admin < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :send_invite

  validates :email, :full_name, presence: true

  def display_name
    return full_name if full_name.present?
    email
  end

  def avatar
    "https://robohash.org/#{email}.png?set=set3&bgset=bg2"
  end
end
