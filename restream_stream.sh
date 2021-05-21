#!/bin/bash

gst-launch-1.0 -v udpsrc port=5000 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! video/x-raw, width=1280, height=800, framerate=15/1 ! queue ! autovideoconvert ! x264enc tune=zerolatency bitrate=3200 speed-preset=superfast ! rtph264pay ! queue ! udpsink host=127.0.0.1 port=5001
