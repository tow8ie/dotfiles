{:user {:plugins [[lein-ancient "1.0.0-RC3"]
                  [lein-pprint "1.3.2"]]
        :dependencies [[org.clojure/tools.reader "1.5.2"]]}
 :hashp {:dependencies [[dev.weavejester/hashp "0.4.0"]]
         :injections [(require 'hashp.preload)]}
 :portal {:dependencies [[djblue/portal "0.59.2"]]}}
