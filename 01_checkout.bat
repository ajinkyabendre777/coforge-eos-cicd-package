@echo off

set home=C:\CICD\coforge-eos-cicd-package

echo ============ synch repo ============
CD %home%
git fetch --all
git reset --hard origin/master
