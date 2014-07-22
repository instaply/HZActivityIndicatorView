Pod::Spec.new do |s|
  
  s.name         = "HZActivityIndicatorView"
  s.version      = "1.0.0"
  s.summary      = "Customizable activity indicator."

  s.description  = <<-DESC
A highly customizable drop-in replacement for UIActivityIndicatorView
                   DESC

  s.homepage     = "https://github.com/sarbogast/HZActivityIndicatorView"
  
  s.license      = 'BSD-new'

  s.requires_arc = true
  
  s.author       = { "Hezi Cohen" => "" , "Sebastien Arbogast" => "sebastien.arbogast@epseelon.com"}

  s.platform     = :ios

  s.source       = { :git => "https://github.com/sarbogast/HZActivityIndicatorView.git", :commit => "f550a3eac0c689b26db29b6f9acfe54fabd341b3" }
  
  s.source_files  = 'HZActivityIndicator/*.{h,m}'
  s.exclude_files = 'ActivityIndicatorDemo/**', 'ActivityIndicatorDemo.xcodeproj/**'

end
