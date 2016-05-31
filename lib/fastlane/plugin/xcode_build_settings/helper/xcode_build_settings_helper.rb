module Fastlane
  module Helper
    class XcodeBuildSettingsHelper
      def self.generate_xcodebuild_command(params)
        project_path  = params[:project_path]
        scheme        = params[:scheme]
        configuration = params[:configuration]
        build_setting = params[:build_setting]

        command = "xcodebuild -project '#{project_path}' -scheme '#{scheme}' -showBuildSettings"
        command = command + " -configuration '#{configuration}'"
        command = command + " | grep #{build_setting} | awk -F ' = ' '{print $2}'"

        return command
      end
    end
  end
end
