class FileSystem < ApplicationRecord
  has_many :children, class_name: 'FileSystem', foreign_key: 'folder_id'
  belongs_to :folder, class_name: 'FileSystem', optional: true
  has_one_attached :attached_file

  scope :roots, -> { where('folder_id is null') }

  validates :name, length: { minimum: 1 }, if: :folder?

  validate :check_attached_file, if: :file?
  validate :only_folder_should_have_children

  before_save do
    self.name = nil if file?
  end

  def text
    name || attached_file.filename
  end

  def children?
    children.exists?
  end

  def folder?
    !file
  end

  def as_json(options = {})
    options = {
      id: id,
      text: text
    }
    options[:children] = children unless children.empty?
    options[:icon] = 'jstree-file' if file?
    options
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
