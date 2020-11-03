Pod::Spec.new do |s|
  s.name             = "ACPUserProfile"
  s.version          = "3.0.0-beta.1"
  s.summary          = "ACPUserProfile"
  s.description      = <<-DESC
  ACPUserProfile backward compatible layer
                        DESC
  s.homepage         = "https://github.com/adobe/aepsdk-compatibility-ios"
  s.license          = 'Apache V2'
  s.author       = "Adobe Experience Platform SDK Team"
  s.source           = { :git => "https://github.com/adobe/aepsdk-compatibility-ios", :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  s.source_files          = 'ACPUserProfile/**/*.{h,m}'
  s.requires_arc      = true
  
  s.dependency 'AEPServices'
  s.dependency 'AEPCore'
  s.dependency 'AEPLifecycle'
  s.dependency 'AEPIdentity'
  s.dependency 'AEPSignal'
  s.dependency 'AEPRulesEngine'
  s.dependency 'ACPCore'
  s.dependency 'AEPUserProfile'

end
