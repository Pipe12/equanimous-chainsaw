require 'csv'

class FileAnalysesController < ApplicationController
  def create
    file = params[:file] # obtain the file from the params
    file_analysis = FileAnalysis.create(filename: file.original_filename)
    FileAnalysisJob.perform_later file.tempfile.path, file_analysis

    redirect_to file_analysis
  end

  def show
    @file_analysis = FileAnalysis.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @file_analysis }
    end
  end
end
