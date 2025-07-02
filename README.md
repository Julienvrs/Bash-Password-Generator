# Bash password generator

A very raw Bash password generator made when I was totally fed up with all the different coding projects I had to do at the time.

##Features 
-Generates 3 random passwords using OpenSSL
-Asks for desired password length
-Optional secure saving of the passwords (encrypted using ccrypt)

##Requirements
- 'openssl' (Usually pre-installed)
- 'ccrypt' : install with
  bash
  sudo apt install ccrypt

##Usage:
Run it by typing ./passmanv2

Then just follow the prompts.

##Output

If you choose to save, passwords will be encrypted & saved as:
passwords.txt.cpt

Decrypt with
ccrypt -d passwords.txt.cpt

/!\ WARNINGS /!\
Don't forget your encryption passphrase!
If you're easily offended by strong language... well, maybe don't open the script.


Made by Julienvrs - Powered by frustration but:
if try=true; $try; then
  echo "Success is inevitable when you try."
else
  echo "Try again."
fi
