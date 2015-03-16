APT_PACKAGES="python python-setuptools postgresql-common libpq-dev python-dev"
EASY_INSTALL_PACKAGES="pip"
PIP_PACKAGES="pyyaml jinja2 nose passlib pycrypto psycopg2 boto doby"

sudo apt install $APT_PACKAGES
sudo easy_install $EASY_INSTALL_PACKAGES
sudo pip install $PIP_PACKAGES
git clone git@github.com:ansible/ansible

echo """
############# BOOTSTRAPPING COMPLETE ########################

Now run: ANSIBLE_INSTALL_PATH=./ansible source scripts/ansible-setup.sh
This will set various environment variables for you.  We should probably
use direnv to manage that rather than requiring you to source this constantly.

"""
