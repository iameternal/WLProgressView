#
#  Be sure to run `pod spec lint WLProgressView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "WLProgressView"
  s.version      = "0.0.1"
  s.summary      = "自定义的进度条，WLProgressView,可动画播放,可设置bar的圆角效果"
  s.description  = <<-DESC
            进度条
                   DESC

  s.homepage     = "https://github.com/WeiXiaoSmile/WLProgressView"
  s.license      = "MIT (Version 2.0)"
  s.author             = { "liuyabo" => "liuyabo_weixiao@163.com" }
  s.source       = { :git => "https://github.com/WeiXiaoSmile/WLProgressView.git", :tag => "#{s.version}" }
  s.source_files  = "WLProgressView", "WLProgressView/**/*.{h,m}"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ――――――――――――――――――――――――――――――――――――――――――――
s.platform = :ios
s.framework  = 'WLProgressView'
s.dependency 'Masonry'
end
