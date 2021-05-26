# frozen_string_literal: true

module StubFacebook
  def stub_env_for_omniauth_fb
    request.env['devise.mapping'] = Devise.mappings[:user]

    request.env['omniauth.auth'] = OmniAuth::AuthHash.new(
      info: {
        email: FFaker::Internet.email,
        name: FFaker::Name.name
      }
    )
  end
end
