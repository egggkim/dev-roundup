class Project
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  mount_uploader :image, ImageUploader

  belongs_to :user
end
