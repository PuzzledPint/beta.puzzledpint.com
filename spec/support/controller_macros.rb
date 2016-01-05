module ControllerMacros
  def login_admin
    before(:each) do
      request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_out :admin
      sign_in create(:admin_user)
    end
  end

  def login_location_gc
    before(:each) do
      request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_out :admin
      sign_in create(:location_gc_user)
    end
  end
end
