Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :twitter,
    'JmaekFCAUu6jkYoVPsSSoTBGD', # don't steal
    '0MQbTPOgPpLwu5ymkatJwvz1ddvPF0AHhqJTnnlfjsLrdARA4Q', # secret.
    {
      authorize_params: {
        force_login: 'true',
        lang: I18n.default_locale.to_s
      }
    }
  )
end
