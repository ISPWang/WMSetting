Pod::Spec.new do |s|

s.name = "WMSetting"

s.version = "0.0.1"

s.summary = "Header and Footer tableView setting"

s.homepage = "https://github.com/ISPWang/WMSetting"

s.license = "MIT"

s.author             = { "ISPWang" => "sanpeng123@126.com" }

s.platform = :ios, "7.0"

s.source = { :git => "https://github.com/ISPWang/WMSetting.git", :tag => "0.0.1" }

s.source_files = "WMSetting/Setting/**/*.{h,m}"

s.resource     = "WMSetting/Setting/**/*.{jpg,png}"

s.frameworks = "UIKit"

s.requires_arc = true

s.dependency 'Masonry'

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

end