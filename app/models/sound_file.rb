class SoundFile < ActiveRecord::Base
  mount_uploader :file, FileUploader

  has_one :sound
  before_create :compute_hash
  validates_uniqueness_of :file_hash, :on => :create

  def compute_hash
    self.file_hash = Digest::MD5.hexdigest(self.file.read)
  end
end
