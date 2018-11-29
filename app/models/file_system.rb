class FileSystem < ApplicationRecord
  has_many :files, class_name: 'FileSystem', foreign_key: 'folder_id'
  belongs_to :folder, class_name: 'FileSystem', optional: true
  has_one_attached :attached_file

  scope :roots, -> { where('folder_id is null') }

  validates :name, length: { minimum: 1 }, if: :folder?

  validate :check_attached_file, if: :file?
  validate :only_folder_should_have_children

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

  def check_attached_file
    unless attached_file.attached?
      errors.add(:attached_file, 'falta anexar um arquivo')
    end
  end

  def only_folder_should_have_children
    if file? && folder.try(:file?)
      errors.add(:folder_id, 'Um arquivo não pode ter sub-arquivos, somente diretórios podem!')
    end
  end
end
