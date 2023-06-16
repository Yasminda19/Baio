#!/bin/bash


take_photo ()
{
  termux-camera-photo $1
}

upload_photo ()
{
  path=$1
  curl http://192.168.1.40:5000/api/v1/sensors/0x331E1882e0FC0fa68fF8b42cB684b77638D6941C/live.jpeg \
    -X POST -F "photo=@$path;type=image/jpeg"
}

take_photo out.jpeg
upload_photo out.jpeg
