OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1590678351168245', '110f679f2b5bb959ec5f153af68e7428'

  provider :google_oauth2,'129402457151-mfdhvntoge85s8ps3j1a2v19i58c68md.apps.googleusercontent.com' ,'Pe4xvb1C2DCmHJdHCEyti9N0',
    {
      :scope => "userinfo.email, userinfo.profile, plus.login",
      :access_type => "offline",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
   provider :twitter, 'dwPWlch82dcPjd6xxsiijcF7Z', 'Vc812B9GH18DxGYUIoIWdU66KTzEX6U530OC3ek7pPUoAfaEyc'
   

  # provider :facebook, '135349066867762', '3ab27f6da294469c902bbc1c71098870'
end