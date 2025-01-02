# This script uses the PasswordWolf API to generate random passwords.
(Invoke-RestMethod -Uri "https://passwordwolf.com/api/?phonetic=off&length=20&repeat=1" -Method Get).password