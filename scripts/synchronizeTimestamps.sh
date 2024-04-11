#!/bin/bash
# ##################################################################################################
# MIT License
#
# Copyright (c) 2023 DanOrta
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ##################################################################################################
# File: synchronizeTimestamps.sh
# Description: This is a colletction of scripts "commented-out" because they are very specific to
# my computer and I haven't found a way to separete them. Use them with precaution, because it
# could potentially delete files and/or folders! Always make sure to create backups.
# ##################################################################################################

# SCRIPT TO SYNCHRONIZE TIMESTAMPS IN FILES:

#FILES_TO_UPDATE=".../" # DON'T FORGET TO ADD A SLASH AT THE END OF THE PATH!
#FILES_TO_GET_INFO_FROM=".../" # DON'T FORGET TO ADD A SLASH AT THE END OF THE PATH!

# Use find to locate files to update, and process them one by one
#find "$FILES_TO_UPDATE" -type f -print0 | while IFS= read -r -d '' file; do
#	relative_path="${file#$FILES_TO_UPDATE}"  # Get the relative path from the source directory
#	reference_file="${FILES_TO_GET_INFO_FROM}${relative_path}"

#	if [ -e "$reference_file" ]; then
#		touch --reference="$reference_file" "$file"
#		echo "$file"
#	fi
#done

# ##################################################################################################
# SCRIPT TO TIMESTAMP FOLDERS
#
#TARGET_DIRECTORY=".../"# DON'T FORGET TO ADD A SLASH AT THE END OF THE PATH!
#REFERENCE_DIRECTORY=".../"# DON'T FORGET TO ADD A SLASH AT THE END OF THE PATH!

# Use find to locate directories to update, and process them one by one
#find "$TARGET_DIRECTORY" -type d -print0 | while IFS= read -r -d '' directory; do
# 	Get the corresponding path in the reference directory#
#	reference_directory="${REFERENCE_DIRECTORY}${directory#$TARGET_DIRECTORY}"  
   
#	if [ -d "$reference_directory" ]; then
		# If the reference directory exists, update the timestamp
#		touch --reference="$reference_directory" "$directory"
#		echo "$directory"
#	fi
#done

# ##################################################################################################
# Script to "sync" folders (even between servers):
#
# REFERENCE_FOLDER=".../" # DON'T FORGET TO ADD A SLASH AT THE END OF THE PATH!
# DESTINATION_FOLDER=".../"
# rsync -a --progress -t -U --ignore-existing --delete $REFERENCE_FOLDER $DESTINATION_FOLDER
