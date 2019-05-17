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
    - a User signs up with email and username; both are validated for uniqueness, with accompanying flash messages for duplicates
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - a Lawyer can be created
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - duplicate username, email, or lawyer names & incorrect login display flash messages about problem
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
