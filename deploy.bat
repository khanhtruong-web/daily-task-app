@echo off
setlocal
REM ============================================================
REM  One-click deploy for FocusDaily App
REM  Stages all files, commits if changed, pushes to GitHub main.
REM  Vercel auto-builds from main branch.
REM ============================================================
cd /d "D:\AI App\Daily task app"

echo.
echo [1/4] Clearing any stale git lock files...
del /f /q ".git\index.lock" ".git\HEAD.lock" ".git\objects\maintenance.lock" 2>nul

echo [2/4] Staging deployable files...
git add index.html daily_task_activity_calendar_app.html sw.js manifest.json favicon.svg vercel.json .gitignore README.md deploy.bat

git diff --cached --quiet
if errorlevel 1 (
  git commit -m "release: update focusdaily app %date% %time%"
) else (
  echo        No new staged changes - will push existing commits.
)

echo [3/4] Pushing to GitHub main...
git push origin main
if errorlevel 1 (
  echo.
  echo  !! Push FAILED. Please check internet connection or GitHub auth.
  pause
  exit /b 1
)

echo [4/4] Done!
echo.
echo ============================================================
echo  Pushed successfully to GitHub!
echo  Vercel will auto-deploy the latest version in ~30 seconds.
echo ============================================================
pause
