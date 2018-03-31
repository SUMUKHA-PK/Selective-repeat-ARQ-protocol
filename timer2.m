t = timer;
t.StartDelay = 3;
t.TimerFcn = @(myTimerObj, thisEvent)disp('3 seconds have elapsed');
start(t)