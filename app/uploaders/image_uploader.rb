class ImageUploader < Shrine
  plugin :default_url

  Attacher.default_url do |**option|
    "/placeholders/missing.jpg"
  end

end
