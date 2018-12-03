class FileSystemsController < ApplicationController
  def index; end

  def show_files
    file_systems = FileSystem.roots
    render json: file_systems
  end

  def create
    @file_system = FileSystem.find(params[:file_system_id])
    @file_system.children << FileSystem.new(file_system_params.merge(file: folder?))
    redirect_to root_path
  end

  private

  def file_system_params
    params.permit(:name, :attached_file)
  end

  def folder?
    params[:it_is_folder].present? ? false : true
  end
end
