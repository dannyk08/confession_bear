Work is still in progress... Actual app files are inside the confession_bear directory

This is the confession bear site for people who have something to say in the safety of anonymity. A user can log in safely, make a confession of something they're embarrased about and have never had the courage to tell anyone.

With this app a user can safely write down a diary of all their secrets. Be it intimate, embarrasing, funny, harsh, whatever the nature of the confession, a user will be able to confess it all. Other users will be able to comment on these confessions without ever knowing who made that confession.
	The only catch is that the user making the comment will be have their username displayed
	As the user receives comments from their fellow confession bears, their comment count will increase and apply those "points into the account"
	A user will be able to like and dislike a confession
		The confession will have specific glyphicons that represent the likes/dislikes count

### With this app
	> A user can do the following:

		Register for an account
		Login/Logout
		Delete their account if they desire
		Edit their profile
		Upload a profile image.. heroku functionality still in progress
		Make a confession with a title and story
		Conditionals for editing and deleting are in place
			A user can only edit their confession if it's less than 20 characters in length
			A user can onlu delete their confession if it follows the conditions set on editing
		A user can view their confession on various pages
			In their profile
			In their confessions' feed
			In their edit page

		<!-- still in progress -->
		A user can make a comment on a confession
		A user can edit a confession
		A user can like/dislike a confession
		A user can delete their comment on a confession

			> Twitter API
				A user can share another user's confession via a shortlink to that confession
					Catch: A user must be logged in, else, the user will be redirected to the signup page
				If a user shares a confession, the action will trigger a method that will increase the share count in the confessor's profile
				only the confessor will be able to see their confession count go up

	> A user can't do the following
	
		Log in to another user's profile if they know their url extension
		Edit/Delete/Update another user's info
		Edit/Delete/Update another user's confessions or comments
		Acess a registered user's feed, personal account, without being redirected to the signup form page
		Log in with a nonexisting email and password
		Input empty strings into the the database as they complete registration
