go :- hypothesize(Car),
      write('I guess that the car is: '),
      write(Car),
      nl,
      undo,!.

/* hypotheses to be tested */
hypothesize(nissan)         :- nissan, !.
hypothesize(mazda)          :- mazda, !.
hypothesize(honda)          :- honda, !.
hypothesize(chrysler)       :- chrysler, !.
hypothesize(ford)           :- ford, !.
hypothesize(chevrolet)      :- chevrolet, !.
hypothesize(fiat)           :- fiat, !.
hypothesize(ferrari)        :- ferrari, !.
hypothesize(lamborghini)    :- lamborghini, !.
hypothesize(volvo)          :- volvo, !.
hypothesize(koenigsegg)     :- koenigsegg, !.
hypothesize(bmw)            :- bmw, !.
hypothesize(audi)           :- audi, !.
hypothesize(mercedes)       :- mercedes, !.
hypothesize(unknown).


nissan      :- asian, verify(one_model_is_nicknamed_godzilla).
mazda       :- asian, verify(has_winged_logo).
honda       :- asian, verify(uses_vtec_engines).
chrysler    :- american, verify(has_5star_logo).
ford        :- american, verify(first_used_assembly_lines).
chevrolet   :- american, verify(has_a_Corvette_model).
fiat        :- italian, verify(produces_relatively_cheap_cars).
ferrari     :- italian, verify(has_a_horse_logo).
lamborghini :- italian, verify(has_a_bull_logo).
volvo       :- swedish, verify(produces_cars_as_well_as_trucks).
koenigsegg  :- swedish, verify(produces_hypercars).
bmw         :- german, verify(uses_inline6_engines).
mercedes    :- german, verify(contains_name_of_a_woman).
audi        :- german, verify(four_circles_logo).

/* classification rules */

european    :- verify(is_an_european_manufacturer).
asian       :- verify(is_an_asian_manufacturer).
american    :- verify(is_an_american_manufacturer).
german      :- european, verify(is_german).
swedish     :- european, verify(is_swedish).
italian     :- european, verify(is_italian).


/* how to ask questions */
ask(Question) :- write('Does the car have the following attribute: '), write(Question), write('? '),
    read(Response), nl,
    ( (Response == yes ; Response == y) ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(S))).

/* undo all yes_no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.