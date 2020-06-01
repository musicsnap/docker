#!/bin/bash
if service openresty status; then
    exit 0
else
    exit 1
fi