# Pod::Spec.new do |s|
#   s.name             = 'R3Networking'
#   s.version          = '0.1.2'
#   s.summary          = 'Library for Networking Comunication.'

#   s.description      = <<-DESC
#     TODO: Add long description of the pod here.
#                        DESC

#   s.homepage         = 'https://github.com/r3tecnologianet/Networking.git'
#   s.license          = { :type => 'MIT', :file => 'LICENSE' }
#   s.author           = { 'r3tecnologia' => 'regis@r3tecnologia.net' }
#   s.source           = { :git => 'https://github.com/r3tecnologianet/Networking.git', :tag => s.version.to_s }

#   s.ios.deployment_target = '12,0'
#   s.platform     = :ios, '12.0'
#   s.swift_version = '5.3'
#   s.source_files = 'Sources/R3Networking/**/*.{swift}'
  
#   # s.resources = 'Sources/**/*.{xcassets,json,storyboard,xib,xcdatamodeld}'

#   s.test_spec 'Tests' do |test_spec|
#     test_spec.source_files = 'Tests/**/*.{swift}'
#   end

# end

Pod::Spec.new do |s|
  s.name         = 'R3Networking'
  s.version      = '0.1.3'
  s.summary      = 'Library for Networking Comunication'
  s.homepage     = 'https://github.com/r3tecnologianet/Networking.git'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = 'Regis Araujo'
  s.platform     = :ios, '12.0'
  s.ios.deployment_target = '12.0'
  s.source       = { :git => 'https://github.com/r3tecnologianet/Networking.git', :tag => s.version }
  s.source_files = 'Sources/R3Networking/**/*'
  s.framework    = 'Security'
  s.requires_arc = true
end