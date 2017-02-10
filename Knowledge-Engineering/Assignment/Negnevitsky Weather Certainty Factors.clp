(reset)
;(facts)
;(watch all)

(deftemplate today-weather (slot type) (slot certainty))
(deftemplate tomorrow-weather (slot type) (slot certainty))
(deftemplate rainfall (slot amount) (slot certainty))
(deftemplate climate (slot temperature) (slot certainty))
(deftemplate cloud-cover (slot type) (slot certainty))

;(assert (today-weather (type no-data) (certainty no-data))
;(assert (tomorrows-weather (type no-data) (certainty no-data))
;(assert (rainfall (amount no-data) (certainty no-data))
;(assert (climate (temperature no-data) (certainty no-data))
;(assert (cloud-cover (type no-data) (certainty no-data)) 

(defrule go-rule-1
    =>

    (printout t "Enter todays weather (Input 'n' if data not available)" crlf)
    (bind ?tW (read))
    (if (= ?tW n)
     then
     	(assert (today-weather (type no-data)))
     else
     	(assert (today-weather (type ?tW))))
    
    (printout t "Enter current rainfall (Input 'n' if data not available)" crlf)
    (bind ?r (read))
    (if (= ?r n)
     then
     	(assert (rainfall (amount no-data)))
     else
     	(assert (rainfall (amount ?r))))

    (printout t "Enter current climate (Input 'n' if data not available)" crlf)
    (bind ?c (read))
    (if (= ?c n)
     then
     	(assert (climate (temperature no-data)))
     else
     	(assert (climate (temperature ?c))))	

    (printout t "Enter current cloud cover (Input 'n' if data not available)" crlf)
    (bind ?cl (read))
    (if (= ?cl n)
     then
     	(assert (cloud-cover (type no-data)))
     else
     	(assert (cloud-cover (type ?cl))))
    (run)
)

(defrule rule-1
	(today-weather {type == rain})
	(rainfall {amount == no-data})
	(climate {temperature == no-data})
	(cloud-cover {type == no-data})
	=> 
	(assert (tomorrow-weather (type rain) (certainty 0.71)))
	(assert (tomorrow-weather (type dry) (certainty 0.29)))
)

(defrule rule-2
	(today-weather {type == dry})
	(rainfall {amount == no-data})
	(climate {temperature == no-data})
    (cloud-cover {type == no-data})
	=>
	(assert (tomorrow-weather (type rain) (certainty 0.71)))
	(assert (tomorrow-weather (type dry)  (certainty 0.29)))
)

(defrule rule-3
	(today-weather {type == rain})
	(rainfall {amount == low})
	(climate {temperature == no-data})
	(cloud-cover {type == no-data})
	=>
	(assert (tomorrow-weather (type dry) (certainty 0.8)))
	(assert (tomorrow-weather (type rain) (certainty 0.71)))
)

(defrule rule-4
	(today-weather {type == rain})
	(rainfall {amount == low})
	(climate {temperature == cold})
	(cloud-cover {type == no-data})
	=>
	(assert (tomorrow-weather (type dry) (certainty 0.86)))
	(assert (tomorrow-weather (type rain) (certainty 0.71)))
)

(defrule rule-5
	(today-weather {type == dry})
	(rainfall {amount == no-data})
	(climate {temperature == warm})
	(cloud-cover {type == no-data})
	=>
	(assert (tomorrow-weather (type dry) (certainty 0.86)))
	(assert (tomorrow-weather (type rain) (certainty 0.69)))
)

(defrule rule-6
	(today-weather {type == dry})
	(rainfall {amount == no-data})
	(climate {temperature == warm})
	(cloud-cover {type == overcast})
	=>
	(assert (tomorrow-weather (type dry) (certainty 0.86)))
	(assert (tomorrow-weather (type rain) (certainty 0.69)))
)

(defrule probability-rule1
	(tomorrow-weather (type rain) (certainty ?cf1&:(> ?cf1 0.99)))
	=>	
	(printout t "It will definitely rain tomorrow" crlf)
)


(defrule probability-rule2
	(tomorrow-weather (type rain) (certainty ?cf1&:(< ?cf1 0.99)&:(> ?cf1 0.80)))
	=>	
	(printout t "It will almost certainly rain tomorrow" crlf)
)

(defrule probability-rule3
	(tomorrow-weather (type rain) (certainty ?cf1&:(< ?cf1 0.80)&:(> ?cf1 0.60)))
	=>	
	(printout t "It will probably rain tomorrow" crlf)
)

(defrule probability-rule4
	(tomorrow-weather (type rain) (certainty ?cf1&:(< ?cf1 0.60)&:(> ?cf1 0.40)))
	=>	
	(printout t "It will maybe rain tomorrow" crlf)
)

(defrule probability-rule5
	(tomorrow-weather (type rain) (certainty ?cf1&:(< ?cf1 0.40)))
	=>	
	(printout t "It is unkown if it will rain tomorrow" crlf)
)

(defrule probability-rule6
	(tomorrow-weather (type dry) (certainty ?cf2&:(> ?cf2 0.99)))
	=>	
	(printout t "It will definitely be dry tomorrow" crlf)
)

(defrule probability-rule7
	(tomorrow-weather (type dry) (certainty ?cf2&:(< ?cf2 0.99)&:(> ?cf2 0.80)))
	=>	
	(printout t "It will almost certainly be dry tomorrow" crlf)
)

(defrule probability-rule8
	(tomorrow-weather (type dry) (certainty ?cf2&:(< ?cf2 0.80)&:(> ?cf2 0.60)))
	=>	
	(printout t "It will probably be dry tomorrow" crlf)
)

(defrule probability-rule9
	(tomorrow-weather (type dry) (certainty ?cf2&:(< ?cf2 0.60)&:(> ?cf2 0.40)))
	=>	
	(printout t "It will maybe be dry tomorrow" crlf)
)

(defrule probability-rule10
	(tomorrow-weather (type dry) (certainty ?cf2&:(< ?cf2 0.40)))
	=>	
	(printout t "It is unkown if it will be dry tomorrow" crlf)
)
