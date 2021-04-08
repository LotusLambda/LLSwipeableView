Pod::Spec.new do |spec|
  spec.name                     = 'LLSwipableView'
  spec.version                  = '1.0.4'
  spec.license                  = { :type => 'GNU GPL' }
  spec.homepage                 = 'https://github.com/LotusLambda/LLSwipableView'
  spec.authors                  = {
    'Aron Balog' => 'aronbalog@gmail.com',
    'Bruno Bartol' => 'bruno.bartol1609@gmail.com'
  }
  spec.summary                  = 'LLSwipableView module for iOS.'
  spec.source                   = { :git => 'https://github.com/LotusLambda/LLSwipableView.git', :tag => '1.0.4' }
  spec.module_name              = 'LLSwipableView'
  spec.swift_version            = '5.0'
  spec.ios.deployment_target    = '14.1'
  spec.source_files             = 'LLSwipableView/**/*.swift'
  spec.framework                = 'SwiftUI'
end
