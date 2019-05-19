# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    - Sinatra gem being used
- [x] Use ActiveRecord for storing information in a database
    - users, lawyers, and practice_areas stored in ActiveRecord database
- [x] Include more than one model class (e.g. User, Post, Category)
    - models are User, Lawyer, PracticeArea, and LawyerPracticeArea
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - a User has_many Lawyers
    - a PracticeArea has_many LawyerPracticeAreas
    - a PracticeArea has_many Lawyers through LawyerPracticeAreas
    - a Lawyer has_many LawyerPracticeArea
    - a Lawyer has_many PracticeAreas through LawyerPracticeAreas
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - a Lawyer belongs_to User
    - a LawyerPracticeArea belongs_to Lawyer
    - a LawyerPracticeArea belongs_to PracticeArea
- [x] Include user accounts with unique login attribute (username or email)
    - a User signs up with email, username, and password
    - email and username are validated for uniqueness, with accompanying flash messages for duplicates
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - a Lawyer can be created at /lawyers/new
    - a Lawyer can be read at /lawyers and at /lawyers/:slug
    - a Lawyer can be updated at /lawyers/:slug/edit
    - a lawyer can be updated via delete form (button) shown on /lawyers, /lawyers/:slug and users/:slug (assuming lawyer belongs to current_user)
- [x] Ensure that users can't modify content created by other users
    - the app validates that the lawyer belongs to the user in two places (flash message shows error):
        1) in views, Edit and Delete buttons only appear if the lawyer belongs to the current_user
        2) in lawyer controller, a lawyer cannot be updated/deleted unless the lawyer belongs to current_user
- [x] Include user input validations
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - in user signup (/signup): empty fields and duplicate username or email display flash messages
    - in user login (/login): incorrect login displays flash message
    - in user show page (/users/:slug): flash message if someone other than current_user tries to view page
    - in add a lawyer page (/lawyers/new): flash message if not signed in
    - in add a lawyer page (/lawyers/new): flash message if duplicate lawyer name or practice area
    - in view all lawyers page (/lawyers): flash message if user not logged in
    - in view a lawyer page (/lawyers/:slug): flash message if user not logged in
    - in lawyer edit page (/lawyers/:slug/edit): flash message if lawyer not owned by current_user
    - in lawyer edit page (/lawyers/:slug/edit): flash message if practice area already exists
    - in lawyer delete page: flash message if lawyer not owned by current_user
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
