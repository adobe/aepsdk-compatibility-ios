# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'ACPCore' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ACPCore
  pod 'AEPServices'
  pod 'AEPCore'
  pod 'AEPLifecycle'
  pod 'AEPIdentity'
  pod 'AEPSignal'
  pod 'AEPRulesEngine'

  target 'ACPCoreTests' do
    # Pods for testing
  end

end

target 'ACPUserProfile' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ACPCore
  pod 'ACPCore', :path => './'
  pod 'AEPServices'
  pod 'AEPCore'
  pod 'AEPLifecycle'
  pod 'AEPIdentity'
  pod 'AEPSignal'
  pod 'AEPRulesEngine'
  pod 'AEPUserProfile', :git => 'git@github.com:adobe/aepsdk-userprofile-ios.git', :branch => 'main'
end

target 'ACPAnalytics' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

# Pods for ACPAnalytics
  pod 'ACPCore', :path => './'
  pod 'AEPCore'
  pod 'AEPServices'
  pod 'AEPIdentity'
  pod 'AEPAnalytics'
end

target 'ACPAudience' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'ACPCore', :path => './'
  pod 'AEPServices'
  pod 'AEPCore'
  pod 'AEPAudience'
end

target 'ACPMedia' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'ACPCore', :path => './'
  pod 'AEPServices'
  pod 'AEPCore'
  pod 'AEPIdentity'
#pod 'AEPAnalytics'
  pod 'AEPMedia', :git => 'git@github.com:adobe/aepsdk-media-ios.git', :branch => 'dev'
end
