@echo off

set test_local_repo=C:\Users\ajink\Desktop\coforge cicd\coforge-eos-acceptance-test
set test_report_name=TestRunner.eos.TestRunner.txt

echo ============ synch repo ============
CD %test_local_repo%
git fetch --all
git reset --hard origin/main

echo ============ run test   =============
call mvn clean install


echo ======== check result ==============
cd %test_local_repo%\target\surfire-reports
findstr /C:"Failure: 0, Errors: 0" %test_report_name%
if %errorlevel%==0(
exit /b
)

bat bbb.bat