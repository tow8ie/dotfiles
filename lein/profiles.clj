{:user {:dependencies [[pjstadig/humane-test-output "0.9.0"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :plugins [[lein-pprint "1.2.0"]
                  [lein-ancient "0.6.15"]
                  ;; Does not work for JDK 12 + Clojure 1.10.0 + lein 2.9.1
                  ;; @see: https://github.com/venantius/ultra/issues/108
                  #_[venantius/ultra "0.6.0"]]}}
