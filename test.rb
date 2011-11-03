# Load the rails application
require ::File.expand_path('../config/environment',  __FILE__)
require 'benchmark'

ShareChecker.setup do |config|
  config.vkontakte = { :app_id => 2349130 } 
  config.tweetracker = { :group_id => "4e8aeaa4c546611f210000e0" }
  
  config.timeout = 5
  config.user_agent = 'Mozilla/5.0 (X11; Linux i686; rv:7.0.1) Gecko/20100101 Firefox/7.0.1'
end

url = "http://www.mcdonaldseurokids2012.com.ua/works/1383"
n = 300

Benchmark.bm(15) do |x|
  x.report("facebook:")      { n.times { ShareChecker.check(:facebook, url) } }
  x.report("odnoklassniki:") { n.times { ShareChecker.check(:odnoklassniki, url) } }
  x.report("tweetracker:")   { n.times { ShareChecker.check(:tweetracker, url) } }
  x.report("twitter:")       { n.times { ShareChecker.check(:twitter, url) } }
  x.report("vkontakte:")     { n.times { ShareChecker.check(:vkontakte, url) } }
end
