################################################################################
# combine_images.sh
#
# Description: Place all images in folder 1 side by side with those in folder 2.
# Description: The resultant images are saved in folder 3.
# Description: A gif animation of all combined images in folder 3 is created.
# Description: Lastly, create a PDF output document of all side by side images.
# Usage:       First input parameter is folder 1, second input is folder 2,
# Usage:       the third input is folder 3.
# Usage:       The file extension 'ext' can be manually edited in the script.
################################################################################

#!/bin/bash

echo "=== Running combine_images.sh script ==="

lhs=${1} # Images on the left
rhs=${2} # Images on the right
res=${3} # Resultant images
ext=png  # File extension

rm -rf ${res}
mkdir -p ${res}

echo "lhs: " ${lhs}
echo "rhs: " ${rhs}
echo "res: " ${res}
for i in ${lhs}/*.${ext}
do
    filename=$(basename -- "${i}")
    filename="${filename%.*}"
    convert +append ${lhs}/${filename}.${ext} ${rhs}/${filename}.${ext} ${res}/${filename}.${ext}
done

convert -delay 150 ${res}/*.* ${res}/combined_animation.gif

convert ${res}/combined_animation.gif ${res}/combined_doc.pdf
