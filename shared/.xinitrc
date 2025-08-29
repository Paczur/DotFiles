#!/bin/env bash
/home/paczur/Scripts/system/startup/afterX
exec xinit-loop "$1"
