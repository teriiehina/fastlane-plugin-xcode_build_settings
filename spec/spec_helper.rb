$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

module SpecHelper
end

require "fastlane"
require "fastlane/plugin/xcode_build_settings"

describe Fastlane::Helper::XcodeBuildSettingsHelper do
  describe "parameter handling" do

    before(:each) do
      @helper = Fastlane::Helper::XcodeBuildSettingsHelper
      @dumb_config = Hash.new
      @dumb_config[:project_path]   = "/tmp/fastlane/tests/fastlane/bundle.xcodeproj"
      @dumb_config[:scheme]         =  "bundle"
      @dumb_config[:configuration]  =  "Debug" 
      @dumb_config[:build_setting]  =  "MTL_ENABLE_DEBUG_INFO"
    end

    it "construct a command line with the project path" do
      command = @helper.generate_xcodebuild_command(@dumb_config)
      expect(command).to include(@dumb_config[:project_path])
    end

    it "construct a command line with the scheme" do
      command = @helper.generate_xcodebuild_command(@dumb_config)
      expect(command).to include(@dumb_config[:scheme])
    end

    it "construct a command line with the configuration" do
      command = @helper.generate_xcodebuild_command(@dumb_config)
      expect(command).to include(@dumb_config[:configuration])
    end

    it "construct a command line with the build setting" do
      command = @helper.generate_xcodebuild_command(@dumb_config)
      expect(command).to include(@dumb_config[:build_setting])
    end
  end
end
