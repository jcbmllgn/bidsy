Rails.application.config.middleware.use OmniAuth::Builder do
  provider :singly,
           "9218ff10ccad13f577faa0e29b4827c1",
           "30493d0e5acf724c92d10d20a7db80ad"
end