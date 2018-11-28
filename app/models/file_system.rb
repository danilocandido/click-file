class FileSystem < ApplicationRecord
  has_many :files, class_name: 'FileSystem', foreign_key: 'folder_id'

  belongs_to :folder, class_name: 'FileSystem', optional: true

  validates :name, presence: true, length: { minimum: 1 }
end
