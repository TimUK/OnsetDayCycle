DAY_LENGTH_IN_SECONDS = 60

currenttime=0
cycletimer = false
timerinterval = false

AddEvent("OnPackageStart",function()
    timerinterval = ((DAY_LENGTH_IN_SECONDS*1000) / 240) /2
    cycletimer = CreateTimer(timetick,timerinterval)
end)


AddRemoteEvent("DayCycle_OnJoin",function(p)
    CallRemoteEvent(p,"DayCycle_TimeSync",currenttime,timerinterval)
end)

function timetick()
    currenttime = currenttime+0.05
    if(currenttime>=24)then
        currenttime = 0
    end
    if(currenttime==0 or currenttime>=24 or currenttime==12) then
        for _, v in pairs(GetAllPlayers()) do
            CallRemoteEvent(v,"DayCycle_TimeSync",currenttime,timerinterval)
        end
    end
end