#!/bin/env bash
/usr/local/bin/system/startup/afterX
exec xinit-loop "$1"
