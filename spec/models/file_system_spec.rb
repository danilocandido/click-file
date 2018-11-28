require 'rails_helper'

RSpec.describe FileSystem, type: :model do
  describe 'invalid class' do
    it 'has name is empty or nil' do
      expect(FileSystem.new(name: nil)).to be_invalid
      expect(FileSystem.new(name: '')).to be_invalid
    end
  end

  describe 'valid class' do
    it 'has the minimum length name permited' do
      filesss = FileSystem.new(name: 'a')
      expect(filesss).to be_valid
    end
  end
end
