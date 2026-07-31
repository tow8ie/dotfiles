{:user {:plugins [[lein-ancient "1.0.0"]
                  [lein-pprint "1.3.2"]]}
 :hashp {:dependencies [[dev.weavejester/hashp "0.5.1"]]
         :injections [((requiring-resolve 'hashp.install/install!))]}
 :portal {:dependencies [[djblue/portal "0.67.1"]]}}
