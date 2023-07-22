fact(a).
fact(b).
fact(c).
fact(d).

% Rules (propositional implications)
rule(p, [a, b]).
rule(q, [c, d]).
rule(r, [p, q]).

% Backward chaining predicate
backward_chaining(Goal) :-
    fact(Goal).
backward_chaining(Goal) :-
    rule(Goal, Premises),
    all_true(Premises).

% Check if all premises are true
all_true([]).
all_true([H | T]) :-
    fact(H),
    all_true(T).
% Example usage
:- initialization(main).

main :-
    write('Enter the goal you want to prove: '),
    read(Goal),
    (backward_chaining(Goal) ->
        format('The goal ~w is proven to be true.~n', [Goal])  
    ;
        format('The goal ~w cannot be proven true with the available knowledge.~n', [Goal])
    ).