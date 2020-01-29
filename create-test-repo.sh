#!/bin/bash

#### CREATE AND CLONE EMPTY REPOSITORY ####

REPOSITORY=test-repository-DELETE-ME-${RANDOM}
mkdir /tmp/${REPOSITORY} && cd /tmp/${REPOSITORY}
git init --bare

cd ~ && git clone /tmp/${REPOSITORY}
cd ${REPOSITORY}

#### ADD CONTENT AND COMMIT ####

echo "Lorem ipsum dolor sit amet, liber similique rationibus per et, quot posse vidisse eu duo. Pri exerci inciderint ullamcorper ne, id eripuit minimum vituperata pri. No ullum erant mucius ius. Ex menandri posidonium sed, delenit inermis consequat mei in. Id illud iisque periculis nec, pro vocent invenire maiestatis no. An has vidit facilisis periculis." >> README.txt

git add README.txt
git commit -m "Initial commit of test repository."

#### BRANCH V1 FROM MASTER ####

git checkout -b version-1 && git push origin version-1
git checkout master

#### ADD ADDITIONAL CONTENT TO MASTER ###

echo "Et option iisque reprehendunt usu. Tantas fuisset intellegam cum eu. Cu nec eros graece elaboraret. Ut vim graeci inimicus volutpat, mea in probo graece democritum.

No tempor aperiri deserunt vel, dicunt recusabo ex sea. Pri case cotidieque ut, ea ius ignota mollis, hinc postea offendit id usu. No audire delenit per. Viris reprimique quaerendum at vis. Eos ei nemore accusam accommodare, has cetero eripuit in." >> README.txt

git add README.txt
git commit -m "Et option iisque reprehendunt usu."
git push origin master

#### PUSH FIX TO BRANCH | MERGE WITH MASTER ####

git checkout -b master-fix01
sed -i '/facilisis periculis./a\\' README.txt
git add README.txt
git commit -m "Added new line after facilisis periculis"
git push origin master-fix01

git checkout master && git merge master-fix01
git push origin master

#### UPGRADE MASTER TO VERSION 2 ####

git checkout -b master-update01

sed -i '1s/^/[VERSION 2]\n\n/' README.txt

echo "Ne eruditi sadipscing sea, ubique pericula complectitur pri an. Ne idque dicit est, an quo everti maiorum erroribus. Falli semper disputationi per te, ea eos alia oporteat. Sit verterem invenire an, ut adipisci similique usu. Ea mel justo vituperata, id est lorem lucilius quaestio. Ea novum appetere verterem qui, diam aeterno definiebas at vix." >> README.txt

git add README.txt
git commit -m "Upgraded to version 2"
git push origin master-update01

git checkout master && git merge master-update01
git push origin master

#### BRANCH V2 FROM MASTER ####

git checkout -b version-2 && git push origin version-2
git checkout master

#### PUSH FIX TO BRANCH | MERGE WITH MASTER ####

git checkout -b master-fix02
sed -i '/has cetero eripuit in./a\\' README.txt
git add README.txt
git commit -m "Added new line after has cetero eripuit in"
git push origin master-fix02

git checkout master && git merge master-fix02
git push origin master

#### UPGRADE MASTER TO VERSION 3.0 ####

git checkout -b master-update02
sed -i 's/VERSION 2/VERSION 3.0/' README.txt
echo "" >> README.txt

echo "Fastidii omnesque scripserit ne vel. An per odio petentium aliquando, augue saepe salutatus et nec. Sea eu odio iudico suscipiantur, te delenit erroribus mel. Eum fastidii repudiare ad, quaerendum repudiandae ei vel." >> README.txt

git add README.txt
git commit -m "Upgraded to version 3"

git checkout master && git merge master-update02

#### FIX VERSION 1 ####

git checkout version-1
git checkout -b version-1-fix01
sed -i '1s/^/[VERSION 1.0]\n\n/' README.txt
git add README.txt
git commit -m "Added version header to version-1.0"

git push origin version-1-fix01
git checkout version-1
git merge version-1-fix01

#### FIX VERSION 2 ####

git checkout version-2
git checkout -b version-2-fix01
sed -i 's/VERSION 2/VERSION 2.0/' README.txt
git add README.txt
git commit -m "Fixed version header to version-2.0" 
git push origin version-2-fix01

git checkout version-2
git merge version-2-fix01
git push origin version-2

git branch -D version-2-fix01

##### 


