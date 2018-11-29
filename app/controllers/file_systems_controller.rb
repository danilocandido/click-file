class FileSystemsController < ApplicationController
  def index
    @file_systems = FileSystem.roots
  end

  def new
    @file_system = FileSystem.find(params[:file_system_id])
  end

  def create
    @file_system = FileSystem.find(params[:file_system_id])
    @file_system.files << FileSystem.new(file_system_params)
  end

  private

  def file_system_params
    params.permit(:attached_file)
  end
end
