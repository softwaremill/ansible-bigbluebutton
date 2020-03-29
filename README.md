# Ansible BigBlueButton Installation Role

Ansible role to install [_BigBlueButton_](https://www.bigbluebutton.org) web conferencing platform with SSL support out of the box using [_LetsEncrypt_](https://letsencrypt.org/).

The role follows _BigBlueButton_ official [installation instructions](http://docs.bigbluebutton.org/install/install.html).

Forked from [softwaremill/ansible-bigbluebutton](https://github.com/softwaremill/ansible-bigbluebutton), as it seems abandoned. Itr has the following additional features:

## Features
  * Installs latest stable version (currently _2.2_).
  * Installation behind a firewall (NAT setup support)
  * Automatic SSL configuration using _LetsEncrypt_ certificates using [thefinn93/ansible-letsencrypt](https://github.com/thefinn93/ansible-letsencrypt) role.
  * Optionally installs the demo and check packages.

## Supported Platforms
As this role follows the official installation instructions, the supported OS version is the one specified there: Ubuntu (16.04 for the current bbb version).

Requires Ansible >= 2.4.0

## Usage

To get up _BigBlueButton_ up and running the following variables can be configured:

  * _bbb_server_name_:  Set the FQDN hosntame that points to the server where _BigBlueButton_ is going to be installed. This is the only mandatory value, the playbook will fail if this variable is not defined.
  * _bbb_configure_nat_: Configure NAT support for servers behind a firewall (Default: False).
  * _bbb_configure_ssl_: Configure SSL support using _LetsEncrypt_ certificates (Default: False).
  * _bbb_ssl_email_: Set _LetsEncrypt_ authorization email address.
  * _bbb_install_demo_: Install the bbb-demo package, useful to easily test the new installation is working (Default: False).
  * _bbb_install_check_: Install the bbb-check package, useful to debug the new installation if having issues (Default: False).

[comment]: <> To test out _BigBlueButton_ 2.0 beta you could change the repo URL to this one (it whould work):
[comment]: <>  * bbb_apt_repo_url: 'https://ubuntu.bigbluebutton.org/xenial-200/' (Default: https://ubuntu.bigbluebutton.org/xenial-110/)


## Example Playbook

```
---
- hosts: bbb
  remote_user: ansible
  become: True
  become_user: root
  become_method: sudo
  gather_facts: True
  roles:
    - role: ansible-bigbluebutton
      bbb_server_name: bbb.example.com
      bbb_configure_nat: True
      bbb_install_demo: True
      bbb_install_check: True
      bbb_configure_ssl: True
      bbb_ssl_email: foo@bar.com

```
