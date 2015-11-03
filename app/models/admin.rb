class Admin < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable
end
