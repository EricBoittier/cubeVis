#  Read input from command line
if [ $# -ne 3 ]; then
    echo "Usage: $0 <espfile> <densfile> <scale-bound>"
    exit 1
fi

# Assign input parameters to variables
espfile="s#ESPFILE#${1}#g"
densfile="s#DENSFILE#${2}#g"
scalemin="s#SCALEMIN#-${3}#g"
scalemax="s#SCALEMAX#${3}#g"

echo "ESP file: $espfile"
echo "Dens file: $densfile"
echo "Scale min: $scalemin"
echo "Scale max: $scalemax"

# Format the template file cubevis-template.vmd using sed with alternative delimiter
sed -e  $espfile \
-e $densfile \
-e $scalemin \
-e $scalemax \
cubevis-template.vmd > cubevis.vmd
# Run vmd with the generated script
vmd -e cubevis.vmd
convert $1.tga $1.png

# Format the template file cubevis-template.vmd using sed with alternative delimiter
sed -e  $espfile \
-e $densfile \
-e $scalemin \
-e $scalemax \
cubevis-template-mol.vmd > cubevis.vmd
# Run vmd with the generated script
vmd -e cubevis.vmd
convert $1.mol.tga $1.mol.png

