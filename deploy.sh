npm run build
cd dist
git init
git add -add
git commit -m "Deploy"
git push -f https://github.com/hugoriveros18/space-tourism-website.git master:gh-pages
cd ..