Programming Assignment 4

For this assignment you are to add persistent storage to the to-do list you created in the previous programming assignment. You may use any technique you like, but I suggest you use plists because it will be simpler. Your app should, on startup, look for a file named data.plist (or data.archive, or data.whatever if you use a different technique)  in the Documents directory of the app, and if found, populate the list with the data found there.  When the app resigns active, you should store the contents of the table (both the titles and the detail text) in persistent storage. We will test it by creating some items, then terminating the app and restarting it to see if it stored and then reloaded the data correctly. If you choose to use a plist, I suggest you organize it such that the root node is an array, and each element in the array is a dictionary with two keys, "Title" and "Detail". 

Rubric

Compiles 30

Saves to plist 35

Reads from plist 35
