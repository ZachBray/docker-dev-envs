#!/bin/bash

echo 0 | sudo tee /proc/sys/kernel/kptr_restrict
echo 1 | sudo tee /proc/sys/kernel/perf_event_paranoid
