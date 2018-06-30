

Pod::Spec.new do |s|

  s.name         = "ChatSecure-Push-iOS"
  s.version      = "1.0"
  s.summary      = "The iOS SDK for ChatSecure-Push-Server"

  s.description  = <<-DESC
                   A Swift way to interact with the ChatSecure-Push-Server API.

                   DESC

  s.homepage     = "https://github.com/ChatSecure/ChatSecure-Push-iOS"
  s.license      = { :type => "GNU GPL v3", :file => "LICENSE" }
  s.author    = "ChatSecure"
  s.social_media_url   = "http://twitter.com/ChatSecure"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/ChatSecure/ChatSecure-Push-iOS.git", :tag => s.version.to_s }

  s.source_files  = "Classes", "ChatSecurePush-SDK/*.swift"
end
