Pod::Spec.new do |s|
  s.name             = "ACPAudience"
  s.version          = "2.9.9"
  s.summary          = "ACPAudience"
  s.description      = <<-DESC
  ACPAudience backward compatible layer
                        DESC
  s.homepage         = "https://github.com/adobe/aepsdk-compatibility-ios"
  s.license          = 'Apache V2'
  s.author       = "Adobe Experience Platform SDK Team"
  s.source           = { :git => "https://github.com/adobe/aepsdk-compatibility-ios", :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  s.source_files          = 'ACPAudience/**/*.{h,m}'
  s.requires_arc      = true
  
  s.dependency 'AEPServices'
  s.dependency 'AEPCore'
  s.dependency 'AEPIdentity'
  s.dependency 'ACPCore'
  s.dependency 'AEPAudience'

end