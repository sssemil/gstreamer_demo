#!/bin/bash

#gst-launch-1.0 -v udpsrc port=5001 caps = "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! decodebin ! videoconvert ! autovideosink

gst-launch-1.0 tcpclientsrc port=5001 \
    ! application/x-rtp-stream,encoding-name=JPEG \
    ! rtpstreamdepay \
    ! rtpjpegdepay \
    ! jpegdec \
    ! autovideosink