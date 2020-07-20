Major Features:
- Group invites
- Leaving groups
- Flash messaging when creating/editing fails

Updates:
- Add back buttons on each page
- Add button to view public groups on group index page
- Add form validations on every form page (login,signup,create/edit forms)
- Protect views for Users without access or not logged in
- Order groups and channels by name
- Add validation to group_users to always have at least one admin
- Delete autofill in some forms
- Creating a group creates a default general channel
- Add view members button
- Reorganize controllers into request_controller
- prevent group_users duplicates

------------------------------
DONE 7/20:
- Protect edit views from non-admins
- Public and private groups
- User join public group
- User can request to join group
- Group admin can accept join request


DONE 7/17:
- User Admin Roles in groups
    - Admins can make other admins
    - Group creators get set automatically as admin
    - Admins are only ones to see edit group
    - Admins cannot be removed from group


DONE 7/16:
- Add postgres
- Connect to Heroku
- View and Edit User profile
