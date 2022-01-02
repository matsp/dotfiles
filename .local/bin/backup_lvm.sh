## SCRIPT
USB=$1
DATE=$(date +"%Y-%m-%d")
PREFIX=backup
VGGROUP=arch
PARTITIONS=("root" "home")
IGNORE_FILE=backup.ignore
TMP_DIRS=("/tmp" "/var/tmp" "/usr/src/tmp")
FILEAGE=+7
## END SCRIPT

if [ ! -d "$USB" ]; then
  echo "The path "$USB" does not exist. Please check..."
  exit 1
fi

if ! [ $(id -u) = 0 ]; then
  echo "The script must be run with root privileges..."
  exit 1
fi


## CLEAN (optional)
echo "Cleaning system packages and caches..."
yay -Sccq --noconfirm >/dev/null 2>&1
rm -rf ~/.local/share/Trash/* >/dev/null 2>&1
#echo "Finished system cleanup!"

echo "Cleaning temp dirs..."
for DIR in "${TMP_DIRS[@]}"
do
  /usr/bin/find $DIR -depth -type f -a -ctime $FILEAGE -print -delete >/dev/null 2>&1
  /usr/bin/find $DIR -depth -type s -a -ctime $FILEAGE -a -size 0 -print -delete >/dev/null 2>&1
  /usr/bin/find $DIR -depth -type l -a -ctime $FILEAGE -print -delete >/dev/null 2>&1
  /usr/bin/find $DIR -depth -type f -a -empty -print -delete >/dev/null 2>&1
  /usr/bin/find $DIR -depth -mindepth 1 -type d -a -empty -a ! -name 'lost+found' -print -delete > /dev/null 2>&1
done
#echo "Finished cleaning!"

echo "Cleaning user tools..."
# TODO: check if docker or podman command is available
podman system prune -a --volumes -f >/dev/null 2>&1


## MAIN
for VOLUME in "${PARTITIONS[@]}"
do
  umount /dev/$VGGROUP/lv_"$VOLUME"_snapshot >/dev/null 2>&1
  lvremove -f /dev/$VGGROUP/lv_"$VOLUME"_snapshot >/dev/null 2>&1 
  lvcreate -L10G -s -n /dev/$VGGROUP/lv_"$VOLUME"_snapshot /dev/$VGGROUP/"$VOLUME" >/dev/null 2>&1
  mkdir -p /mnt/lv_"$VOLUME"_snapshot >/dev/null 2>&1
  mount /dev/$VGGROUP/lv_"$VOLUME"_snapshot /mnt/lv_"$VOLUME"_snapshot >/dev/null 2>&1
  echo "Starting backup for "$VGGROUP"/"$VOLUME"..."
  tar --exclude-tag-all=$IGNORE_FILE -c /mnt/lv_"$VOLUME"_snapshot/ | pigz --fast > $USB/"$VOLUME"_"$PREFIX"_$DATE.tar.gz
  echo "Finished "$VGGROUP"/"$VOLUME"!"
  umount /dev/$VGGROUP/lv_"$VOLUME"_snapshot >/dev/null 2>&1
  rmdir /mnt/lv_"$VOLUME"_snapshot >/dev/null 2>&1
  lvremove -f /dev/$VGGROUP/lv_"$VOLUME"_snapshot >/dev/null 2>&1
done


## FINAL
exit

