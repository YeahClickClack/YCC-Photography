# YCC Photography — website workspace

Working copy of [yccphotography.com](https://www.yccphotography.com). The live site runs on
**Squarespace**; this repo is where changes are designed, previewed and versioned before
they are applied there.

## How this repo is used

1. `site/` is a hand-built version of the site (Home, Gallery, About, Contact), approximating
   Squarespace's layout; it is not an export.
2. **`main` is the version of the site we want.** Every push to `main` publishes it to the
   preview at **https://yeahclickclack.github.io/YCC-Photography/** (hidden from search engines).
   Bigger experiments go on a branch first and are merged into `main` once approved.
3. The tag `squarespace-live-2026-10-15` marks the site exactly as it was live on Squarespace
   before any changes.
4. Nothing reaches the live site until it is deliberately applied to Squarespace:
   - **Styling** → pasted into *Website → Pages → Custom Code → Custom CSS*
     (kept in `squarespace/custom-css.css`).
   - **Text, SEO fields, image order, layout** → entered in the Squarespace editor.
4. `docs/squarespace-settings.md` records what is set in Squarespace (titles, descriptions,
   alt text…). Every change to the live site updates that file in the same commit, so git
   history shows the old value if something needs to be reverted.

## Preview locally

```bash
cd site
py -m http.server 8000
```

Then open http://localhost:8000.

Pages are generated from `site/_build.sh` so the header and footer stay identical;
edit that script and run `bash _build.sh` from inside `site/`.

## Notes

- Images are loaded from the Squarespace CDN, so the repo stays small and always shows
  the same photos as the live site.
- The contact form here is a non-working placeholder; the real form lives in Squarespace.
