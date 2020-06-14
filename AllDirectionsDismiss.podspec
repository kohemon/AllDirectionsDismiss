Pod::Spec.new do |spec|
  spec.name           = "AllDirectionsDismiss"
  spec.version        = "1.0"
  spec.summary        = "AllDirectionsDismiss allows you to easily dismiss a viewController by scrolling in all four directions."
  spec.description    = <<-DESC
AllDirectionsDismiss allows you to easily dismiss a viewController by scrolling in all four directions.
UIScrollView, UITableView and UICollectionView are also supported.
                   DESC
  spec.homepage       = "https://github.com/kohei1218/AllDirectionsDismiss"
  spec.platform       = :ios, "11.0"
  spec.source         = { :git => "https://github.com/kohei1218/AllDirectionsDismiss.git", :tag => "#{spec.version}" }
  spec.source_files   = "AllDirectionsDismiss/Source/*.swift"
  spec.swift_versions = ["4.0", "4.2", "5.0"]
  spec.license        = { :type => 'MIT', :file => 'LICENSE' }
  spec.author         = { "kohei1218" => "yandapanda1218@gmail.com" }
end
