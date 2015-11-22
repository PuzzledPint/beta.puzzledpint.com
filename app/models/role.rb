class Role < ActiveRecord::Base
  has_many :admins, through: :admins_roles
  belongs_to :resource, polymorphic: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
