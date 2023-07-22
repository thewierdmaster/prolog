go:-
    write('What is the player\'s name?'),
    read(N),
    write('Does the player have a run rate greater than 70? (y/n)'),
    read(A),
    write('Does the player have a strike rate greater than 150? (y/n)'),
    read(B),
    (
        (A \= 'n', B \= 'n') ->
        format("~w is eligible. Congratulations!", [N])
        ;
        format("~w is not eligible.", [N])
    ).
