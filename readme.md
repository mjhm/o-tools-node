# O-Tools for NodeJS repositories [![Dependency Status](https://david-dm.org/Originate/o-tools-node.svg)](https://david-dm.org/Originate/o-tools-node)

> tools to manage NodeJS repositories according to
  [Originate's guidelines](https://github.com/Originate/guide/blob/master/node_js.md).



## Installation

* make sure your $PATH includes `./bin` and `/node_modules/.bin`

* install this tool

  ```
  $ npm i --save-dev o-tools-node
  ```

* set up the CI server to automatically publish
  new releases from the `release` branch.


## Tools

### update-check

Checks whether updates to your dependencies are available.

```
$ update-check
```


### update

Updates all your dependencies to their latest versions.

```
$ update
```


### publish

To release a new version of your NPM module:

```
$ publish <patch|minor|major>
```
