Pod::Spec.new do |s|
  s.name             = "ACPCoreWrapper"
  s.version          = "2.9.9"
  s.summary          = "ACPCoreWrapper"
  s.description      = <<-DESC
ACPCore backward compatible layer
                        DESC
  s.homepage         = "https://github.com/adobe/aepsdk-core-ios"
  s.license          = 'Apache V2'
  s.author       = "Adobe Experience Platform SDK Team"
  s.source           = { :git => "https://git.corp.adobe.com/adobe/aepsdk-compatibility-ios", :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  s.source_files          = 'ACPCore/**/*.{h,m}'
  s.requires_arc      = true
  
  s.dependency 'AEPCore'
  s.dependency 'AEPServices'
  s.dependency 'AEPRulesEngine'


end
