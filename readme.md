---
---
# Bikuluki - Home
<!-- Make sure to git config user.name && user.email -->

- [SWTOR](/swtor)
- [Shibari](/shibari)

```bash
#!/usr/bin/zsh

alias gbiku='ggit_biku'

function ggit_biku() {
  git init 
  git config user.name "bikuluki" 
  git config user.email XXX
  git remote add origin "git@biku:bikuluki/$(basename $(pwd))" 

  mkdir -p assets/css && echo '* mkdir -p assets/css'
  mkdir -p .github/workflows && echo '* mkdir -p .github/workflows'
  wget https://raw.githubusercontent.com/bikuluki/ghp/main/assets/css/style.css -O assets/css/style.css &&
    echo '* wget style.css'
  wget https://raw.githubusercontent.com/bikuluki/ghp/main/.github/workflows/jekyll-gh-pages.yml -O .github/workflows/jekyll-gh-pages.yml &&
    echo '* wget jekyll-gh-pages.yml'

  git add . 
  git commit -m "init"
  git branch -M main
  git push -u origin main 
}

function biku_clean() {
  repos=(
    #bikuluki.github.io
    shibari
    shibari.junctions
    shibari.tk.2
    shibari.tk.3.fuji
    shibari.tk.3.x
    shibari.tk.3.y
    swtor
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
    swtor.warrior.0.3.dromund.kaas.n.vette.n.hk
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
  )

  unalias cp
  for repo in $repos
  do
    echo "############################################################"
    echo "# $repo"
    git clone git@biku:bikuluki/$repo
    cd $repo && echo "cd $(basename $(pwd))"

    #rm -rf .git && echo "* rm -rf .git"
    #git init && echo "* git init"
    git pull && echo "* git pull"
    git config user.name "bikuluki" 
    git config user.email "138936383+bikuluki@users.noreply.github.com"
    #git remote add origin "git@biku:bikuluki/$(basename $(pwd))"  && echo "* git remote add origin git@biku:bikuluki/$(basename $(pwd)) "

    if [[ -f ".gitmodules" ]]; then rm -f .gitmodules && echo "* rm -rf .gitmodules"; fi
    if [[ -d ".git/modules" ]]; then rm -rf .git/modules && echo "* rm -rf .git/modules"; fi
    if [[ -d "ghp/" ]]; then rm -rf ghp && echo "* rm -rf ghp"; fi
    if [[ -d "_includes" ]]; then rm -rf _includes/ && echo "* rm -rf _includes/"; fi
    if [[ -d "assets/css" ]]; then rm -rf assets/css/ && echo "* rm -f assets/css/*.css"; fi
    if [[ -f "Gemfile" ]]; then rm -f Gemfile && echo "* rm -rf Gemfile"; fi
    if [[ -f "_config.yml" ]]; then rm -f _config.yml && echo "* rm -rf _config.yml"; fi
    if [[ -f "favicon.ico" ]]; then rm -f favicon.ico && echo "* rm -rf favicon.ico"; fi

    #/usr/bin/cp -ruf ../ghp/_includes . && echo "* /usr/bin/cp -ruf ../ghp/_includes ."
    #/usr/bin/cp -uf ../ghp/Gemfile . && echo "* /usr/bin/cp -uf ../ghp/Gemfile ."
    #/usr/bin/cp -uf ../ghp/_config.yml . && echo "* /usr/bin/cp -uf ../ghp/_config.yml ."
    #/usr/bin/cp -uf ../ghp/favicon.ico . && echo "* /usr/bin/cp -uf ../ghp/favicon.ico ."
    if [[ ! -d 'assets/css' ]]; then mkdir -p assets/css; fi
    /usr/bin/cp ../ghp/assets/css/style.css assets/css/ && 
      echo "* /usr/bin/cp ../ghp/assets/css/*.css assets/css/"

    rm -rf mkdir* && echo '* rm -rf mkdir*'
    if [[ ! -d ".github/workflows" ]]; then 
      mkdir -p '.github/workflows' echo '* mkdir -p .github/workflows'
    fi
    if [[ -f ".github/workflows/ghp.yml" ]]; then rm -f .github/workflows/ghp.yml && echo '* rm -f .github/workflows/ghp.yml'; fi
    /usr/bin/cp -uf ../ghp/.github/workflows/jekyll-gh-pages.yml .github/workflows && 
      echo '* /usr/bin/cp -uf ../ghp/.github/workflows/jekyll-gh-pages.yml .github/workflows'

    if [[ -n $(git status --short) ]]; then
      echo "* git status: $(git status -s)"
      git add .  && echo "* git add . "
      git commit -am 'clean' && echo "* git commit -am 'clean'"
      git push && echo "* git push"
      #git branch -M main && echo "* git branch -M main"
    else; echo "* git status: No Change"; fi

    #git push -f -u origin main  && echo "* git push -f -u origin main "
    echo "############################################################\n\n"
    cd ..
  done | tee -a $(date +%Y.%m.%d.%H.%M.%S).log
}
```
