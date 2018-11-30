require 'rails_helper'

RSpec.describe FileSystemsController, type: :controller do
  let(:files) { [] }

  before do
    3.times do |n|
      directory = create(:directory)
      files << directory
      directory = nil if n.even?
      files << create(:file, folder: directory)
    end
  end

  describe 'GET #index' do


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

  describe 'POST #create' do
    it 'renders root path' do
      post :create, params: { file_system_id: files.last, name: 'pasta', it_is_folder: 'Salvar'  }
      expect(response).to redirect_to(root_path)
    end
  end
end
