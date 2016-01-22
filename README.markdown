[![Build
Status](https://travis-ci.org/code-management/netrc.svg?branch=master)](https://travis-ci.org/code-management/netrc)


#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Dependencies](#dependencies)
7. [Contributors](#contributors)

## Overview

Puppet module for the deployment of GNU `.netrc` files. Supports Puppet3 & Puppet4

## Module Description

This module provides an easy way to manage and deploy machine credentials to user specific `.netrc` files. 

## Usage

```
class { 'netrc':
   user => 'myuser',
   path => '/home/myuser/.netrc',
}

netrc::machine { 'ftp.foo.com':
   netrc_path => '/home/myuser/.netrc',
   login      => 'remote_user',
   password   => 'hunter5',
}
```

## Reference

### Classes

#### Public Classes

* `netrc`: Top level configuration of `.netrc` file

##### Parameters
The following parameters are available in `netrc`:

###### `user`
*Required* Owner of the `.netrc` file to be created


###### `path`
*Required* Absolute path of the `.netrc` file to be created. 


###### `group`
Group of the `.netrc` file to be created. Defaults to `$user`

#### Public Classes
The `netrc` module has no private classes.

#### Types

##### `netrc::machine`
Represents the login details for a single machine entry in a `.netrc` file

##### Parameters
###### `machine`
*Required* Remote machine which the credentials are for. Default: $name

###### `netrc_path`
*Required* Absolute path to the `.netrc` file in which to store these credentials. Must be the same as that defined in the `netrc` resource

###### `login`
*Required* Username on remote machine

###### `password`
*Required* Password on remote machine

## Limitations
* Supports only one `.netrc` file per machine

## Dependencies
`netrc` module depends on the following

* [puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
* [puppetlabs-concat](https://github.com/puppetlabs/puppetlabs-concat)

## Contributors

List of contributors can be found at: [https://github.com/code-management/netrc/graphs/contributors](https://github.com/code-management/netrc/graphs/contributors)
