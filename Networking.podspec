Pod::Spec.new do |s|
  s.name             = 'Networking'
  s.version          = '0.1.0'
  s.summary          = 'Library for Networking Comunication.'

  s.description      = <<-DESC
    TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/r3tecnologianet/Networking.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'r3tecnologia' => 'regis@r3tecnologia.net' }
  s.source           = { :git => 'https://github.com/r3tecnologianet/Networking.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.4'
  s.swift_version = '5.3'
  s.source_files = 'Sources/**/*.{swift}'
  
  # s.resources = 'Sources/**/*.{xcassets,json,storyboard,xib,xcdatamodeld}'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{swift}'
  end

end