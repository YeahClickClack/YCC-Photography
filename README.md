# YCC Photography — website workspace

Working copy of [yccphotography.com](https://www.yccphotography.com). The live site runs on
**Squarespace**; this repo is where changes are designed, previewed and versioned before
they are applied there.

## How this repo is used

1. `site/` is a hand-built mirror of the live Squarespace site (Home, Gallery, About, Contact).
   It approximates Squarespace's layout; it is not an export.
2. Changes are made here first, on a branch, and previewed locally.
3. Once approved, a change is applied to Squarespace:
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
