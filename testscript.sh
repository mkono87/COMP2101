# interfaceList=$(ip -o link show | awk -F': ' '{print $2}')
# ifArray=()
# for i in $interfaceList; do
# if [ $i != "lo" ]; then
# echo $i
# fi
# done


interface="ens33"
while [ $# -gt 0 ]; do
  case "$1" in
  -v | --verbose )
    verbose="yes"
    echo "Verbose logging turned on"
    ;;
  -* )
    echo "Unknown argument, exiting"
    exit
    ;;
  # Any string not starting with -
  *)
    # Check if we already set an interface
    if [ -n "$interface" ]
    then
      echo >&2 "Only one interface is allowed"
      exit 1
    fi
    interface="$1"
    ;;
  esac
  shift
done