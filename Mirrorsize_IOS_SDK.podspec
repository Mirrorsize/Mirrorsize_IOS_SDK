

Pod::Spec.new do |spec|

  

  spec.name         = "Mirrorsize_IOS_SDK"

  spec.version      = "1.0.1"

  spec.summary      = "Mirrorsize_IOS_SDK library for iOS written in pure Swift."

  spec.description  = "Mirrorsize_IOS_SDK helps developers to access Mirrorsize predefined methods and process user image with proper parameters."

  spec.homepage     = "https://www.mirrorsize.com/index.php"
 
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "Divay Parashar" => "ap.parashar72@gmail.com" }
 
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/Mirrorsize/

  Mirrorsize_IOS_SDK.git", :tag => "#{spec.version}" }

  spec.source_files  = "Mirrorsize_IOS_SDK/**/*.{swift}"

  spec.swift_version = "4.2" 

end
