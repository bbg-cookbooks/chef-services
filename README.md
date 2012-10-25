Description
===========

lets you preform a variety of actions on many services easily

Requirements
============
None

Attributes
==========
node.services = { }

Usage
=====
```
node.services = { "service_name": [ "enable" ], "another_service": [ "disable", "stop" ], "service_name_2": ["restart"]  }
```

Note setting service_name_2 to "restart" could cause a service to flap each time chef runs
