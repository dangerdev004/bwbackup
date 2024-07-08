cd ~/Github
source ~/Github/.envrc
export FILENAME=.bwbackup-$(date +%m-%d-%Y-%H-%M-%S)
echo $DEVICEPASSWORD | sudo cryptsetup open /dev/nvme0n1p3 bwbackup
sudo mount /dev/mapper/bwbackup /bwbackup
source /bwbackup/.env_vars.txt
mkdir ~/.bitwarden
echo $BITPASS | bw export --output ~/.bitwarden/$FILENAME.csv
cd ~/.bitwarden
sudo zip -P "$ZIPASS" ~/.bitwarden/$FILENAME.zip $FILENAME.csv
sudo cp ~/.bitwarden/$FILENAME.zip /bwbackup/$FILENAME.zip
cp ~/.bitwarden/$FILENAME.zip ~/OneDrive/Bitwarden-Backup/$FILENAME.zip
sudo shred -uz -n5 ~/.bitwarden/$FILENAME.zip
sudo shred -uz -n5 ~/.bitwarden/$FILENAME.csv
sudo umount /bwbackup
sudo rm -rf ~/.bitwarden
sudo cryptsetup close bwbackup
cd
