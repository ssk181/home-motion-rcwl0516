config = {
    network = {
        ssid         = "MyWiFiRouter",
        password     = "Password",
        tmr_alarm_id = 0,
        tmr_retry_ms = 20000
    },
    collectgarbage = {
        ticks = 10
    },
    io = {
        motion_sensor_pin   = 4,
        led_pin             = 3,
        motion_interval_sec = 60,
        check_interval_ms   = 500,
        tmr_motion_id       = 1
    },
    mqtt = {
        broker_ip      = "192.168.182.2",
        port           = 1883,
        user           = "",
        password       = "",
        keep_alive_sec = 60,
        tmr_alarm_id   = 2,
        tmr_retry_ms   = 3000,
        queue_ttl_sec  = 3600,
        queue_max_size = 50,
        topic_online   = "online",
        topic_motion   = "motion",
        topic_state_uptime     = "state/uptime",
        topic_state_memory     = "state/memory",
        topic          = "/home/iot",
        dir_in         = "in",
        dir_out        = "out",
        msg_on         = "ON",
        msg_off        = "OFF"
    }
}
