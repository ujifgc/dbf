module DBF
  DBF_HEADER_SIZE = 32
  FPT_HEADER_SIZE = 512
  FPT_BLOCK_HEADER_SIZE = 8
  DATE_REGEXP = /([\d]{4})([\d]{2})([\d]{2})/
  VERSION_DESCRIPTIONS = {
    "02" => "FoxBase",
    "03" => "dBase III without memo file",
    "04" => "dBase IV without memo file",
    "05" => "dBase V without memo file",
    "30" => "Visual FoxPro",
    "31" => "Visual FoxPro with AutoIncrement field",
    "7b" => "dBase IV with memo file",
    "83" => "dBase III with memo file",
    "8b" => "dBase IV with memo file",
    "8e" => "dBase IV with SQL table",
    "f5" => "FoxPro with memo file",
    "fb" => "FoxPro without memo file"
  }
  
  MS_PER_SECOND = 1000
  MS_PER_MINUTE = MS_PER_SECOND * 60
  MS_PER_HOUR = MS_PER_MINUTE * 60
  
  class DBFError < StandardError; end
  class InvalidColumnName < DBFError; end
  class InvalidColumnLength < DBFError; end
  
  module Helpers
    def underscore(camel_cased_word)
      camel_cased_word.to_s.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
    end
  end
end