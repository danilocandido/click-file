class FileSystem < ApplicationRecord
  has_many :files, class_name: 'FileSystem', foreign_key: 'folder_id'
  belongs_to :folder, class_name: 'FileSystem', optional: true
  has_one_attached :attached_file

  scope :roots, -> { where('folder_id is null') }

  validates :name, presence: true, length: { minimum: 1 }, if: :folder?
  validate :attached_file?, if: :file?

  def description
    name || attached_file.filename
  end

  def children?
    files.exists?
  end

  def folder?
    !file
  end

  private

  def attached_file?
    unless attached_file.attached?
      errors.add(:attached_file, 'falta anexar')
    end
  end
end
