# depeche-test
Whole node testing framework for Ansible
NB: This is obviously a work in progress.

## Rationale
There are several ways to test your Ansible playbooks.

You can use something like Molecule.  Molecule is good at testing an individual role.  It doesn't do more than one role (well, not really).  It can't use your inventory to verify that a whole set of roles have been applied properly to a "node type".

Then there's test kitchen.  Though Ansible supported was originally "bolted" on, it has improved over time.  It is a heavy ruby stack.  It requires that Ansible be installed on the remote node (because of its origins as a Chef test framework I assume).  

depeche-test will be a framework to do the following:
* take a specific "play", and test it
  * First, we make a "mirror" of an ideal node type (e.g. frontend01 becomes frontend-test)
  * Then, we limit the inventory group of the play to just the mirrored node
  * We make sure that any host defined vars are visible to the mirrored node
  * Then, we choose where the test node should be deployed to (e.g. AWS, Vagrant etc.)
  * Spin up the test node
  * Then, we run our playbook normally (e.g. Tower, Jenkins etc.)

This should mean that:
* We have to provide a minimum amount of additional code to mirror any prod node for testing
* We don't have any real significant differences between the vars defined for the prod or test node
* We use the same control server as we do for everything else, testing the entire deployment process

#
