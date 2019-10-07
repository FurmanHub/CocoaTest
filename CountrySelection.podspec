Pod::Spec.new do |s|
  s.name             = 'CountrySelection'
  s.version          = '0.0.1'
  s.summary          = 'Country Selection.'
 
  s.description      = <<-DESC
Country Selection Pod
                       DESC
 
  s.homepage         = 'https://github.com/FurmanHub/CocoaTest'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Fedor Volchkov>' => '<fedor.volchkov.cr@gmail.com>' }
  s.source           = { :git => 'https://github.com/FurmanHub/CocoaTest.git', :tag => s.version.to_s }
s.swift_version = "5.1"
 
  s.ios.deployment_target = '13.0'
  s.source_files = ['CountrySelectionPod/Country.swift', 'CountrySelectionPod/CountrySelection.swift', 'CountrySelectionPod/Countries.json', 'CountrySelectionPod/Assets.xcassets', 'CountrySelectionPod/AppDelegate.swift', 'CountrySelectionPod/SceneDelegate.swift']
 
end