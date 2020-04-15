class Admin < ApplicationRecord
  devise :invitable, :database_authenticatable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  rolify
  include Authority::UserAbilities
  include Authority::Abilities

  attr_accessor :send_invite

  has_and_belongs_to_many :cities, optonal: true

  validates :email, :full_name, :roles, presence: true

  def avatar
    "https://robohash.org/#{email}.png?set=set3&bgset=bg2"
  end
end
