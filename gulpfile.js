const {src, dest, parallel} = require('gulp');
const gulp = require('gulp')
const imagemin = require('gulp-imagemin');
const uglify = require('gulp-uglify');
const sass = require('gulp-sass');
const concat = require('gulp-concat');
const autoprefix = require('gulp-autoprefixer');

/* TOP LEVEL FUNCTIONS
 * (warning: this is old)
 * - gulp.task  - define tasks
 * - gulp.src   - point to files to use
 * - gulp.dest  - point to folder to output
 * - gulp.watch - watch files and folders for changes
 *
 * Run gulp watch from root dir and off you go
 * */

// Optimize images -> lib

function img() {
  // optimize images
  return src(['src/pix/*.jpeg', 'src/pix/*.png'])
    .pipe(imagemin())
    .pipe(dest('lib/prezto/pix'));
}

// Copy pandoc src tpl's -> lib
function tpl() {
  return src(['src/pandoc/*.tpl'])
    .pipe(dest('lib/pandoc'));
}

function css() {
  // Compile SASS (.scss)
  return src(['src/css/*.scss'])
    .pipe(sass().on('error', sass.logError))
    .pipe(autoprefix({browsers: ['last 2 versions'], cascade: true}))
    .pipe(dest('lib/prezto/css'));
}


// Minify JavaScript(s), if any

// gulp.task('minify', function(){
//     gulp.src('prez/js/*.js')
//     .pipe(concat('main.js'))
//     .pipe(uglify())
//     .pipe(gulp.dest('dist/js'))
// });

function minjs() {
  return src(['src/js/*.js'])
    .pipe(concat('prezto.js'))
    .pipe(dest('lib/prezto/js'));
}


// default Task(s)

function generic(cb) {
  console.log('\n  to see available tasks, run:\n');
  console.log('    gulp --tasks\n');
  cb();
}

// - TODO: add a clearDist command to clear dist/build folder

// gulp.task('default', ['imageMin', 'sass', 'minify']);

// gulp.task('watch', function(){
//     gulp.watch('prez/js/*.js', ['minify']);
//     gulp.watch('prez/pix/*', ['imageMin']);
//     gulp.watch('prez/sass/*.scss', ['sass']);
// });

exports.help = generic
exports.default = parallel(img, tpl, css, minjs)
exports.css = css
exports.img = img
exports.tpl = tpl
exports.minjs = minjs
