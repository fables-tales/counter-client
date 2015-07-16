require "minitest/autorun"

Dir.glob("test/**/*.rb").reject { |x| 
  /test_helper/ === x
}.each do |file_name|
  load file_name
end
