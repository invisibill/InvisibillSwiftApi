Pod::Spec.new do |s|
  s.name = 'InvisibillSwiftApi'
  s.version = '0.1.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'invisibill swift api'

  s.homepage = 'https://github.com/invisibill/InvisibillSwiftApi'
  s.authors = { 'Kyle Thomas' => 'k.thomas@unmarkedconsulting.com' }
  s.source = { :git => 'https://github.com/invisibill/InvisibillSwiftApi.git', :tag => s.version }
  s.source_files = 'Source/**/*.swift'

  s.ios.deployment_target = '9.3'
  s.ios.dependency 'KTSwiftExtensions'
end
