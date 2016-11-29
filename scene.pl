loadscenetext(Place) :-
	open_file('res/scenetext.cml',read,Text),
	read(Text,Res),
	scenetext(Place,Res),
	close(Text).

scenetext(Place,Res) :-
	Res = [A|B],
	A = [H,T],
	(H == Place ->
		write(T),nl,!
	;
		scenetext(Place,B)
	).
	
