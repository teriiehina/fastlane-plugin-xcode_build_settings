module Fastlane
  module Actions
    module SharedValues
      XCODE_BUILD_SETTINGS_RESULT = :XCODE_BUILD_SETTINGS_RESULT
    end

    class XcodeBuildSettingsAction < Action
      def self.run(params)
        command = Helper::XcodeBuildSettingsHelper.generate_xcodebuild_command(params)
        result  = %x(#{command})

        Actions.lane_context[SharedValues::XCODE_BUILD_SETTINGS_RESULT] = result
        result
      end

      def self.description
        %q{Get the value of a build setting given the configuration}
      end

      def self.authors
        [%q{teriiehina}]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :project_path,
                                  env_name: "XCODE_BUILD_SETTINGS_PROJECT_PATH",
                               description: "The path of the xcode project",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :scheme,
                                  env_name: "XCODE_BUILD_SETTINGS_SCHEME",
                               description: "The scheme of the xcode project",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :configuration,
                                  env_name: "XCODE_BUILD_SETTINGS_CONFIGURATION",
                               description: "The configuration of the xcode project",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :build_setting,
                                  env_name: "XCODE_BUILD_SETTINGS_BUILD_SETTING",
                               description: "The build action of the xcode project",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end

      def self.output
        [
          ['XCODE_BUILD_SETTINGS_RESULT', 'The value of the build setting']
        ]
      end

      def self.return_value
        [
          "The value of the build setting if it exists,",
          "an empty string otherwise."
        ].join("\n")
      end

    end
  end
end
