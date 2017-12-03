Flatiorn Store

Models
	- Users
		- Devise object
		- email & password
		- individual sessions
		- has_many carts
		- has a current cart
	- Items
		- visible without user session
		- can be added to logged in user's cart
	- Cart
		- link to checkout

Step 1

- create a User model with Devise
- give it an email and password in database <!-- automatically done with Devise -->
- build associations to carts
- build current_cart method
- create a User controller 