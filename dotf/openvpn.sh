#!/bin/bash
sudo sh -c "cat /etc/resolv.conf.bak>/etc/resolv.conf"
sudo openvpn --config ./.cert/us-texas.ovpn
sudo sh -c "cat /etc/resolv.conf.bak2>/etc/resolv.conf"
