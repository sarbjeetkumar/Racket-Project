#lang racket

;how to create a list with two number's
(define l (list 3 4 5 6 ))

;Make a another list for operands first start with three 
(define op (list '+ '+ '+ '+ '+ '- '- '- '- '- '* '* '* '* '* '/ '/ '/ '/ '/))

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
; Make it in one list.

;Creates static list of numbers and operators
(define f null)




;I got this  function from source : https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket


(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
   (printf "~a\t -> ~a~N" token stack) ; Uncomment to see workings, not recommended for long lists.
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (if (= y 0) (cons 0 s)
                                (if (= x 0) (cons 0 s)
                                    (cons (/ x y) s)))]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))


;;My understanding of this fuction is it takes a list and start adding it to a
;stack and every time it check if it a number add to stack if it is a operand perform
;the calculations according to operand , thats how its working i showed down .

;        (define a (list 1 2 3 '+ ' -))
;         > (calculate-RPN a)
;              1	 -> ()
;              2	 -> (1)
;              3	 -> (2 1)
;              +	 -> (3 2 1)
;              -	 -> (5 1)
;              '(-4)

;Above i declare a list with the 3 number and two operands and its works fine
;because it works out always a valid polish notation . When the stack is left
;with -4 only it terminates .

;(define a (list 1 2 3 '+ ' - '*))
    
;> (calculate-RPN a)
;1	 -> ()
;2	 -> (1)
;3	 -> (2 1)
;+	 -> (3 2 1)
;-	 -> (5 1)
;*	 -> (-4)

;;calculate-RPN: Cannot calculate the expression: (-4 *)

;Above i created a same list called a and pass it to calculaet RPN number and it worked 
;up until we have -4 on the stack but when we pulled * from the stack it throw error
;because it can't resolved a number and a operator ,so operand always should be 1 less than number .


;This function which calculates if the expression is in valid "Reverse polish notation"
;or not for more about reverse polish notation please check the documentation
;on wiki . Some of the code was given in the class by Professor and some i eddited
;from my side to make it working .

(define (valid-rpn? e [s 0])        ; define the function valid-rpn                                                                         
  (if(null? e)                      ; checks if the list is empty                                                          
     (if (= s 1)  #t #f)            ; checks if the stack is equal to 1                                                            
     (if(number? (car e))           ;if its a number car of e
        (valid-rpn? (cdr e) (+ s 1)); add 1 to the stack (recursion add second number to the stack)
        (if(> s 1)                  ; if the stack is greater than 1 
           (valid-rpn? (cdr e) (- s 1))#f)))) ; it takes the rest of the list and removes 1 from the stack


;To check this function i made up some dummy list
; first with the 2 number and 1 operator to see whats printing ?
;(valid-rpn? (list 1 2 +))
;#t
;above i made a valid list and it has given me #t which is true .

;Now i going to make a list which is not a valid
;(valid-rpn? (list 1 2 +  - ))
;#f
;the list above has 2 numbers and two operators so it's won't work out thats why
;it has printed a false because its not a valid expression





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;added a random fuction for random number genrator

(define (rand-func) (for ([i 1])
       (displayln (random 80))))

;to get the random number between  1 to 80.



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Define the cal func
(define (cal x t) ; x is a  list and t is a targer number given by user 
  ;if list x = 0 its skip all that code 
  (if (null? x) 0
      ;if and else 
      (cond [(valid-rpn? (car x))
             (cond [(eqv? (car (calculate-RPN (car x))) t);eqv ? is a equals to target number 
                    (writeln (car x)) (writeln t)];write line writes on the console 
                   [else (cal (cdr x) t)])];it moves to next list of number its not valid 
            [else (cal (cdr x) t)])));two conditions



;l is the list , ( s is a new stack and you put 2 into it ) and g is empty list
(define (mklist l (s 2) (g null));
  ;like if condition is s less than or equal to length of l
  (cond ((<= s (length l))
         ;making all combinatoins of l and puting the operator and appending to when you have all the combinations number of combination depends on size of s
         (mklist l (+ s 1)
                 (append g (cartesian-product (combinations l s) (remove-duplicates(combinations op (- s 1)))))))
        (else  g)));when is s is bigger length of l it return



;l is the orignal list we create in begin t is a target number 
(define (rpn l t)
  (set! f (mklist l)) (makep f t));set f to be make list of l ; what g will be

;;define  makep l and t is a target number 
(define (makep l t)
  (cond [(null? l) (write 'Target:) t]
      [else (cal (permutations (flatten (car l))) t)(makep (cdr l) t)]))



"For running"
"cal rpn and give numbers and target number "
"(rpn (list 2 3 6) 20)  "


