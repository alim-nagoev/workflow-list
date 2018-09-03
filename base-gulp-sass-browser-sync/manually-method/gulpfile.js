
const gulp = require('gulp'); 
const sass = require('gulp-sass'); 
const browserSync = require('browser-sync').create(); 
// compile sass file to css  
gulp.task('sass', function () { 
return gulp.src('src/sass/**/*.scss') 
// sass  
.pipe(sass().on('error', sass.logError)) 
// dest result files  
.pipe(gulp.dest('src/stylesheets')) 
// browser sync  
.pipe(browserSync.reload({stream: true})) 
}); 
// the working directory  
gulp.task('browser-sync', ['sass'], function () { 
browserSync.init({server: {baseDir: "src"}}); 
}); 
// Watch files comiling  
gulp.task('watch', function () { 
gulp.watch('src/sass/**/*.scss', ['sass']); 
gulp.watch('src/*.html').on('change', browserSync.reload); 
gulp.watch('src/scripts/**/*.js').on('change', browserSync.reload); 
}); 
gulp.task('default', ['watch', 'browser-sync']); 
