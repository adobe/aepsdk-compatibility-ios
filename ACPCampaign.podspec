Pod::Spec.new do |s|
  s.name             = "ACPCampaign"
  s.version          = "2.9.9"
  s.summary          = "ACPCampaign"
  s.description      = <<-DESC
  ACPCampaign backward compatible layer
                        DESC
  s.homepage         = "https://github.com/adobe/aepsdk-compatibility-ios"
  s.license          = 'Apache V2'
  s.author       = "Adobe Experience Platform SDK Team"
  s.source           = { :git => "https://github.com/adobe/aepsdk-compatibility-ios", :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  s.source_files          = 'ACPCampaign/**/*.{h,m}'
  s.requires_arc      = true
  
  s.dependency 'AEPCore'
  s.dependency 'AEPServices'
  s.dependency 'AEPIdentity'
  s.dependency 'AEPRulesEngine'
  s.dependency 'ACPCore'
  s.dependency 'AEPCampaign'

end