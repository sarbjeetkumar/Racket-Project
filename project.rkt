#lang racket

;how to create a list with two number's
(define l (list 3 4 5 6 ))

;Make a another list for operands first start with three 
(define oper (list '+ '- '*))

;car funtion - car function gives the first element of the list
(car l)
;output of the car of l will be 3


;cdr function - cdr function is inbuild in racket and it
;gives the rest of the part after car.
(cdr l)
;cdr of l which is defined above will( 4 5 6 )

;cons function - The cons function actually accepts any two values, not
;just a list for the second argument. When the second argument is not empty and
;not itself produced by cons, the result prints in a special way. The two values joined with cons are
;printed between parentheses, but with a dot (i.e., a period surrounded by whitespace) in between:
(cons 1 2 )

(cons "banana" "Mango")

;value produced by cons function is not always a list . The result in genral
;is a pairs .
;cons of ( 1 2 ) will be ( 1. 2)

;combination function - Retrun a list of all combinations in the input list.
(combinations l)
;'((3 4 5 6)
 ; (4 3 5 6)
  ;(3 5 4 6)
  ;(5 3 4 6)
  ;(4 5 3 6)
  ;(5 4 3 6)

;Permutation function - Returns a list of all permutations of the input list. Note that this function works without
;inspecting the elements, and therefore it ignores repeated elements (which will result in repeated permutations).
;for Example
(permutations l)
;So the output will be diffrent combination of
;list l and there must be some of the dupicate or
;repeted combinations

;function (cartesian-product ) - gives diffrent combination of list
(cartesian-product l)
;'((3) (4) (5) (6))

;(remove-duplicates) function -> Returns a list that has all items in l, but without duplicate items, where same? determines
;whether two elements of the list are equivalent.
(remove-duplicates(cartesian-product(permutations l)))


;(flatten) Function -> Flattens an arbitrary S-expression structure of pairs into a list.
(flatten '((a) b (c (d) . e) ()))
;'(a b c d e)
;put a ' in front of list and make it in one list.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


