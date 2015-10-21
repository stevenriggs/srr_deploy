srr_deploy Cookbook
=====================
Sets up the deploy user account

Requirements
------------
An encrypted data bag named 'deploy' contained in a data bag folder called 'passwords' with the encrypted version of the generic deploy user account password

Attributes
----------
#### srr_deploy::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['srr_deploy']['user']</tt></td>
    <td>String</td>
    <td>The deploy user account name</td>
    <td><tt>'deploy'</tt></td>
  </tr>
</table>

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['srr_deploy']['uid']</tt></td>
    <td>Numeric</td>
    <td>The deploy user unique id. If it is blank, will use the next available number in the system.</td>
    <td><tt>''</tt></td>
  </tr>
</table>

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['srr_deploy']['group']</tt></td>
    <td>String</td>
    <td>The deploy group name</td>
    <td><tt>'deploy'</tt></td>
  </tr>
</table>

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['srr_deploy']['gid']</tt></td>
    <td>Numeric</td>
    <td>The deploy group unique id. If it is blank, will use the next available number in the system.</td>
    <td><tt>''</tt></td>
  </tr>
</table>

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['srr_deploy']['password_databag']</tt></td>
    <td>String</td>
    <td>The data bag name for the user password</td>
    <td><tt>'deploy'</tt></td>
  </tr>
</table>

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['srr_deploy']['user_password']</tt></td>
    <td>String</td>
    <td>The MD5 encrypted deploy user account password</td>
    <td><tt>Read from an encrypted data bag</tt></td>
  </tr>
</table>

Usage
-----
#### srr_deploy::default

## Use a wrapper cookbook ##
In your metadata.rb: add the line 'depends srr_deploy'
In your recipes/default.rb: add the line 'include_recipe srr_deploy'
In your attributes/default.rb: Override any attributes you like.

Or just include `srr_deploy` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[srr_deploy]"
  ]
}
```


License and Authors
-------------------
Authors: Steven Riggs
