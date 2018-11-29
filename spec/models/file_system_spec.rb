require 'rails_helper'

RSpec.describe FileSystem, type: :model do
  describe 'folder' do
    context 'invalid directory' do
      it 'has empty or nil name' do
        expect(build(:folder, name: nil)).to be_invalid
        expect(build(:directory, name: '')).to be_invalid
      end
    end

    context 'valid directory' do
      it 'has a given description' do
        folder = build(:folder, name: 'pasta_de_imagens')
        expect(folder.description).to eq 'pasta_de_imagens'
      end
    end
  end

  describe 'file' do
    context 'invalid file' do
      it 'does not have an attached file' do
        expect(build(:file_system)).to be_invalid
      end
    end

    context 'valid file' do
      it 'has an attached file' do
        expect(build(:file)).to be_valid
      end

      it 'description is the name of the file' do
        file = build(:file)
        expect(file.description).to eq 'test-image.png'
      end
    end
  end
end
