describe Fastlane::Actions::XcodeBuildSettingsAction do

  # Variables
  let (:test_path) { "/tmp/fastlane/tests/fastlane" }
  let (:fixtures_path) { "./spec/fixtures/xcodeproj" }
  let (:proj_file) { "bundle.xcodeproj" }
  let (:identifier_key) { 'PRODUCT_BUNDLE_IDENTIFIER' }

  # Action parameters
  let (:xcodeproj) { File.join(test_path, proj_file) }
  let (:plist_path) { "Info.plist" }
  let (:app_identifier) { "com.test.plist" }

  before(:each) do
    ['XCODE_BUILD_SETTINGS_PROJECT_PATH', 'XCODE_BUILD_SETTINGS_SCHEME', 'XCODE_BUILD_SETTINGS_CONFIGURATION', 'XCODE_BUILD_SETTINGS_BUILD_ACTION', 'XCODE_BUILD_SETTINGS_BUILD_SETTING'].each do |key|
      ENV[key] = nil
    end
    @dumb_config = {project_path: '/tmp/fastlane/tests/fastlane/bundle.xcodeproj', scheme: 'bundle', configuration: 'Debug', build_setting: 'MTL_ENABLE_DEBUG_INFO'}
    Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::XCODE_BUILD_SETTINGS_RESULT] = nil
  end

  describe 'It can read build settings from a xcodeproj file' do
    before do
      FileUtils.mkdir_p(test_path)

      source      = File.join(fixtures_path, proj_file)
      destination = File.join(test_path, proj_file)

      FileUtils.cp_r(source, destination)
    end

    it "returns a YES based on configuration" do
      @dumb_config[:configuration] = 'Debug'
      result = Fastlane::Actions::XcodeBuildSettingsAction.run(@dumb_config)

      expect(result).to include('YES')
    end

    it "returns a NO based on configuration" do
      @dumb_config[:configuration] = 'Release'
      result = Fastlane::Actions::XcodeBuildSettingsAction.run(@dumb_config)

      expect(result).to include('NO')
    end

  end

  describe 'It can read handle missing parameter' do

    it "throws an error when missing the xcode project path" do
      @dumb_config[:project_path] = nil

      expect do
        Fastlane::FastFile.new.parse("lane :test do
          xcode_build_settings(#{@dumb_config})
        end").runner.execute(:test)
      end.to raise_error("No value found for 'project_path'")
    end

    it "throws an error when missing the scheme" do
      @dumb_config[:scheme] = nil

      expect do
        Fastlane::FastFile.new.parse("lane :test do
          xcode_build_settings(#{@dumb_config})
        end").runner.execute(:test)
      end.to raise_error("No value found for 'scheme'")
    end

    it "throws an error when missing the configuration" do
      @dumb_config[:configuration] = nil

      expect do
        Fastlane::FastFile.new.parse("lane :test do
          xcode_build_settings(#{@dumb_config})
        end").runner.execute(:test)
      end.to raise_error("No value found for 'configuration'")
    end

    it "throws an error when missing the build setting name" do
      @dumb_config[:build_setting] = nil

      expect do
        Fastlane::FastFile.new.parse("lane :test do
          xcode_build_settings(#{@dumb_config})
        end").runner.execute(:test)
      end.to raise_error("No value found for 'build_setting'")
    end

  end
end
