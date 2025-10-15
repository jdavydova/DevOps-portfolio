
#!/bin/bash

echo "Update apt:"
apt update

echo "Install java:"
apt install -y default-jre

java_version=$(java -version 2>&1 | grep "version" | awk -F '"' '{print $2}' | awk -F. '{print $1}')

echo "Java Vertsion: $java_version"

if ["$java_version" == ""]
then
    echo "Java version not found"
elif ["$java_version" -lt 11]
then
    echo "Older Java version detected: $java_version (lower than 11)"
else
    echo "A java version of 11 or higher was installed: $java_version. Installation was successful!"
fi


# ==========================================================
# Explanation Section
# ==========================================================
# awk -F '"' '{print $2}'
# ----------------------------------------------------------
# Used to extract the text that is inside quotation marks (") from a line.
# Example:
#   openjdk version "17.0.11"
#   → Output: 17.0.11
#
# The -F option sets the field separator.
# Here, the separator is a double quote (").
#
# So: -F '"' means “split the line into parts wherever there’s a quote”.
# {print $2} prints the second field → text between the quotes.
# ----------------------------------------------------------

# awk -F. '{print $1}'
# ----------------------------------------------------------
# The -F option sets the field separator.
# Here, the separator is a dot (.).
#
# So: -F. means “split the line into parts wherever there is a dot”.
# {print $1} prints the first field → everything before the first dot.
#
# Example:
#   "17.0.11" → Output: 17
# ----------------------------------------------------------



