Pod::Spec.new do |s|

# Root specification

s.name                  = "box-ios-share-sdk"
s.version               = "1.0.0"
s.summary               = "iOS Share SDK."
s.homepage              = "https://github.com/box/box-ios-share-sdk"
s.license               = { :type => "Apache 2.0", :file => "LICENSE" }
s.author                = "Box"
s.source                = { :git => "https://github.com/box/box-ios-share-sdk.git", :tag => "v#{s.version}" }

# Platform

s.ios.deployment_target = "7.0"

# File patterns

s.ios.source_files        = "BoxShareSDK.framework/Versions/A/Headers/*.h"
s.ios.vendored_frameworks = 'BoxShareSDK.framework'
s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(inherited)' }
s.preserve_paths = 'BoxShareSDK.framework'


# Build settings
s.requires_arc          = true
#s.ios.header_dir        = "BOXShareSDK"

s.dependency 'box-ios-content-sdk'

s.resource_bundle = {
  'BoxShareSDKResources' => [
     'BoxShareSDK/BoxShareSDKResources/*.*',
  ]
}

end
