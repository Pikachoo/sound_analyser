class SoundFile < ActiveRecord::Base
  mount_uploader :file, FileUploader

end
