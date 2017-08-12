motion_time = 0
motion_state = 0

function ioMotion()
    local state = gpio.read(config.io.motion_sensor_pin)
    if (state == gpio.HIGH) then
        motion_time = tmr.time()
    end

    if (motion_state == 0 and state == gpio.HIGH) then
        motion_state = 1
        gpio.write(config.io.led_pin, gpio.HIGH)
        mqttMessage(config.mqtt.topic_motion, config.mqtt.msg_on)
    elseif (motion_state == 1 and state == gpio.LOW and tmr.time() - motion_time > config.io.motion_interval_sec) then
        motion_state = 0
        gpio.write(config.io.led_pin, gpio.LOW)
        mqttMessage(config.mqtt.topic_motion, config.mqtt.msg_off)
    end
end

-- sensor
gpio.mode(config.io.motion_sensor_pin, gpio.INPUT, gpio.PULLDOWN)

-- led
gpio.mode(config.io.led_pin, gpio.OUTPUT)
gpio.write(config.io.led_pin, gpio.LOW)

tmr.alarm(config.io.tmr_motion_id, config.io.check_interval_ms, tmr.ALARM_AUTO, ioMotion)
