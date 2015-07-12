$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rea/robot'

require 'aruba/api'
require 'aruba/reporting'

RSpec.configure do |config|
  config.include Aruba::Api

  config.before(:each) do
    @aruba_io_wait_seconds = 1

    restore_env
    clean_current_dir
  end
end
