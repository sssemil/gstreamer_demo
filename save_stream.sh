#!/bin/bash

#gst-launch-1.0 -v udpsrc port=5000 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! avimux ! filesink location=/tmp/test.avi

gst-launch-1.0 -e -v udpsrc port=5000 ! application/x-rtp, clock-rate=90000, encoding-name=H264, payload=96 ! rtpjitterbuffer ! rtph264depay ! mpegtsmux ! filesink location=/tmp/stream.ts