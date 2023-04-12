
activityHoursSpent(sacar_al_perro, 199). 
activityHoursSpent(leer, 100).
activityHoursSpent(dormir, 100).
activities(spuertaf, 100, 120, 130).

%Determinar si la actividad es una tarea%
isTask(ACTIVITY):-
    % 'ACTIVITY': Nombre de la actividad
    % 'HOURS_SPENT': Sumatoria de todas las horas que se ha demorado haciendo la actividad
    activityHoursSpent(ACTIVITY,HOURS_SPENT), HOURS_SPENT < 198. %Si hace la actividad por menos de n horas a la semana es un tarea%


%Determinar si una actividad es un pasatiempo%
isHobby(ACTIVITY):-
    % 'ACTIVITY': Nombre de la actividad
    % 'HOURS_SPENT': Sumatoria de todas las horas que se ha demorado haciendo la actividad
    activityHoursSpent(ACTIVITY,HOURS_SPENT), HOURS_SPENT < 198. %Si hace la actividad por mas de n horas a la semana y menos de n horas a la semana es un pasatiempo%


%Determinar si una actividad es un hábito%
isHabit(ACTIVITY):-
    % 'ACTIVITY': Nombre de la actividad
    % 'HOURS_SPENT': Sumatoria de todas las horas que se ha demorado haciendo la actividad
    activityHoursSpent(ACTIVITY,HOURS_SPENT), HOURS_SPENT > 198. %Si hace la actividad por mas de 198 horas a la semana es un hábito%


%Determinar en que seccion del dia (mañana, tarde, noche) rinde mas la persona%
%Determinar si el usuario es mas productivo en la mañana%
bestOnMorning(USER_NAME):-
    %USER_NAME : Nombre de usuario de la persona%
    %ACITIVTIES_MORNING: # de actividades que hace por la mañana el usuario en la semana%
    %ACITIVTIES_AFTERNOON: # de actividades que hace por la tarde el usuario en la semana%
    %ACITIVTIES_EVENING: # de actividades que hace por la noche el usuario en la semana%
    %Si el # de actividades que hace por la mañana es mayor a el # de actividades que hace por la tarde y por%
    %la noche es una persona activa por la mañana%
    activities(USER_NAME,ACITIVTIES_MORNING,ACITIVTIES_AFTERNOON, ACITIVTIES_EVENING), ACITIVTIES_MORNING > ACITIVTIES_AFTERNOON, ACITIVTIES_MORNING > ACITIVTIES_EVENING.


%Determinar si el usuario es mas productivo en la tarde%
bestOnAfternoon(USER_NAME):-
    %USER_NAME : Nombre de usuario de la persona%
    %ACITIVTIES_MORNING: # de actividades que hace por la mañana el usuario en la semana%
    %ACITIVTIES_AFTERNOON: # de actividades que hace por la tarde el usuario en la semana%
    %ACITIVTIES_EVENING: # de actividades que hace por la noche el usuario en la semana%
    %Si el # de actividades que hace por la tarde es mayor a el # de actividades que hace por la mañana y por%
    %la noche es una persona activa por la tarde%
    activities(USERN_NAME,ACITIVTIES_MORNING,ACITIVTIES_AFTERNOON, ACITIVTIES_EVENING), ACITIVTIES_AFTERNOON > ACITIVTIES_MORNING, ACITIVTIES_AFTERNOON > ACITIVTIES_EVENING.


%Determinar si el usuario es mas productivo en la noche%
bestOnEvening(USER_NAME):-
    %USER_NAME : Nombre de usuario de la persona%
    %ACITIVTIES_MORNING: # de actividades que hace por la mañana el usuario en la semana%
    %ACITIVTIES_AFTERNOON: # de actividades que hace por la tarde el usuario en la semana%
    %ACITIVTIES_EVENING: promedio de actividades que hace por la noche el usuario en la semana%
    %Si el # de actividades que hace por la noche es mayor a el # de actividades que hace por la mañana y por%
    %la tarde es una persona activa por la noche%
    activities(USER_NAME,ACITIVTIES_MORNING,ACITIVTIES_AFTERNOON, ACITIVTIES_EVENING),ACITIVTIES_EVENING > ACITIVTIES_MORNING, ACITIVTIES_EVENING > ACITIVTIES_AFTERNOON.


%Cronica: Alertar si el usuario no ha realizado ninguna%
%actividad en su periodo mas productivo del dia%
alertAbsence(USER_NAME, ACTIVITIES_DONE):-
    %Si el usuario no ha hecho el 30% de las actividades que normalmente hace por la mañana%
    bestOnMorning(USER_NAME), activities(USER_NAME,ACITIVTIES_MORNING,ACITIVTIES_AFTERNOON,ACITIVTIES_EVENING), ACTIVITIES_DONE < ACITIVTIES_MORNING * 0.3;
    %Si el usuario no ha hecho el 30% de las actividades que normalmente hace por la tarde%
    bestOnAfternoon(USERN_NAME), activities(USER_NAME,ACITIVTIES_MORNING,ACITIVTIES_AFTERNOON,ACITIVTIES_EVENING), ACTIVITIES_DONE < ACITIVTIES_AFTERNOON * 0.3;
    %Si el usuario no ha hecho el 30% de las actividades que normalmente hace por la noche%
    bestOnEvening(USER_NAME), activities(USER_NAME,ACITIVTIES_MORNING,ACITIVTIES_AFTERNOON,ACITIVTIES_EVENING), ACTIVITIES_DONE < ACITIVTIES_EVENING * 0.3.




