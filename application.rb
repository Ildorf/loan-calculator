require 'erb'
require 'nokogiri'

Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'app/**', '*.rb')].each { |file| require file }