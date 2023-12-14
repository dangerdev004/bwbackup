# bwbackup (BitWarden Backup)
This is a shell script to backup your bitwarden vault onto a cloud server & a local encrypted storage with encryption.
This script also creates different versions everytime and keeps the old one as well and it will shred the .csv file and the container at the end as well
You will need some additional setup to do this securely.

# Dependencies
  This script requires **bitwarden-cli** & **direnv** installed on your system. To install bitwarden-cli & direnv refer to **[Bitwarden CLI Installation Guide](https://bitwarden.com/help/cli/)** & **[Direnv Installation Guide](https://github.com/direnv/direnv/blob/master/docs/installation.md)** respectively

1. We will create a separate partition which will be password protected. We will use **LUKS** to achieve this. This guide will help you in doing so
      **<p>[LUKS Encryption Guide](https://www.redhat.com/sysadmin/disk-encryption-luks)</p>**
3. Once created create a .txt file inside this encrypted partition and keep it hidden by putting a .(dot) before the filename.
4. You will need to type the following inside it:
      <p><dir="auto"><code>export BITPASS=<i>"Your bitwarden vault password"</i></code></p>
      <p><dir="auto"><code>export ZIPASS=<i>"The password of the file you want to keep"</i></code></p>

# Explaination for prior steps

  This are environment variables that are needed to be set prior to the running of the script. We are using a zip file encryption to encrypt the .csv file which will be exported at the time of creating backup.
5. There is one final setup that is **setting up direnv**
      <p><code>eval "$(direnv hook zsh)"</code></p>
    This will enable direnv to read environment variables from the files you want it to. Direnv is kind of like setting a local environment variable that only works in a certain folder
6. Now create a <code>.envrc</code> file where you have stored the script 
      <p><code>export DEVICEPASSWORD=<i>"Your encrypted drive password"</i></code></p>
7. Enter the the command 
      <p><code>direnv allow <i>The path of .envrc file</i></code></p>
**You are now all set with the prerequisites, make sure you are logged in your bitwarden vault through cli**

8. Download the script
9. Give permissions
      <p><dir="auto"><code> sudo chmod +x ./bwbackup.sh </code></p>
10. Run the script
      <p><dir="auto"><code>./bwbackup.sh</code></p>
11. Enter the sudo password
12. The backup will be created

## Disclaimer
### Read the GPL 3.0 License

### This is a personal project please be patient if any issue arises.

#### Note: There my be some security risks while using this script please be cautious.
