Gem::Specification.new do |s|
  s.name               = "gallicagram"
  s.version            = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas Le Roux"]
  s.date = %q{2022-11-27}
	s.license = "Creative Commons"
  s.description = %q{A ruby gem to manage Gallicagram data}
	s.summary = %q{A ruby gem to manage Gallicagram data}
  s.email = %q{nicolas.leroux@sciencespo.fr}
  s.files = ["lib/gallicagram.rb"]
  s.homepage = %q{https://github.com/nicolrx/gallicagram}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
	
	s.add_runtime_dependency 'open-uri'
	s.add_runtime_dependency 'cgi'


  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
