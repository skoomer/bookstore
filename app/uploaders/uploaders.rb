class ImageUploader < Shrine
    # plugins and uploading logic
end

class Photo < Sequel::Model # ActiveRecord::Base
  include ImageUploader[:image]
end