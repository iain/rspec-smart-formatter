PROJECT_DIR = File.expand_path('../../', __FILE__)
TEST_PROJECT_DIR = File.expand_path("tmp/test_project", PROJECT_DIR)

require 'open3'
require 'step_definitions'
require 'helper_methods'

RSpec.configure do |config|

  config.around :each do |example|
    FileUtils.mkdir_p TEST_PROJECT_DIR
    Dir.chdir TEST_PROJECT_DIR do
      example.run
    end
  end

  config.include HelperMethods

end
