class Picture < ActiveRecord::Base
  mount_uploader :image, AvatarUploader

  belongs_to :picturable, polymorphic: true
end
