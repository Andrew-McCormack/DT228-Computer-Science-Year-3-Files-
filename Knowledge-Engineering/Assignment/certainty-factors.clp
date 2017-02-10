(reset)
(facts)
(watch all)

(deftemplate today-weather (slot type) (slot certainty))
(deftemplate tomorrow-weather (slot type) (slot certainty))
(deftemplate rainfall (slot amount) (slot certainty))
(deftemplate climate (slot temperature) (slot certainty))
(deftemplate sky (slot type) (slot certainty))

(defrule rule-1
	(today-weather (type rain))
    (rainfall none)
	=>
	(assert (tomorrow rain) CF 0.5)
)

(defrule rule-2
	(today dry)
	(rainfall low)
	=>
	(assert (tomorrow dry) CF 0.5)
)

(defrule rule-3
	(today rain)
	(rainfall low)
	=>
	(assert (tomorrow dry) CF 0.6)
)

(defrule rule-4
	(today rain)
	(rainfall low)
	(temperature cold)
	=>
	(assert (tomorrow dry) CF 0.7)
)


(if (> ?cf1 0.99) then
	 		(printout t "It will definitely be dry tomorrow" crlf))
	 	
	 	(if (> ?cf1 0.8) then
	 		if (< ?cf1 0.99) then
	 			(printout t "It will almost certainly be dry tomorrow" crlf))

	 	(if (> ?cf1 0.6) then
	 		if (< ?cf1 0.8) then
	 			(printout t "It will probably be dry tomorrow" crlf))

		(if (> ?cf1 0.4) then
			if (< ?cf1 < 0.6) then
	 			(printout t "It will maybe be dry tomorrow" crlf))

	 	(if (< ?cf1 0.4) then
	 		(printout t "It is unknown if it will be dry tomorrow" crlf))

		(if (> ?cf2 0.99) then
	 		(printout t "It will definitely rain tomorrow" crlf))
	 	
	 	(if (> ?cf2 0.8) then
	 		if (< ?cf2 0.99) then
	 			(printout t "It will almost certainly rain tomorrow" crlf))

	 	(if (> ?cf2 0.6) then
	 		if (< ?cf2 0.8) then
	 			(printout t "It will probably rain tomorrow" crlf))

		(if (> ?cf2 0.4) then
	 			(printout t "It will maybe rain tomorrow" crlf))

	 	(if (< ?cf2 0.4) then
	 		(printout t "It is unknown if it will rain tomorrow" crlf))
	

(defrule rule-5
	(today dry)
	(temperature warm)
	=>
	(assert (tomorrow rain) CF 0.65)
)

(defrule rule-6
	(today dry)
	(temperature warm)
	(sky overcast)
	=>
	(assert (tomorrow rain)  CF 0.55)
)