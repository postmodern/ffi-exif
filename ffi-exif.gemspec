# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ffi-exif}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-10-10}
  s.description = %q{Ruby FFI bindings for the libexif library.}
  s.email = %q{postmodern.mod3@gmail.com}
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".rspec",
    ".yardopts",
    "ChangeLog.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "ffi-exif.gemspec",
    "lib/ffi/exif.rb",
    "lib/ffi/exif/content.rb",
    "lib/ffi/exif/data.rb",
    "lib/ffi/exif/entry.rb",
    "lib/ffi/exif/exif.rb",
    "lib/ffi/exif/loader.rb",
    "lib/ffi/exif/maker_note.rb",
    "lib/ffi/exif/maker_note_tag.rb",
    "lib/ffi/exif/rational.rb",
    "lib/ffi/exif/srational.rb",
    "lib/ffi/exif/types.rb",
    "spec/exif_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/postmodern/ffi-exif}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.requirements = ["libexif >= 0.6.0"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{FFI bindings for libexif}
  s.test_files = [
    "spec/exif_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, ["~> 0.6.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<ffi>, ["~> 0.6.0"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<ffi>, ["~> 0.6.0"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
  end
end

