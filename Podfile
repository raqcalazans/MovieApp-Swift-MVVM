platform :ios, '17.0'

use_frameworks!

workspace 'NetFilm'

# Ignora todos warnings dos Pods
inhibit_all_warnings!

# Para evitar problemas ao atualizar (pod update):
source 'https://github.com/CocoaPods/Specs.git'

def alamofire
  pod 'Alamofire', '~> 5.5'
end

def alamofire_image
  pod 'AlamofireImage', '4.1'
end

def ui_font_complete
  pod 'UIFontComplete'
end

def nv_activity
  pod 'NVActivityIndicatorView'
end

def quick_nimble
  pod 'Quick', '~> 5'
  pod 'Nimble', '~> 10'
end

target 'NetFilm' do
  project './NetFilm.project'
  alamofire
  alamofire_image
  ui_font_complete
  nv_activity
  
  target 'NetFilmTests' do
    inherit! :search_paths
    quick_nimble
  end
end
