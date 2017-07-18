# Installation
	
	docker pull sath89/grav

# QuickStart

	docker run -itd -p 8080:80 -v grav:/var/www/grav sath89/grav

# Start specific branch/tag

	docker run -itd -p 8080:80 -v grav:/var/www/grav -e BRANCH=tags/1.3.0 sath89/grav

### Information

All of user data and codebase are located at grav volume that mounted to the /var/www/grav
Initial installation include admin plugin that allows you to manage grav via http://localhost:8080/admin
