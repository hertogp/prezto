const {src, dest} = require('gulp');
const imagemin = require('gulp-imagemin');
const uglify = require('gulp-uglify');
const sass = require('gulp-sass');
const concat = require('gulp-concat');
const autoprefix = require('gulp-autoprefixer');

/* TOP LEVEL FUNCTIONS
 * - gulp.task  - define tasks
 * - gulp.src   - point to files to use
 * - gulp.dest  - point to folder to output
 * - gulp.watch - watch files and folders for changes
 *
 * Run gulp watch from root dir and off you go
 * */


// copy all HTML files

// gulp.task('copyHtml', function(){
//     gulp.src('src/*.html')
//         .pipe(gulp.dest('dist'));
// });


// copy pdf

// gulp.task('copyPdf', function() {
//     gulp.src('src/pdf/*')
//         .pipe(gulp.dest('dist/pdf'));

// });


// optimize images

// gulp.task('imageMin', () => {
//     gulp.src(['prez/pix/*.jpeg', 'prez/pix/*.png'])
//       .pipe(imagemin())
//       .pipe(gulp.dest('dst/pix'));
// });


// Compile SASS

// gulp.task('sass', function(){
//     gulp.src('prez/sass/revealjs/*.sass')
//         .pipe(sass().on('error', sass.logError))
//         .pipe(autoprefix({
//             browsers: ['last 2 versions'],
//             cascade: true
//         }))
//         .pipe(gulp.dest('dist/css'));

// });

function taskSass() {
  return src('prez/sass/revealjs/*.scss')
          .pipe(sass().on('error', sass.logError))
          .pipe(autoprefix({
            browsers: ['last 2 versions'],
            cascade: true
           }))
        .pipe(dest('dist/css/revealjs'));
}


// Minify JavaScript(s), if any

// gulp.task('minify', function(){
//     gulp.src('prez/js/*.js')
//     .pipe(concat('main.js'))
//     .pipe(uglify())
//     .pipe(gulp.dest('dist/js'))
// });


// default Task(s)

function defaultTask(cb) {
  cb();
}

// - TODO: add a clearDist command to clear dist/build folder

// gulp.task('default', ['imageMin', 'sass', 'minify']);

// gulp.task('watch', function(){
//     gulp.watch('prez/js/*.js', ['minify']);
//     gulp.watch('prez/pix/*', ['imageMin']);
//     gulp.watch('prez/sass/*.scss', ['sass']);
// });

exports.default = defaultTask
exports.sass = taskSass
