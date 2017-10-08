module Support
  module Uploader
    def self.picture(name, type)
      Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/pictures/#{name}.#{type}"), "image/#{type}")
    end
  end
end
