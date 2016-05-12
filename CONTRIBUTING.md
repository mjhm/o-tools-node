# O-Tools Developer Guidelines

## Install

* `setup`
* add `./bin/` to your PATH


## Update

You can't run the o-tool `update` command here,
so run `david` directly.

```
$ david
```


## Deploy a new version

You can't use the built-in `publish` script,
so do this manually:

```
david
npm version <patch|minor|major>
git checkout release
git pull
git merge master
git push
git checkout master
```
