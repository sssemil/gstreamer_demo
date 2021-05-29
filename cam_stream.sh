#!/bin/bash

gst-launch-1.0 v4l2src device="/dev/video0" ! clockoverlay ! queue ! autovideoconvert ! x264enc tune=zerolatency bitrate=3200 speed-preset=superfast ! rtph264pay ! queue ! udpsink host=127.0.0.1 port=5000

# gst-launch-1.0 \
#         videotestsrc ! videoconvert ! videoscale ! video/x-raw,width=320,height=240 ! theoraenc ! oggmux ! tcpserversink host=127.0.0.1 port=5001