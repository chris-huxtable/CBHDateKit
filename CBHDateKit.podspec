Pod::Spec.new do |spec|

  spec.name                   = 'CBHDateKit'
  spec.version                = '1.0.2'
  spec.module_name            = 'CBHDateKit'

  spec.summary                = 'Adds comfort features to NSDate and NSDateFormatter.'
  spec.homepage               = 'https://github.com/chris-huxtable/CBHDateKit'

  spec.license                = { :type => 'ISC', :file => 'LICENSE' }

  spec.author                 = { 'Chris Huxtable' => 'chris@huxtable.ca' }
  spec.social_media_url       = 'https://twitter.com/@Chris_Huxtable'

  spec.osx.deployment_target  = '10.11'

  spec.source                 = { :git => 'https://github.com/chris-huxtable/CBHDateKit.git', :tag => "v#{spec.version}" }

  spec.requires_arc           = true

  spec.public_header_files    = 'CBHDateKit/*.h'
  #spec.private_header_files   = 'CBHDateKit/_*.h'
  spec.source_files           = 'CBHDateKit/*.{h,m}'

end
