#!/bin/bash

gst-launch-1.0 videotestsrc ! clockoverlay ! video/x-raw, width=1280, height=800, framerate=15/1 ! queue ! autovideoconvert ! x264enc tune=zerolatency bitrate=3200 speed-preset=superfast ! rtph264pay ! queue ! udpsink host=127.0.0.1 port=5000

# gst-launch-1.0 \
#         videotestsrc ! videoconvert ! videoscale ! video/x-raw,width=320,height=240 ! theoraenc ! oggmux ! tcpserversink host=127.0.0.1 port=5001