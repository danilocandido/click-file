class FileSystem < ApplicationRecord
  has_many :files, class_name: 'FileSystem', foreign_key: 'folder_id'

  belongs_to :folder, class_name: 'FileSystem', optional: true

  scope :roots, -> { where('folder_id is null') }

  validates :name, presence: true, length: { minimum: 1 }

  def children?
    files.exists?
  end

  def folder?
    !file
  end
end
