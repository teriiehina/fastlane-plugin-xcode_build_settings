$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

module SpecHelper
end

require 'fastlane'
require 'fastlane/plugin/xcode_build_settings'

describe Fastlane::Helper::XcodeBuildSettingsHelper do
  describe 'parameter handling' do

    before(:each) do
      @dumb_config = {project_path: '/tmp/fastlane/tests/fastlane/bundle.xcodeproj', scheme: 'bundle', configuration: 'Debug', build_setting: 'MTL_ENABLE_DEBUG_INFO'}
    end

    it 'construct a command line with the project path' do
      command = Fastlane::Helper::XcodeBuildSettingsHelper.generate_xcodebuild_command(@dumb_config)
      expect(command).to include(@dumb_config[:project_path])
    end

    it 'construct a command line with the scheme' do
      command = Fastlane::Helper::XcodeBuildSettingsHelper.generate_xcodebuild_command(@dumb_config)
      expect(command).to include(@dumb_config[:scheme])
    end

    it 'construct a command line with the configuration' do
      command = Fastlane::Helper::XcodeBuildSettingsHelper.generate_xcodebuild_command(@dumb_config)
      expect(command).to include(@dumb_config[:configuration])
    end

    it 'construct a command line with the build setting' do
      command = Fastlane::Helper::XcodeBuildSettingsHelper.generate_xcodebuild_command(@dumb_config)
      expect(command).to include(@dumb_config[:build_setting])
    end

  end
end
