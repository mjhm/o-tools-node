# O-Tools for NodeJS repositories

[![CircleCI](https://circleci.com/gh/Originate/o-tools-node.svg?style=shield)](https://circleci.com/gh/Originate/o-tools-node)
[![Dependency Status](https://david-dm.org/Originate/o-tools-node.svg)](https://david-dm.org/Originate/o-tools-node)

> Tools for managing NodeJS repositories according to
  [Originate's guidelines](https://github.com/Originate/guide/blob/master/node_js.md).


## Installation

```
$ npm i --save-dev o-tools-node
```

* make sure your $PATH includes `./bin` and `/node_modules/.bin`

* add these scripts to the `bin` folder of your Node.JS code base
  and make them do their thing:

  <table>
    <tr>
      <th>spec</th>
      <td>runs all tests and linters</td>
    </tr>
    <tr>
      <th>build</th>
      <td>builds your project</td>
    </tr>
  </table>

* set up the CI server to automatically publish
  new releases from the `release` branch.


## Tools

* __update-check:__
  checks whether updates to your dependencies are available

  ```
  $ update-check
  ```

* __update:__
  updates all your dependencies to their latest versions.

  ```
  $ update
  ```

* __publish:__
  releases a new version to NPM

  ```
  $ publish <patch|minor|major>
  ```


## Development

see our [developer documentation](CONTRIBUTING.md)
