module.exports = (grunt) ->
  grunt.file.defaultEncoding = 'utf8'
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      compile:
        options:
          join: true
          bare: true
        files:
          '<%= pkg.name %>.js': ["src/jquery.asyncify.coffee"]
          'test/spec/<%= pkg.name %>.spec.js': ['test/spec/faker.spec.coffee']

    uglify:
      options:
        banner: "/*\n * <%= pkg.title %>\n *\n * @version <%= pkg.version %>\n * @date <%= grunt.template.today(\"mm-dd-yyyy\") %>\n * @author <%= pkg.author %>\n * @copyright <%= pkg.copyright %>\n*/\n\n"

      dist:
        files:
          "<%= pkg.name %>.min.js": ["<%= pkg.name %>.js"]

    watch:
      scripts:
        options:
          atBegin: true
          livereload: true

        files: ['Gruntfile.coffee', 'src/**/*.coffee', 'test/spec/**/*.coffee']
        tasks: ["coffee", "uglify"]

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-jasmine"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", ["coffee", "uglify"]
