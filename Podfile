# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Noah' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'SlideMenuControllerSwift'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "13.0"
    end
  end
end

  # Pods for Noah

  target 'NoahTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NoahUITests' do
    # Pods for testing
  end

end