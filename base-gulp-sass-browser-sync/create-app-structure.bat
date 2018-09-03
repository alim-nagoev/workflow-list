@echo off

md src\images src\scripts src\stylesheets src\sass 
echo.>"src\index.html"  

echo ^<!DOCTYPE html^> >>src\index.html
echo ^<html lang="en"^> >>src\index.html
echo ^<head^> >>src\index.html
	echo ^<meta charset="UTF-8"^> >>src\index.html
	echo ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >>src\index.html
	echo ^<meta http-equiv="X-UA-Compatible" content="ie=edge"^> >>src\index.html
	echo ^<link rel="stylesheet" href="stylesheets/common.css"^> >>src\index.html
	echo ^<title^>Document^</title^> >>src\index.html
echo ^</head^> >>src\index.html
echo ^<body^> >>src\index.html
	echo ^<h1^>Get Started^</h1^> >>src\index.html
echo ^</body^> >>src\index.html
echo ^</html^> >>src\index.html

echo.>"src\sass\common.scss"  

echo body { >> src\sass\common.scss
	echo height: 100vh; >> src\sass\common.scss
	echo background-color: #222222; >> src\sass\common.scss
	echo color: #ffffff; >> src\sass\common.scss
	echo font-family: sans-serif; >> src\sass\common.scss
	echo display: flex; >> src\sass\common.scss
	echo justify-content: center; >> src\sass\common.scss
	echo align-items: center; >> src\sass\common.scss
echo } >> src\sass\common.scss

echo.>"src\scripts\common.js"
echo.>"package.json"

echo { >> package.json
  echo "name": "app-build", >> package.json
  echo "version": "1.0.0", >> package.json
  echo "description": "", >> package.json
  echo "main": "gulpfile.js", >> package.json
  echo "scripts": { >> package.json
    echo "test": "echo \"Error: no test specified\" && exit 1" >> package.json
  echo }, >> package.json
  echo "author": "", >> package.json
  echo "license": "ISC", >> package.json
  echo "devDependencies": { >> package.json
    echo "browser-sync": "^2.24.7", >> package.json
    echo "gulp": "^3.9.1", >> package.json
    echo "gulp-sass": "^4.0.1" >> package.json
  echo } >> package.json
echo } >> package.json


echo.>"gulpfile.js"

 echo const gulp = require('gulp'); >> gulpfile.js
 echo const sass = require('gulp-sass'); >> gulpfile.js
 echo const browserSync = require('browser-sync').create(); >> gulpfile.js
 echo // compile sass file to css  >> gulpfile.js
 echo gulp.task('sass', function () { >> gulpfile.js
 	echo return gulp.src('src/sass/**/*.scss') >> gulpfile.js
 		echo // sass  >> gulpfile.js
 		echo .pipe(sass().on('error', sass.logError)) >> gulpfile.js
 		echo // dest result files  >> gulpfile.js
 		echo .pipe(gulp.dest('src/stylesheets')) >> gulpfile.js
 		echo // browser sync  >> gulpfile.js
 		echo .pipe(browserSync.reload({stream: true})) >> gulpfile.js
 echo }); >> gulpfile.js
 echo // the working directory  >> gulpfile.js
 echo gulp.task('browser-sync', ['sass'], function () { >> gulpfile.js
 	echo browserSync.init({server: {baseDir: "src"}}); >> gulpfile.js
 echo }); >> gulpfile.js
 echo // Watch files comiling  >> gulpfile.js
 echo gulp.task('watch', function () { >> gulpfile.js
 	echo gulp.watch('src/sass/**/*.scss', ['sass']); >> gulpfile.js
 	echo gulp.watch('src/*.html').on('change', browserSync.reload); >> gulpfile.js
 	echo gulp.watch('src/scripts/**/*.js').on('change', browserSync.reload); >> gulpfile.js
 echo }); >> gulpfile.js
 echo gulp.task('default', ['watch', 'browser-sync']); >> gulpfile.js


npm i