<p align="center">
  <h3 align="center">PyCharm Helpers Fast Install</h3>

  <p align="center">
    The fast way to install The PyCharm Helpers in a remote server
  </p>
</p>

<br>

##### Problem
Upload of pycharm helpers sometimes is realy slow.

##### Solution
This script download the whole helper (from github servers) as one package and then extract it (for realy better performance).
![](diagram.jpg)
> This ugly diagram show how this work

##### Usage
To install the helpers on a remote server you must do the following:
```bash
git clone https://github.com/Eitol/pycharm_helpers_fast_install.git
cd pycharm_helpers_fast_install
bash install_helpers.sh PYCHARM_VERSION
# EXAMPLE  bash install_helpers.sh 2017.2.3
```

It will download and install the helpers according to the version of PyCharm that you want.

After this, in the home folder, a directory named .pycharm_helpers with the following structure must be created

```
/home/user/.pycharm_helpers
          ├── build.txt
          ├── check_all_test_suite.py
          ├── conda_packaging_tool.py
          ├── coveragepy
          ├── coverage_runner
          ├── docstring_formatter.py
          ├── extra_syspath.py            
          ....    
```

<a href="https://github.com/Eitol/pycharm_helpers"><strong>Go to helpers repo&raquo;</strong></a>