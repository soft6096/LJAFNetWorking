
Pod::Spec.new do |s|

  s.name         = "LJAFNetWorking"
  s.version      = "0.0.1"
  s.summary      = "LJAFNetWorking 工具"

  s.description  = "AFNetWorking基础上的封装,把AFN的一些常用的配置代码抽取出来，使用更加方便"

  s.homepage     = "https://github.com/soft6096/LJAFNetWorking"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "宇宙神帝" => "604323817@qq.com" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/soft6096/LJAFNetWorking.git",:branch => "master", :tag => "0.0.1" }

  s.requires_arc = true
  s.source_files  = "LJFrame","LJFrame/*.{h,m}"
  s.dependency 'AFNetworking', '<= 2.5.4'

end
