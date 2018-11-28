class FileSystemsController < ApplicationController
  def index
    @files = FileSystem.roots
  end
end
