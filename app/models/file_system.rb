class FileSystem < ApplicationRecord
  has_many :files, class_name: 'FileSystem', foreign_key: 'folder_id'

  belongs_to :folder, class_name: 'FileSystem', optional: true

  scope :roots, -> { where('folder_id is null') }

  has_one_attached :attached_file

  def name
    attached_file.attached? ? attached_file.filename : 'root'
  end

  def children?
    files.exists?
  end

  def folder?
    !file
  end
end
