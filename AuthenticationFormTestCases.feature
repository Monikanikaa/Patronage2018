Feature: User authentication and validation form

	Background:
		Given user is in authentication form screen
			And no actually logged user

	Scenario: Entering the correct login and correct password in the authentication form - positive flow
		Given Empty form
		When user enter the correct login
			And user enter the correct password
		Then user can see the account details such as: name, surname, email address, mailing address

	Scenario Outline: Entering <login> and <password> in the authentication form - negative flow
		Given Empty form
		When user enter <login>
			And user enter <password>
		Then "Authentication failed. Login or password are incorrect" message should be displayed
		Examples:
			|	login	|	password|
			|	correct	|	wrong	|
			|	wrong	|	wrong	|
			|	correct	|	none	|
			|	none	|	none	|
			|	none	|	any		|

	Scenario Outline: Entering incomplete login - negative flow
		Given Empty form
		When user enter the login <at>
			And user enter <domain name>
		Then some relevant error message should be displayed
		Examples:
			|	at		|	domain name (d/n)	|
			|without @	|	without fully d/n	|
			|with @		|	without fully d/n	|
			|without @	|	with fully d/n		|

	Scenario: Entering login longer than 60 characters in the authentication form - negative flow
		Given Empty form
		When user enter the login longer than 60 characters
		Then some relevant error message should be displayed

	Scenario Outline: Entering the <login length> in the authentication form - positive flow
		Given Empty form
		When user enter <login length>
		Then user can see the account details
		Examples:
		|	login length	|
		|	<59 characters	|
		|	59 characters	|
		|	60 characters	|
