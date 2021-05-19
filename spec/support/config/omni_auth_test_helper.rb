# frozen_string_literal: true

module OmniAuthTestHelper
  def valid_facebook_login_setup
    return unless Rails.env.test?

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: 'facebook', uid: '1234567',
        info: { email: 'joe_bloggs@example.com', name: 'Joe', first_name: 'Joe', last_name: 'Bloggs', verified: true },
        credentials: { token: '123456', expires_at: Time.current + 1.week },
        extra: { raw_info: { gender: 'male' } }
      }
    )
  end
end
