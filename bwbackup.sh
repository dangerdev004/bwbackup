cd ~/Github
# Sourcing environment variables stored in direnv
  source ~/Github/.envrc
# Setting up filename for .csv file
  export FILENAME=.bwbackup-$(date +%m-%d-%Y-%H-%M-%S)
# Opening the encrypted partition
  echo $DEVICEPASSWORD | sudo cryptsetup open /dev/nvme0n1p3 bwbackup
# Mounting the partition
  sudo mount /dev/mapper/bwbackup /bwbackup
# Sourcing local variables
  source /bwbackup/.env_vars.txt
# Creating temporary directory
  mkdir ~/.bitwarden
# Exporting passwords
  echo $BITPASS | bw export --output ~/.bitwarden/$FILENAME.csv
# Changing directory to temp directory
  cd ~/.bitwarden
# Compressing the file with password protection
  sudo zip -P "$ZIPASS" ~/.bitwarden/$FILENAME.zip $FILENAME.csv
# Copying the file to encrypted partition
  sudo cp ~/.bitwarden/$FILENAME.zip /bwbackup/$FILENAME.zip
# Copying the file to cloud storage
  cp ~/.bitwarden/$FILENAME.zip ~/OneDrive/Bitwarden-Backup/$FILENAME.zip
# Shredding the files
  sudo shred -uz -n5 ~/.bitwarden/$FILENAME.zip
  sudo shred -uz -n5 ~/.bitwarden/$FILENAME.csv
# Unmounting partition
  sudo umount /bwbackup
# Removing temp dir
  sudo rm -rf ~/.bitwarden
# Closing encrypted partition
  sudo cryptsetup close bwbackup
cd
