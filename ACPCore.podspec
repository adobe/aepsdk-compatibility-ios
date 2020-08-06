Pod::Spec.new do |s|
  s.name             = "ACPCore"
  s.version          = "0.0.1"
  s.summary          = "ACPCore"
  s.description      = <<-DESC
ACPCore
                        DESC
  s.homepage         = "https://github.com/adobe/aepsdk-core-ios"
  s.license          = 'Apache V2'
  s.author       = "Adobe Experience Platform SDK Team"
  # s.source           = { :git => "https://github.com/adobe/aepsdk-core-ios", :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  s.source_files          = 'ACPCore/**/*.{h,m}'
end
