#!/bin/bash

#gst-launch-1.0 -v udpsrc port=5000 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! video/x-raw, width=1280, height=800, framerate=15/1 ! queue ! autovideoconvert ! x264enc tune=zerolatency bitrate=3200 speed-preset=superfast ! rtph264pay ! queue ! udpsink host=127.0.0.1 port=5001

#gst-launch-1.0 -v udpsrc port=5000 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! video/x-raw, width=1280, height=800, framerate=15/1 ! theoraenc ! oggmux ! udpsink host=127.0.0.1 port=5001

#gst-launch-1.0 -v udpsrc port=5000 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! video/x-raw, width=1280, height=800, framerate=15/1 ! theoraenc ! oggmux ! udpsink host=127.0.0.1 port=5001


gst-launch-1.0 -v udpsrc port=5000 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" \
    ! rtph264depay ! decodebin \
    ! videoconvert ! video/x-raw,format=I420 \
    ! x264enc ! mpegtsmux ! hlssink playlist-root=http://192.168.178.20/stream/ location=/srv/http/stream/hlssink.%05d.ts playlist-location=/srv/http/stream/playlist.m3u8 target-duration=5

exit 

gst-launch-1.0 videotestsrc is-live=true ! x264enc ! mpegtsmux ! hlssink playlist-root=http://192.168.178.20/stream/ location=/srv/http/stream/hlssink.%05d.ts playlist-location=/srv/http/stream/playlist.m3u8

exit

gst-launch-1.0 videotestsrc is-live=true ! x264enc ! mpegtsmux ! hlssink max-files=5 playlist-root=http://localhost/ location=/srv/http/stream/hlssink playlist-location=/srv/http/stream/hlssink


gst-launch-1.0 -v udpsrc port=5000 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" \
    ! rtph264depay ! decodebin \
    ! videoconvert ! video/x-raw,format=I420 \
    ! jpegenc \
    ! rtpjpegpay \
    ! rtpstreampay \
    ! tcpserversink port=5001
