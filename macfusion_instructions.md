## Macfusion Instructions

```bash
### If you don't have an SSH key yet
ssh-keygen -t rsa
saves key in ~/.ssh/id_rsa.pub

### otherwise, for automatic handshake
ssh-copy-id kkeith@10.1.105.13
scp ~/.ssh/id_rsa.pub kkeith@10.1.105.13:.ssh/authorized_keys
ssh kkeith@10.1.105.11
chmod 700 ~/.ssh/authorized_keys 
```

```bash
scp ~/.ssh/id_rsa.pub kkeith@10.1.105.13:.ssh/authorized_keys
restorecon -R ~/.ssh
```

```bash
pwd
/Users/kelsey/Documents/2020_bioinformatics_research_experience
cd rnaseq-demo
sftp kkeith@10.1.105.13
### sftp demo
```