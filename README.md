chef-solo-node Cookbook
=======================
This cookbook is intended to persist node information in the `node` data bag for `chef-solo`

Requirements
------------

#### packages
- `ohai` - chef-solo-node uses ohai to adjust your primary ip address when using `vagrant` and `virtualbox`.

Attributes
----------

#### chef-solo-node::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ohai']['plugins']['chef-solo-node']</tt></td>
    <td>String</td>
    <td>path to <tt>ohai</tt> plugin directory</td>
    <td><tt>plugins</tt></td>
  </tr>
</table>

Usage
-----
#### chef-solo-node::default

Just include `chef-solo-node` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-solo-node]"
  ]
}
```

For best results add it near the end of the run list to persist any settings modified by recipies.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: @slbmeh
