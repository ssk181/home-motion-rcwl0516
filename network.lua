function networkSuccess()
   tmr.stop(config.network.tmr_alarm_id)
   print("IP: " .. wifi.sta.getip())
   wifi.sta.eventMonStop()   
   wifi.sta.eventMonReg(wifi.STA_GOTIP, "unreg")
end

function networkFailure()
   print("Unable to connect")
   wifi.sta.eventMonStop()   
   wifi.sta.eventMonReg(wifi.STA_GOTIP, "unreg")
   return 0
end

wifi.setmode(wifi.STATION)
wifi.sta.config(config.network.ssid, config.network.password)
wifi.sta.autoconnect(1)
   
tmr.alarm(config.network.tmr_alarm_id, config.network.tmr_retry_ms, tmr.ALARM_AUTO, function() networkFailure() end)
wifi.sta.connect()
wifi.sta.eventMonReg(wifi.STA_GOTIP, function() networkSuccess() end)
wifi.sta.eventMonStart()