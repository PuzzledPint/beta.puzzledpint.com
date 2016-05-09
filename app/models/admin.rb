require 'digest/md5'

class Admin < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  rolify
  include Authority::UserAbilities
  include Authority::Abilities

  attr_accessor :send_invite

  has_and_belongs_to_many :cities

  validates :email, :full_name, :roles, presence: true

  def avatar
    # Following the instructions from here for creating a gravatar hash.
    # http://en.gravatar.com/site/implement/hash/
    gravatar_hash = Digest::MD5.hexdigest(email.strip.downcase)
    image_size = 180
    "https://www.gravatar.com/avatar/#{gravatar_hash}?s=#{image_size}"
  end
end
