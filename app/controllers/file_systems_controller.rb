class FileSystemsController < ApplicationController
  def index
    @file_systems = FileSystem.roots
  end

  def create
    @file_system = FileSystem.find(params[:file_system_id])
    @file_system.children << FileSystem.new(file_system_params.merge(file: folder?))
    redirect_to root_path
  end

  def show_modal
    @file_system = FileSystem.find(params[:id])
  end

  private

  def file_system_params
    params.permit(:name, :attached_file)
  end

  def folder?
    params[:it_is_folder].present? ? false : true
  end
end
