# Valentine Page

This repository contains a single static page `index.html` with a simple interactive Valentine card.

How to publish to GitHub Pages (one-time):

1. Create a new repository on GitHub (example: `valentine-card`).
2. Locally, initialize git, add files, and push to GitHub:

```powershell
git init
git add .
git commit -m "Initial commit"
# replace USERNAME and REPO with your GitHub username and repo name
git branch -M main
git remote add origin https://github.com/USERNAME/REPO.git
git push -u origin main
```

3. After push, GitHub Actions will run the workflow and publish the site.
4. The public URL will be: `https://USERNAME.github.io/REPO/`

Alternative: If you have the GitHub CLI (`gh`) installed you can create and push in one step:

```powershell
gh repo create REPO --public --source=. --remote=origin --push
```
# Valentine site

Simple single-file static site. Open `valentine.html` in a browser or deploy to GitHub Pages.

## Quick publish (using `gh`)

If you have the GitHub CLI (`gh`) installed and authenticated, from this folder run:

```bash
gh repo create my-valentine-site --public --source=. --remote=origin --push
```

Then enable GitHub Pages in repo settings (or it will be published from `gh-pages` branch or `/docs` if configured).

## Manual publish

1. Create a new GitHub repository (via website).
2. Add the remote and push:

```bash
git remote add origin https://github.com/<your-user>/<repo>.git
git branch -M main
git push -u origin main
```

3. In the repository Settings → Pages, choose the `main` branch and `/ (root)`, then save. The site will be available at `https://<your-user>.github.io/<repo>/valentine.html`.