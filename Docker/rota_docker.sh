# ROTA DOCKER IMAGE

function Help
{
   # Displays Help
   echo "This script download a Docker Image with:"
   echo "- Ubuntu 18.04 LTS"
   echo "- ROS Melodic"
   echo "   - ROS Calibration package"
   echo "- CUDA 11.5"
   echo "- Python 3.6.9" 
   echo
   echo "Syntax: rota_image.sh [-h]"
   echo "Options:"
   echo "-h     Help function"
   echo
   echo "EXAMPLE:"
   echo "bash rota_image.sh -h   (Help function)"
   echo "bash rota_image.sh      (Install CUDA)"
   echo
}

#Take the flags
while getopts "h" flag
do
    case "${flag}" in
        h) 
         Help
         exit
        ;;
        \?)
         echo "Error: Invalid option"
         exit
         ;;
    esac
done

echo "DOWNLOADING ROTA IMAGE"
echo

docker pull natanvitorino/rosbrain-v1:latest
