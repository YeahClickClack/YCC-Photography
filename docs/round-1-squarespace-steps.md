# Round 1 — applying to Squarespace

Changes designed on branch `improvements/round-1`. Each step lists where it lives in
Squarespace. Nothing here is live until it is entered in Squarespace and saved.
After each step is applied, update `docs/squarespace-settings.md` in the same commit.

## 1. Page titles (SEO title field)

*Pages → ⚙ page settings → SEO → SEO title.* Check *Marketing → SEO → Search appearance*
so Squarespace doesn't append the site name a second time.

| Page | New title |
|---|---|
| Home | YCC Photography \| Golf Course Photography |
| Gallery | Golf Course Photography Gallery \| YCC Photography |
| About | About Nick \| Golf Course Photographer \| YCC Photography |
| Contact | Book a Golf Course Shoot \| YCC Photography |

## 2. Alt text (17 images)

*Click image → Edit (pencil) → Content → "Image alt text"* (for Gallery section images:
the image's *Alt text* field). Wording is in `site/_build.sh` (`ALT_*` and `GALLERY`).

## 3. Home page: H1, selected work, buttons

- Change the tagline's text style from Heading 3 to **Heading 1**. Then, if it looks too
  big, reduce its size for this block only (Site Styles can make all H1s larger).
- Below it, add four **image blocks** in a row (Knoll CC, St. Enodoc, North Berwick Redan,
  Royal West Norfolk), cropped portrait 4:5, each linking to `/gallery`, with the course
  name as a small italic caption.
- Replace the single "Gallery" button with two **button blocks**: "View the Gallery"
  (solid, → `/gallery`) and "Enquire About Your Course" (outline, → `/contact`).

## 4. Headings

- Contact: "Initiate Your Vision: Submit an Inquiry" → **"Let’s Talk About Your Course"**
  (keep Heading 1). Form submit button label → **"Send Inquiry"**.
- About: "Expertise in Course Photography" Heading 2 → **Heading 1** (same visual size).

## 5. Gallery grid + lightbox

The live gallery is built from 14 separate image + text blocks. Replace them with a
native gallery:

- *Add section → Images → Gallery*, layout **Grid: Masonry**, 3 columns, small gutter.
- Enable **Lightbox** and **Show captions**.
- Upload or reuse images in the order in `site/_build.sh` (`GALLERY`) — grouped by course.
- Add the page heading "Gallery" and the italic intro line above the grid.
- Delete the old image/text blocks only after the new gallery has been reviewed.

Safer path: duplicate the Gallery page, build the new version on the copy (not in the
navigation), review it, then swap it in.

## 6. Fonts

*Site Styles → Fonts*: set **Paragraphs** and **Buttons** (and "Miscellaneous") to
**Libre Baskerville**, so nav, captions, form text and buttons all match the headings.
Then paste `squarespace/custom-css.css` into *Custom CSS* for the italic captions.
