class HintAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user)
    user.has_any_role? :admin
  end
end
