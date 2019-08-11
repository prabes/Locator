# Locator

## Description
This ruby command-line app takes the input of `Search Keywords` and `Radius` to search the location and it lists out all results it got from Google Maps.
It utilizes `ipify API` to get the user's location details ie, longitude & latitude.
It consumes `Google Maps API` to get the search results.   

## Usages
You are not made available with the `IPIFY API-KEY` and `Google Maps API-KEY`

1. You must create an .env file and place it on root directory.
2. You should now include the API credentials as: 
    ``` Enviroment Variables

        IPIFY_KEY=[YOUR_IPIFY_KEY]
        API_KEY=[YOUR_GOOGLE_API_KEY] ```
Run:
3. > $ ruby locator.rb

