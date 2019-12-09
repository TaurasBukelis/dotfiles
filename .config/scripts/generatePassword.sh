#!/bin/sh
dd if=/dev/urandom bs=3 count=2 2> /dev/null | base64
