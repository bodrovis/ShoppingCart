Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "zGa9b19FDEYBlu9My8hMKw",
           "fXJVs3V5InFwdx15kYbjKzmazy0zYynQ6e6PhKHGRoI",
           image_size: 'original'
end