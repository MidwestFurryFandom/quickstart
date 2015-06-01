QUICKSTART
======

(Windows instructions, though linux/mac should be similar)

1) Download and install the following (windows is fine):
- Virtualbox - https://www.virtualbox.org/
- Vagrant - https://www.vagrantup.com/

2) Clone this repository somewhere

3) Launch a DOS prompt in administrator mode.
Press the Start Menu, type in 'command prompt', and RIGHT CLICK, Run As Administrator

Change your directory to where you want the code to live on your machine. For example, C:\projects\

```
cd C:\projects\
```

4) Clone this repository somewhere like so:
```
git clone https://github.com/magfest/ubersystem-docker/ 
cd ubersystem-docker
```

5) Start up a build (takes about 30 minutes)

```
vagrant up
```

6) Now that you have a build of the current code, all you need to do is run it.

```
vagrant ssh
cd docker
docker-compose up
```

This will start the uber app in a container, and the code will be accessible from the OS running Vagrant (i.e. Windows) in app/uber/

7) Open your brower and go to "http://localhost:8282/uber/"

You've installed it!

Inserting an admin user
======

From inside vagrant, press CTRL+Z and then type in the following to insert an admin user:

```
docker exec uberdocker_web_1 /uber/env/bin/sep insert_admin
```

Now you can login to the web app with username "magfest@example.com" and password "magfest"

You can edit the deployed code at C:\projects\ubersystem-docker\app\uber now.

Resetting everything
======

If you ever want to reset this repository and re-create the entire build process, do the following steps:

1) First, push any git changes you want to keep before doing this stuff.  This will delete your local copy.

2) Run the following commands from an DOS prompt you ran as an Administrator:
```
vagrant destroy
```

3) Then remove the local folder 'app/uber' which was copied by Docker into your local files. If you installed into
C:\projects\  then you would delete the ```C:\projects\ubersystem-docker\app\uber``` directory. CAUTION: MAKE SURE YOU 
HAVE PUSHED ANY CHANGES TO SIDEBOARD OR ANY PLUGINS AS THEY WILL BE LOST AFTER THIS.

4) You are now ready to pull down a new copy with the same instructions as above


Advanced: Debugging in PyCharm
=======

If you'd like to use the PyCharm Debugger, do the following steps:

1) Copy the following file from your PyCharm installation into ```C:\projects\ubersystem-docker```
```
C:\Program Files (x86)\JetBrains\PyCharm 4.5.1\debug-eggs\pycharm-debug-py3k.egg
```

2) Follow the QUICKSTART instructions above, but don't actually start the app yet.  The build process will install that .egg file.

3) On your host OS (i.e. windows) open port 5000/TCP on your firewall to incoming connections.

4) Edit ubersystem-docker/app/uber/sideboard/run_server.py, and add the following lines:
```
import pydevd
pydevd.settrace('10.0.2.2', port=5000, stdoutToServer=True, stderrToServer=True, suspend=True)
```
(10.0.2.2 is the default gateway in Virtualbox i.e. your windows box)

5) In PyCharm, make sure you have the 'debug uber docker container' Run Configuration selected.

6) Click the green 'Debug' button in PyCharm.  This will cause PyCharm to wait for ubersystem to connect to it for debugging.

7) Run 'docker-compose up', and notice that it connects to PyCharm and you can now debug/etc. ENJOY.