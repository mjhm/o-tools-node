require! {
  'chalk' : {bold, cyan, dim, green, red}
  'child_process'
  'inquirer'
  'jsonfile'
  'semver'
  'text-stream-accumulator' : Accumulator
}

{name, version} = jsonfile.readFileSync 'package.json'

if process.argv.length != 3
  display-help!

level = process.argv[2]
display-help! if ['-h', '--help'].index-of(level) > -1

target-version = semver.inc version, level
unless target-version
  console.log "\n#{bold red 'Error:'} #{bold cyan level} #{red 'is not a valid version increment'}"
  display-help!

console.log "\nYou are about to bump #{green bold name} version #{cyan bold version} up to #{cyan bold target-version}\n"

inquirer.prompt([type: 'list', name: 'continue', message: 'Are you sure?', choices: ['yes', 'no']]).then (answer) ->
  if answer.continue == 'no'
    console.log '\nAborting ...\n'
    process.exit!

  console.log!

  # Ensure no open files
  if run("git status --porcelain", no).length then display-error 'Please commit all files before releasing'

  # Ensure on master
  if run("git rev-parse --abbrev-ref HEAD", no) isnt 'master' then display-error 'You must be on the master branch to publish'

  run "git pull"
  run "node_modules/o-tools/bin/update-check"
  run "bin/spec"
  run "npm version #{level}"
  run "git push"
  run "git push --tags"

  run 'git checkout release'
  run 'git pull'
  run 'git merge master'
  run 'git push'
  run 'git checkout master'

  console.log "\n#{green bold name} version #{cyan bold target-version} successfully released\n"



function display-header text
  process.stdout.write "#{text} ... "


function display-finish
  console.log green 'ok'

function display-error error
  console.log red "\n#{error}\n"
  process.exit 1


function display-help
  console.log "\nUsage:\n\n  #{bold 'publish <patch|minor|major>'}\n"
  process.exit 1


# Runs the given command and returns
function run(command, output = yes)
  console.log bold command if output
  try
    result = child_process.exec-sync("#{command} 2>&1").to-string!.trim!
  catch
    console.log red e.stdout.to-string!.trim!
    display-error "command #{bold command} failed"
  console.log dim "#{result}\n" if output
  result
