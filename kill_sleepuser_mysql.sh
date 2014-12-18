#!/bin/bash



# Get the processlist and save it in a file
mysqladmin -u root -p"admin_password" processlist > allprocesses


#lists all the processes for the sleeping user and send the output to the "id" file
cat allprocesses | awk '{if ($4 == "insert_user_here" && $10 == "Sleep") print $2;}' > id



for sleep_id in `cat ./id`
do
  # Kill each id identified earlier.
  mysqladmin -u root -p"admin_password" KILL $sleep_id ;
done

# Remove files
rm  allprocesses
rm id
