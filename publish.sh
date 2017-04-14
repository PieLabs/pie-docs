# publishes to github pages branch
rm -rf _book
./node_modules/.bin/gitbook build
cd _book
git init
git add -A
git commit -m 'update book'
git push -f git@github.com:PieLabs/pie-docs.git master:gh-pages
