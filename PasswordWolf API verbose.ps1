# This script uses the PasswordWolf API to generate random passwords.
# It was written by ChatGPT and CabeoC.
# https://chatgpt.com/share/6776c704-c248-8003-af78-103d8f899642

# Initialize Default Variables
$baseUrl = "https://passwordwolf.com/api/?phonetic=off"
$length = 20
$repeat = 1

# Menu
Write-Host "Random Password Generator"
Write-Host "‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"
Write-Host "Password Length:    $length"
Write-Host "How Many Passwords: $repeat"
Write-Host "───`n"
Write-Host "1. Set password length."
Write-Host "2. Set number of passwords to generate"
Write-Host "Hit Enter to start."
Write-Host "──────────────────────"

# User Input
$continueMenu = $true # loop flag

while ($continueMenu) { # loop if flag is true
    $menuChoice = Read-Host "Enter Option" # Prompt user

    # Handle menu options
    switch ($menuChoice) {
        "1" { # if option 1
            $lengthInput = Read-Host "Enter password length"
            if ($lengthInput -match '^\d+$') {
                $length = [int]$lengthInput
            } else {
                Write-Host "Invalid input. Using default length: $length."
            } # end if
            Write-Host "───"
            Write-Host "Password Length:    $length"
            Write-Host "How Many Passwords: $repeat"
            Write-Host "───"
        } # end 1
        "2" { # if option 2
            $repeatInput = Read-Host "Enter number of passwords"
            if ($repeatInput -match '^\d+$') {
                $repeat = [int]$repeatInput
            } else {
                Write-Host "Invalid input. Using default repeat: $repeat."
            } # end if
            Write-Host "───"
            Write-Host "Password Length:    $length"
            Write-Host "How Many Passwords: $repeat"
            Write-Host "───"
        } # end 2
        default {
            $continueMenu = $false  # Trigger flag for any other input
            echo `n
        } # end default
    } # end switch
} # end loop

# Run API URL
(Invoke-RestMethod -Uri "$baseUrl&length=$length&repeat=$repeat" -Method Get).password
