require 'open3'
require 'step_definitions'

TEST_PROJECT_DIR = File.expand_path("../../tmp/test_project", __FILE__)

RSpec.configure do |config|

  config.around :each do |example|
    FileUtils.rm_r TEST_PROJECT_DIR if File.exist?(TEST_PROJECT_DIR)
    FileUtils.mkdir_p TEST_PROJECT_DIR
    Dir.chdir TEST_PROJECT_DIR do
      example.run
    end
  end

end
