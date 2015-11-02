class FileAnalysis < ActiveRecord::Base
  enum status: [:pending, :processing, :finished]
end
