/* Date Me Senpai!
        Text-Based Visual Dating Simulation using Prolog

        Made by :
            Carry Me Senpai!

    Filename : list.pl
        Consists of primitive rule for list.
*/

print_dir([]).
print_dir([H|T]) :- H='..', write(''),print_dir(T).
print_dir([H|T]) :- H='.', write(''),print_dir(T).
print_dir([H|T]) :-
    \+H='..',
    \+H='.',
    write(H),
    nl,
    print_dir(T).

print_list([]) :- !,fail.
print_list([H|T]) :-
    write(H),
    nl,
    print_list(T).