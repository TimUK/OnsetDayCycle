currenttime=0
cycletimer = false
timerinterval = false

AddEvent("OnPackageStart",function()
    CallRemoteEvent("DayCycle_OnJoin")
    
end)


function timetick()
    
    currenttime=currenttime+0.05
    if(currenttime>=24)then
        currenttime = 0
    end
    SetTime(currenttime)
end

AddRemoteEvent("DayCycle_TimeSync",function(time,interval)
    if(cycletimer==false)then
        cycletimer = CreateTimer(timetick,interval)
        AddPlayerChat("added timer")
    end
    AddPlayerChat("old time was "..currenttime)
    currenttime = time
    AddPlayerChat("sync time is "..time)
    timerinterval=interval
end)