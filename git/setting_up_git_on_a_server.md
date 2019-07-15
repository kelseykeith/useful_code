# Git

## Setup

https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

View your settings

```bash
git config --list
```
### Set Your Identity

```bash
# set user name and email (directory doesn't matter if you use --global flag because it will automatically write the configuration to ~/.gitconfig)
$ git config --global user.name "Kelsey Keith"
$ git config --global user.email "kkeith@coriell.org"

# check .gitconfig file (from /home/kkeith)
$ more .gitconfig
[user]
	name = Kelsey Keith
	email = kkeith@coriell.org
```
Change editor from emacs to nano

```bash
# set editor for myself globally
$ git config --global core.editor nano

# check .gitconfig file (from /home/kkeith)
$ more .gitconfig
[user]
	name = Kelsey Keith
	email = kkeith@coriell.org
[core]
	editor = nano
```
### Set Up Account For Pushing to GitHub

https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

```bash
ssh-keygen -t rsa -b 4096 -C "kkeith@coriell.org"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/kkeith/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/kkeith/.ssh/id_rsa.
Your public key has been saved in /home/kkeith/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:4fHcRKw1HEHKPX3cyT5JzR9yuXuJztRSawZhsjG5trM kkeith@coriell.org
The key's randomart image is:
+---[RSA 4096]----+
|           +=o   |
|         . +*..o=|
|        o oB+=.B*|
|       . =.oB.*.=|
|        S o+.. *.|
|          . . = =|
|           o + B.|
|            * + .|
|           E o   |
+----[SHA256]-----+

eval "$(ssh-agent -s)"
Agent pid 85265

ssh-add ~/.ssh/id_rsa
Identity added: /home/kkeith/.ssh/id_rsa (/home/kkeith/.ssh/id_rsa)
```
https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account

```bash
more ~/.shh/id_rsa.ub
```
Copy/paste that and add it to the authorized ssh keys in your github account.ß