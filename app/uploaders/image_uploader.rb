class ImageUploader < Shrine
  plugin :default_url
  Shrine.plugin :validation
  Shrine.plugin :validation_helpers

  Attacher.validate do
    validate_size      1..5*1024*1024
    validate_mime_type %w[image/jpeg image/png image/webp image/tiff]
    validate_extension %w[jpg jpeg png webp tiff tif]
  end

  Attacher.default_url do |**option|
    "/placeholders/missing.jpg"
  end

end
