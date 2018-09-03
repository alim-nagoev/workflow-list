 //переменные 
 const gulp = require('gulp');
 const sass = require('gulp-sass');
 const pug = require('gulp-pug');
 const browserSync = require('browser-sync').create();
 // compile sass file to css 
 gulp.task('sass', function () {
 	return gulp.src('src/sass/**/*.scss')
 		// sass 
 		.pipe(sass().on('error', sass.logError))
 		// dest result files 
 		.pipe(gulp.dest('src/stylesheets'))
 		// browser sync 
 		.pipe(browserSync.reload({
 			stream: true
 		}))
 });
 // compile pug file to html 
 gulp.task('pug', function () {
 	return gulp.src(['src/pug/**/*.pug', '!src/pug/_include/**/*.pug'])
 		.pipe(pug({
 			pretty: true
 		}))
 		// .pipe(gulp.dest('app/pug/_blocks')) 
 		.pipe(gulp.dest('src/'))
 })
 // the working directory 
 gulp.task('browser-sync', ['sass', 'pug'], function () {
 	browserSync.init({
 		server: {
 			baseDir: "src"
 		}
 	});
 });
 // Watch files comiling 
 gulp.task('watch', function () {
 	gulp.watch('src/sass/**/*.scss', ['sass']);
 	gulp.watch('src/pug/**/*.pug', ['pug']);
 	gulp.watch("src/*.html").on('change', browserSync.reload);
 	gulp.watch("src/js/**/*.js").on('change', browserSync.reload);
 });
 gulp.task('default', ['watch', 'browser-sync']);