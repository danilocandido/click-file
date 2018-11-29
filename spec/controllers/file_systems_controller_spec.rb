require 'rails_helper'

RSpec.describe FileSystemsController, type: :controller do

  describe 'GET #index' do
    let(:files) { [] }

    before do
      3.times do |n|
        directory = create(:directory)
        files << directory
        directory = nil if n.even?
        files << create(:file, folder: directory)
      end
    end

    it 'renders :index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns only public achievements to template' do
      get :index
      files_with_no_parents = files.select {|n| n.folder.nil? }
      expect(assigns(:file_systems)).to match_array files_with_no_parents
    end
  end

  describe 'GET #new' do
    it 'renders :new page' do
      folder = create(:folder)
      get :new, :params => { file_system_id:  folder }
      expect(response).to render_template(:new)
    end
  end
end
