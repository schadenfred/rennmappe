# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec feature)

## Uncomment to clear the screen before every task
# clearing :on

## Guard internally checks for changes in the Guardfile and exits.
## If you want Guard to automatically start up again, run guard in a
## shell loop, e.g.:
##
##  $ while bundle exec guard; do echo "Restarting Guard..."; done
##
## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), the you will want to move the Guardfile
## to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{app/presenters/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(scss|css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

guard :minitest, spring: "bin/rails test" do

  watch(%r{^app/models/winery.rb$})         { "test/models/wine_test.rb" }
  watch(%r{^app/models/wine.rb$})         { "test/models/winery_test.rb" }

  watch(%r{^app/(.+)\.rb$})                               { |m|
    "test/#{m[1]}_test.rb" }
  watch(%r{^app/policies/(.+)\.rb$})                      { |m|
    "test/policies/#{m[1]}_test.rb" }

  watch(%r{^app/policies/application_policy\.rb$})        { |m|
    "test/policies" }
  watch(%r{^app/controllers/application_controller\.rb$}) {
    'test/controllers' }
  watch(%r{^app/controllers/(.+)_controller\.rb$})        { |m|
    "test/integration/#{m[1]}_test.rb" }
  watch(%r{^app/views/(.+)_mailer/.+})                    { |m|
    "test/mailers/#{m[1]}_mailer_test.rb" }
  watch(%r{^lib/(.+)\.rb$})                               { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^lib/tasks/(.+)\.rake$})    { |m| "test/lib/tasks/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/integration/.+_test\.rb$})
  watch(%r{^test/policies/.+_test\.rb$})
  watch(%r{^test/test_helper\.rb$}) { 'test' }
  watch(%r{^test/factories/(.+).rb$}) { 'test' }

  # concerns
  watch(%r{^test/models/concerns/.+_test\.rb$})

  watch(%r{^app/models/concerns/(.+)\.rb$})  { |m| "test/models/concerns/#{m[1]}_test.rb" }
  end
