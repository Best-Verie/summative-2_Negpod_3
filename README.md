# ALU STUDENT MANAGEMENT APPLICATION 


### Getting started

> Make sure you have a well-functioning linux environment.

clone the repo

```bash
git clone https://github.com/Best-Verie/summative-2_Negpod_3
```
Run


``` bash
cd summative-2_Negpod_3
```

``` bash
bash main.sh
```

> choose the operation according to the menu

### Features

1. Recording student
2. Viewing a list of all registered students 
3. Searching a specific student
4. Updating student details by id
5. Deleting student records by id
6. A very exceptional navigation system

### Additional Scripts

There are two additional scripts files in this directory, <code>move-t0-directory.sh</code> and <code>backup-Negpod_3.sh</code>.
1. Running <code>move-t0-directory.sh</code> will move <code>main.sh Students-list_1023.txt Select-emails.sh student-emails.txt</code> into the <code>negpod_3-q1</code> directory
2. Running <code>backup-Negpod_3.sh</code> backups the <code>negpod_3-q1</code> directory to a remote server that is specified in the script.

Note: 
The <code>rsync</code> and <code>sshpass</code> commands are not available on your system by default. That said, you will need to install then first before running <code>backup-Negpod_3.sh</code>

<code>
sudo apt update
sudo apt install rsync
sudo apt install sshpass
</code>

### Contributors

1. Best Verie Iradukunda
2. Jean Jabo
3. Egide Harerimana
4. Habib Josue Ahadi
5. Hortance Irakoze
