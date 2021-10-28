# frozen_string_literal: true

# imitate user login
module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.new(name: "Test", email: "test@mail.com", password: "password")
      sign_in user
    end
  end
end
