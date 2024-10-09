Role Name
=========

A brief description of the role goes here.

Requirements
------------

    Applied terraform configuration (https://github.com/SF-DP-org/terraform)


Role Variables
--------------

Variables described in vars/main.yml, that contains:

    host_ip # external ip of instance
    host_int_ip # internal ip of instance

    host_hostname # hostname of instance

    service_or_application_port # port on described application or service should work


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: config
           vars:
               - { master | worker | srv }: true

License
-------

BSD


