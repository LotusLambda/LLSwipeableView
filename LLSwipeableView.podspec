Pod::Spec.new do |spec|
  spec.name                     = 'LLSwipeableView'
  spec.version                  = '1.0.7'
  spec.license                  = { :type => 'MIT' }
  spec.homepage                 = 'https://github.com/LotusLambda/LLSwipeableView'
  spec.authors                  = {
    'Aron Balog' => 'aronbalog@gmail.com',
    'Bruno Bartol' => 'bruno.bartol1609@gmail.com'
  }
  spec.summary                  = 'LLSwipeableView module for iOS.'
  spec.source                   = { :git => 'https://github.com/LotusLambda/LLSwipeableView.git', :tag => '1.0.7' }
  spec.module_name              = 'LLSwipeableView'
  spec.swift_version            = '5.0'
  spec.ios.deployment_target    = '14.0'
  spec.source_files             = 'LLSwipeableView/**/*.swift'
  spec.framework                = 'SwiftUI'
end
