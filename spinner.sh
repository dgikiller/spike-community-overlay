#
# Run repoman via travis
# See https://github.com/mrueg/repoman-travis
#
language: python
python:
    - pypy
env:
    - PORTAGE_VER="2.2.17"
before_script:
    - mkdir travis-overlay
    - mv !(travis-overlay) travis-overlay/
    - mv .git travis-overlay/
    - wget "https://raw.githubusercontent.com/Sabayon-Labs/spike-community-overlay/master/.travis.yml" -O .travis.yml.upstream
    - wget "https://github.com/gentoo/portage/archive/v${PORTAGE_VER}.tar.gz" -O portage-${PORTAGE_VER}.tar.gz
    - wget "https://raw.githubusercontent.com/Sabayon-Labs/spike-community-overlay/master/spinner.sh"
    - wget "https://github.com/gentoo/gentoo-portage-rsync-mirror/archive/master.tar.gz" -O portage-tree.tar.gz
    - sudo chmod a+rwX /etc/passwd /etc/group /etc /usr spinner.sh
    - chmod a+rwx spinner.sh
    - echo "portage:x:250:250:portage:/var/tmp/portage:/bin/false" >> /etc/passwd
    - echo "portage::250:portage,travis" >> /etc/group
    - mkdir -p /etc/portage/ /usr/portage/distfiles
    - tar xzf portage-${PORTAGE_VER}.tar.gz
    - tar xzf portage-tree.tar.gz -C /usr/portage --strip-components=1
    - cp portage-${PORTAGE_VER}/cnf/repos.conf /etc/portage/
    - ln -s /usr/portage/profiles/base/ /etc/portage/make.profile
    - wget "http://www.gentoo.org/dtd/metadata.dtd" -O /usr/portage/distfiles/metadata.dtd
    - SIZE=`stat -c %s .travis.yml.upstream`
    - if ! cmp -n $SIZE -s .travis.yml .travis.yml.upstream; then  echo -e "\e[31m !!! .travis.yml outdated! Update available https://github.com/mrueg/repoman-travis \e[0m" > /tmp/update ; fi
    - cd travis-overlay
script:
    - ./../spinner.sh "./../portage-${PORTAGE_VER}/bin/repoman full -d"
# You can append own scripts after this line
