First Time Setup
================

If you are logging in to a fresh database:
------------------------------------------

1. Log in as `root@localhost` with password `rootpassword`
2. Go to _Users_ > _Add_ and create an admin user for yourself. Be sure to UNCHECK the “Invite User” checkbox. You likely do not have email sending set up on your dev box.
3. Now edit that user and set a password. Save your change.
3. Log out, then log in as yourself.
4. Go to _Users_ > _List_ and delete the original `root@localhost`.

If you are logging into a production database image:
----------------------------------------------------

Just log in as yourself — assuming you are an admin in the production database. If not, you may have to do something like the following (replacing your email address) to give yourself admin rights.

```
./bin/rails c
u = Admin.find_by(email: 'username@example.com')
u.roles << Role.find_by(name: 'admin')
u.save
Ctrl-D
```

Now What?
---------

Create some cities, some local GC users, and some events. Note the different views and editing abilities of events based on whether you are logged in as an admin or a local GC member.

For more on the security model and data model, please read [`data_model.md`](data_model.md).
