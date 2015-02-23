require 'rake'
Gem::Specification.new do |s|
  s.name        = 'stock_financials'
  s.version     = '0.1.0'
  s.date        = '2015-03-01'
  s.summary     = "Financials for a stock!"
  s.authors     = ["Abhijith Reddy"]
  s.email       = 'archerabi@gmail.com'
  s.files       =  FileList['lib/*'].to_a
  s.description = "Get stock financials."
  s.homepage    = 'https://github.com/archerabi/StockFinancials'
  s.license       = 'MIT'
  s.add_dependency "yql", "0.0.2"
end