repos=(
swtor.knight.1.0.1.tython
swtor.knight.1.0.2.fleet
swtor.knight.1.0.3.coruscant
swtor.knight.1.1.1.ord.mantell
swtor.knight.1.1.2.taris
swtor.knight.1.1.3.nar.shaddaa
swtor.knight.1.1.4.abandonded.mining.facility.and.tython
swtor.knight.1.1.5.alderaan
swtor.knight.1.1.6.tatooine
swtor.knight.1.1.7.uphrades
swtor.knight.1.1.8.opressor.and.tython
swtor.knight.1.2.1.balmorra
swtor.knight.1.2.2.quesh
swtor.knight.1.2.3.hoth
swtor.knight.1.2.4.fp.jedi.prisoner.taral.v.maelstrom.prison
swtor.knight.1.2.5.emperor.fortress
swtor.knight.1.3.1.belsavis
swtor.knight.1.3.2.korriban.flame
swtor.knight.1.3.3.voss
swtor.knight.1.3.4.corellia
swtor.knight.1.3.5.dromund.kaas
swtor.knight.3.4.voss
swtor.planet.01.coruscant
swtor.post.kotet
swtor.warrior.0.1.korriban
swtor.warrior.0.2.black.talon
swtor.warrior.1.1.balmorra
swtor.warrior.1.2.nar.shaddaa
swtor.warrior.1.3.orbital.station
swtor.warrior.1.4.alderaan
swtor.warrior.1.5.tatooine
swtor.warrior.1.6.jaessa.ship
swtor.warrior.1.7.hutta
swtor.warrior.2.0.plan.zero
swtor.warrior.2.1.taris
swtor.warrior.2.2.darth.vengean.flagship
swtor.warrior.2.3.hoth
swtor.warrior.2.4.dromund.kaas
swtor.warrior.3.1.quesh
swtor.warrior.3.2.belsavis
swtor.warrior.3.3.hoth
swtor.warrior.3.4.voss
swtor.warrior.3.5.corellia
swtor.warrior.3.6.korriban
swtor.warrior.0.3.dromund.kaas.n.vette.n.hk
)

for repo in "${repos[@]}"
do
  cd $repo
  echo "##### $(pwd)"
  sleep 5
  git config user.name "bikuluki"
  git config user.email "138936383+bikuluki@users.noreply.github.com"
  git remote add origin "git@biku:bikuluki/$(basename $(pwd))"
  git checkout --orphan latest_branch
  rm -rf _includes
  rm -rf ghp.includes
  rm -f .gitmodules
  rm -rf .git/modules
  rm -f _config.yml
  git commit -am "init"
  git branch -D main
  git branch -m main
  git push -f origin main 
  echo "----- clean files"
  cp -arf $HOME/code/bikuluki/swtor.template/assets .
  cp -ar readme.md .
  echo "----- submodule add"
  git submodule add https://github.com/bikuluki/ghp.includes _includes
  git add -A 
  git commit -am "submodule"
  git push
  cd ..
  echo ""; echo ""; echo "" 
done | tee -a "log.$(date)"
