Pod::Spec.new do |s|
  s.name             = "ACPTarget"
  s.version          = "2.9.9"
  s.summary          = "ACPTarget"
  s.description      = <<-DESC
  ACPTarget backward compatible layer
                        DESC
  s.homepage         = "https://github.com/adobe/aepsdk-compatibility-ios"
  s.license          = 'Apache V2'
  s.author       = "Adobe Experience Platform SDK Team"
  s.source           = { :git => "https://github.com/adobe/aepsdk-compatibility-ios.git", :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  s.source_files          = 'ACPTarget/**/*.{h,m}'
  s.requires_arc      = true
  
  s.dependency 'AEPCore'
  s.dependency 'ACPCore'
  s.dependency 'AEPTarget'

end
