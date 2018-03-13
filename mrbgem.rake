MRuby::Gem::Specification.new('mruby-socket') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Internet Initiative Japan'

  spec.cc.include_paths << "#{build.root}/src"
  
  spec.cc.flags = '-DESP_PLATFORM -mlongcalls'
  spec.cxx.flags = '-DESP_PLATFORM -mlongcalls'
  
  # If Windows, use winsock
  if ( /mswin|mingw|win32/ =~ RUBY_PLATFORM ) then
    spec.linker.libraries << "wsock32"
    spec.linker.libraries << "ws2_32"
  end

  spec.add_dependency('mruby-io', :github => 'donatoaz/mruby-io', :branch => 'esp32')
  spec.add_dependency('mruby-pack')
end
