Pod::Spec.new do |s|
  s.name             = "UIWindow-Transition"
  s.version          = "0.0.1"
  s.summary          = "UIWindow transition effect while change window's rootViewController"
  s.description      = <<-DESC
                       an extension of UIWindow for the transition effect of changing window's rootViewController
                       DESC
  s.homepage         = "https://github.com/litt1e-p/UIWindow-Transition"
  s.license          = { :type => 'MIT' }
  s.author           = { "litt1e-p" => "litt1e.p4ul@gmail.com" }
  s.source           = { :git => "https://github.com/litt1e-p/UIWindow-Transition.git", :tag => "#{s.version}" }
  s.platform = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'UIWindow-Transition/*'
  s.frameworks = 'Foundation', 'UIKit'
end
