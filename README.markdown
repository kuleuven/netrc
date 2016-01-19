[![Build
Status](https://travis-ci.org/code-management/netrc.svg?branch=master)](https://travis-ci.org/code-management/netrc)


#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Contributors](#contributors)

## Overview

Puppet module for the deployment of GNU `.netrc` files. Supports Puppet4 (and Puppet3 with future parser)

## Module Description

This module provides an easy way to manage and deploy machine credentials to user specific `.netrc` files. 

## Usage

The netrc module uses an array of credential hashes to populate a `.netrc` file template on a user specific basis.
These credential hashes can be supplied as parameters to the netrc module, or through a data input mechanism such as hiera, or hiera-eyaml.

---
include netrc
netrc { 'myuser':
   credentials => [
     { machine => 'myserver.com',   login => 'foobar', password => 'hunter5'},
     { machine => 'yourserver.com', login => 'alice',  password => 'bob256'}
   ],
 }
}
---

## Reference

### Classes

#### Public Classes

* `netrc`: Configures a `.netrc` file

##### Parameters
The following parameters are available in `netrc`:

###### `user`

###### `path`

###### `credentials`


## Limitations

Module is currently only tested on Ubuntu 14.04, but Debian and RHEL systems are supported. 

## Development

TODO

## Contributors

List of contributors can be found at: [https://github.com/code-management/netrc/graphs/contributors](https://github.com/code-management/netrc/graphs/contributors)
