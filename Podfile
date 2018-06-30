ENV["COCOAPODS_DISABLE_DETERMINISTIC_UUIDS"] = "true"
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
      config.build_settings['CLANG_WARN_STRICT_PROTOTYPES'] = 'NO'
    end
  end
end

platform :ios, "9.0"

use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

abstract_target 'xTorChatCorePods' do
  pod 'YapDatabase/SQLCipher', :git => 'https://github.com/yapstudios/YapDatabase.git', :commit => 'fcfda4e'
  pod 'libsqlfs/SQLCipher', :git => 'https://github.com/ChatSecure/libsqlfs.git', :branch => 'podspec-fix'
  pod 'IOCipher/GCDWebServer', :path => 'Submodules/IOCipher/IOCipher.podspec'
  pod 'YapTaskQueue/SQLCipher', :git => 'https://github.com/ChatSecure/YapTaskQueue.git', :branch => 'swift4'
  pod 'EAIntroView'
  pod 'Appirater', '~> 2.0'
  pod 'OpenInChrome', '~> 0.0'
  pod 'JTSImageViewController', '~> 1.4'
  pod 'BButton', '~> 4.0'
  pod 'TUSafariActivity', '~> 1.0'
  pod 'ARChromeActivity', '~> 1.0'
  pod 'QRCodeReaderViewController', '~> 4.0'
  pod 'LCTabBarController'
  pod 'ParkedTextField', :git => 'https://github.com/gmertk/ParkedTextField.git', :commit => '43f1d3b'
  pod 'LCTabBarController'
  pod 'JSQMessagesViewController', :path => 'Submodules/JSQMessagesViewController/JSQMessagesViewController.podspec'
  pod 'LumberjackConsole', :path => 'Submodules/LumberjackConsole/LumberjackConsole.podspec'
  pod 'CocoaLumberjack/Swift', '~> 3.4.0'
  pod 'MWFeedParser', '~> 1.0'
  pod 'Navajo', '~> 0.0'
  pod 'BBlock', '~> 1.2'
  pod 'KSCrash', '~> 1.15.3'
  pod 'CocoaAsyncSocket', '~> 7.6.0'
  pod 'ProxyKit/Client', '~> 1.2.0'
  pod 'GCDWebServer', '~> 3.4'
  pod 'CPAProxy', :path => 'Submodules/CPAProxy/CPAProxy.podspec'
  pod 'XMPPFramework/Swift', :path => 'Submodules/XMPPFramework/XMPPFramework.podspec'
  pod 'ChatSecure-Push-iOS', :path => 'Submodules/ChatSecure-Push-iOS/ChatSecure-Push-iOS.podspec'
  pod 'gtm-http-fetcher', :podspec => 'Podspecs/gtm-http-fetcher.podspec'
  pod 'gtm-oauth2', :podspec => 'Podspecs/gtm-oauth2.podspec'
  pod 'SignalProtocolObjC', :path => 'Submodules/SignalProtocol-ObjC/SignalProtocolObjC.podspec'
  pod 'OTRKit', :path => 'Submodules/OTRKit/OTRKit.podspec'
  pod 'Alamofire', '~> 4.4'
  pod 'Kvitto', '~> 1.0'
  
  target 'xTorChatCore'
  target 'xTorChatTests'
  target 'xTorChat'
end
