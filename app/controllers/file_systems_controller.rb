class FileSystemsController < ApplicationController
  def index
    @files = FileSystem.roots
  end

  def new
    @file_system = FileSystem.find(params[:file_system_id])
  end

  def show
  end

  def create; end

  private

  def file_system_params
    params.require(:file_system).permit(:name, :file)
  end
end
