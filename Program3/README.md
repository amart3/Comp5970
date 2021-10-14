Programming Assignment 3

For this assignment, create a master-detail app for keeping track of to-do items. You may choose how you implement the master and detail controllers and the segues between them, but the app should work as described:

On startup, an empty list in a table view is displayed.  When there are items in this list, they show the title of the to-do item,  g. “Get groceries”. The title is a short phrase.
There is an add button above the table view, which when pressed takes the user to a detail screen that shows the title at the top in a text field, in bold, in large font. The default, initial title should be “New Item”. Below the title is a UITextView (multi-line) in which details of the to-do item can be written (e.g the groceries to buy). The default text in that field should be empty.
At the top are buttons for “cancel” which returns to the table view screen without adding the new to-do item, and “save” which returns to the table view screen after adding the new item (remember, only the title is shown in the table view).
If you select an item from the table view, it should go to the detail screen described in step 2, but pre-fill the title and details with the existing info from that row in the table view.
 

Rubric

Compiles: 30 points

Tableview displays: 10 points

Add button transitions to detail view: 10  points

Select row transitions to detail view: 10 points

“Save” functions properly in detail view: 20 points

“Cancel” functions properly in detail view: 10 points

 

Extra Credit

For 20 points extra credit, implement buttons on the table view screen for “edit” (redorder the rows) and “delete” (remove row from the table view)
