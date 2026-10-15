#!/usr/bin/env bash
# Generates the four pages from shared header/footer so they stay identical.
# Usage: bash _build.sh   (run from the site/ folder)
set -e
CDN="https://images.squarespace-cdn.com/content/v1/6aaeff2d84d71d3a0b5b6c50"

head() { # $1=title $2=root prefix
cat <<H
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$1</title>
  <meta name="description" content="">
  <!-- Preview copy: keep out of search results so it never competes with yccphotography.com -->
  <meta name="robots" content="noindex, nofollow">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="$2css/site.css">
</head>
H
}

header() { # $1=root prefix $2=current page $3=extra class
  cur() { [ "$2" = "$1" ] && echo ' aria-current="page"'; }
cat <<H
<body>
<header class="site-header $3">
  <a class="site-title" href="$1">YCC Photography</a>
  <button class="menu-toggle" aria-label="Open menu" aria-expanded="false"></button>
  <nav class="site-nav">
    <a href="$1gallery/"$(cur gallery "$2")>Gallery</a>
    <a href="$1about/"$(cur about "$2")>About</a>
    <a href="$1contact/"$(cur contact "$2")>Contact</a>
  </nav>
</header>
<main>
H
}

footer() {
cat <<'H'
</main>
<footer class="site-footer">
  <h4><a href="mailto:nick@yccphotography.com">nick@yccphotography.com</a></h4>
  <div class="social">
    <a href="http://instagram.com/yeahclickclack" aria-label="Instagram"><svg viewBox="0 0 24 24"><path d="M12 2.2c3.2 0 3.6 0 4.8.1 3.3.1 4.8 1.7 4.9 4.9.1 1.3.1 1.6.1 4.8s0 3.6-.1 4.8c-.1 3.2-1.7 4.8-4.9 4.9-1.3.1-1.6.1-4.8.1s-3.6 0-4.8-.1c-3.3-.1-4.8-1.7-4.9-4.9C2.2 15.6 2.2 15.2 2.2 12s0-3.6.1-4.8C2.4 3.9 3.9 2.4 7.2 2.3 8.4 2.2 8.8 2.2 12 2.2zM12 0C8.7 0 8.3 0 7.1.1 2.7.3.3 2.7.1 7.1 0 8.3 0 8.7 0 12s0 3.7.1 4.9c.2 4.4 2.6 6.8 7 7 1.2.1 1.6.1 4.9.1s3.7 0 4.9-.1c4.4-.2 6.8-2.6 7-7 .1-1.2.1-1.6.1-4.9s0-3.7-.1-4.9c-.2-4.4-2.6-6.8-7-7C15.7 0 15.3 0 12 0zm0 5.8a6.2 6.2 0 1 0 0 12.4 6.2 6.2 0 0 0 0-12.4zM12 16a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm6.4-11.8a1.4 1.4 0 1 0 0 2.9 1.4 1.4 0 0 0 0-2.9z"/></svg></a>
    <a href="https://x.com/YeahClickClack" aria-label="X"><svg viewBox="0 0 24 24"><path d="M18.9 1.2h3.7l-8 9.2L24 22.8h-7.4l-5.8-7.6-6.6 7.6H.5l8.6-9.8L0 1.2h7.6l5.2 6.9 6.1-6.9zm-1.3 19.4h2L6.5 3.2H4.3l13.3 17.4z"/></svg></a>
    <a href="mailto:nick@yccphotography.com" aria-label="Email"><svg viewBox="0 0 24 24"><path d="M2 4h20a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2zm0 2v.5l10 6 10-6V6H2zm20 2.8-10 6-10-6V18h20V8.8z"/></svg></a>
  </div>
</footer>
<script>
  var t = document.querySelector('.menu-toggle'), n = document.querySelector('.site-nav');
  t.addEventListener('click', function () {
    var open = n.classList.toggle('is-open');
    t.setAttribute('aria-expanded', open);
  });
</script>
</body>
</html>
H
}

# ---------- Images ----------
# Alt text here is what goes into each image's Squarespace "Image alt text" field.
IMG_HERO="7ff7503a-ceeb-408b-be20-c8f136db8e22/Maiden2.jpg"
ALT_HERO="Aerial view of links fairways winding through grassy dunes beside the sea"
IMG_ABOUT="d727b5b8-73e3-47bf-8446-68cab91feade/Nairn.jpeg"
ALT_ABOUT="White-walled stone cottage behind a links green and pot bunker at Nairn"
IMG_CONTACT="95c6b4d7-6281-4192-9c21-17323780ef02/Aberdovey.jpg"
ALT_CONTACT="Aerial view down a narrow links fairway through the dunes at Aberdovey, with the beach beyond"

# Gallery, grouped by course. Format: path|caption|alt text
GALLERY=(
"5d2937ff-5029-45dd-80a5-bcc34775186a/KnollCC.jpg|Knoll CC (West)|Aerial view of a green framed by two long white-sand bunkers at Knoll Country Club, with flowering trees beyond"
"9cec47a1-9853-4f0e-9c7f-4122fe928806/NBWL+Biarritz.jpg|North Berwick (West Links)|Evening sun over the Firth of Forth from the fairways of North Berwick West Links"
"fbbe2b75-1f90-4883-ba25-8e6108106239/NBWLPIT.jpg|North Berwick (West Links)|Aerial view of a seaside hole at North Berwick West Links running beside the beach, with islands on the horizon"
"24550d6f-dd84-4fbe-803c-39689ee72ea8/Redan3.jpg|North Berwick (West Links)|Aerial view of the Redan green at North Berwick West Links and its deep front bunkers"
"8c6ed44c-ca7b-4d75-957e-5a1deb8129d1/RND.jpg|Royal North Devon Golf Club|Black-and-white view across the open links of Royal North Devon toward the sea"
"a9a748a3-e2fa-4580-8d06-3b11e5b6192b/Sunningdale.jpeg|Sunningdale (Old)|The Sunningdale clubhouse and its great oak tree behind the final green of the Old Course"
"94ddbb87-a2af-4a52-9316-9b5b88594146/Sunningdale+New.jpeg|Sunningdale (New)|Heather and sandy waste areas on the New Course at Sunningdale beneath a stormy sky"
"896f0e48-d881-441a-83c6-213ca53201b0/StGH+8.jpeg|St. George’s Hill (Red/Blue)|Heathland green guarded by sandy bunkers at St. George’s Hill, framed by tall pines"
"7f30ccf3-e968-4baf-aa27-3dec27e36f28/StGH9.jpeg|St. George’s Hill (Red/Blue)|Fairway rising through heather and bunkers toward the red-brick clubhouse at St. George’s Hill"
"d5c57a04-dc97-48f5-b686-627ec904b0c5/Enodoc.jpeg|St. Enodoc (Church)|The spired church nestled in the dunes at St. Enodoc, with the estuary and headland beyond"
"d2113714-60b9-4d64-8bc6-bd480cd0f09b/Rye.jpeg|Rye Golf Club (Old)|Fairway winding between marram-covered dunes on the Old Course at Rye"
"a2cf102e-53d5-4611-bfeb-2a56c780c55a/Sandwich2.jpg|Royal St. George’s Golf Club|Aerial view of a bunkered green at Royal St. George’s, with the town of Sandwich and the sea beyond"
"e39bd340-13f9-4b18-8667-855d75d9d4c4/Dornoch3.jpg|Royal Dornoch Golf Club|Aerial view of a green ringed by pot bunkers at Royal Dornoch, with the firth in the distance"
"37bb09a6-9a99-465a-a4cb-6563dfd9c4c5/RWNGC.jpg|Royal West Norfolk Golf Club|Aerial view of a raised green and row of pot bunkers at Royal West Norfolk, with the beach behind"
)

# Home page "selected work" row (indexes into GALLERY)
FEATURED=(0 9 3 13)

# ---------- Home ----------
{
head "YCC Photography | Golf Course Photography" ""
header "" home "site-header--overlay"
cat <<H
  <section class="hero">
    <img src="$CDN/$IMG_HERO?format=2500w" alt="$ALT_HERO">
  </section>
  <section class="tagline">
    <h1>Course photography capturing the character, beauty, and soul of the game.</h1>
  </section>
  <section class="featured">
H
for i in "${FEATURED[@]}"; do
  IFS='|' read -r path cap alt <<< "${GALLERY[$i]}"
  printf '    <a href="gallery/"><img src="%s/%s?format=1000w" alt="%s" loading="lazy"><span>%s</span></a>\n' "$CDN" "$path" "$alt" "$cap"
done
cat <<H
  </section>
  <section class="cta">
    <a class="btn-solid" href="gallery/">View the Gallery</a>
    <a class="btn-outline" href="contact/">Enquire About Your Course</a>
  </section>
H
footer
} > index.html

# ---------- Gallery ----------
{
head "Golf Course Photography Gallery | YCC Photography" "../"
header "../" gallery
cat <<H
  <section class="page-intro">
    <h1>Gallery</h1>
    <p>Links, heathland and parkland courses across the UK and beyond.</p>
  </section>
  <section class="gallery">
H
n=0
for item in "${GALLERY[@]}"; do
  IFS='|' read -r path cap alt <<< "$item"
  printf '    <figure>\n      <a href="%s/%s?format=2500w"><img src="%s/%s?format=1000w" alt="%s" loading="lazy"></a>\n      <figcaption>%s</figcaption>\n    </figure>\n' "$CDN" "$path" "$CDN" "$path" "$alt" "$cap"
  n=$((n+1))
done
cat <<'H'
  </section>
  <div class="lightbox" hidden>
    <button class="lb-close" aria-label="Close">&times;</button>
    <button class="lb-prev" aria-label="Previous photo">&lsaquo;</button>
    <figure><img alt=""><figcaption></figcaption></figure>
    <button class="lb-next" aria-label="Next photo">&rsaquo;</button>
  </div>
  <script>
    (function () {
      var links = [].slice.call(document.querySelectorAll('.gallery a'));
      var lb = document.querySelector('.lightbox'), img = lb.querySelector('img'), cap = lb.querySelector('figcaption');
      var i = 0;
      function show(n) {
        i = (n + links.length) % links.length;
        img.src = links[i].href;
        img.alt = links[i].querySelector('img').alt;
        cap.textContent = links[i].parentNode.querySelector('figcaption').textContent;
      }
      function close() { lb.hidden = true; document.body.style.overflow = ''; links[i].focus(); }
      links.forEach(function (a, n) {
        a.addEventListener('click', function (e) {
          e.preventDefault();
          show(n);
          lb.hidden = false;
          document.body.style.overflow = 'hidden';
          lb.querySelector('.lb-close').focus();
        });
      });
      lb.querySelector('.lb-close').onclick = close;
      lb.querySelector('.lb-prev').onclick = function () { show(i - 1); };
      lb.querySelector('.lb-next').onclick = function () { show(i + 1); };
      lb.addEventListener('click', function (e) { if (e.target === lb) close(); });
      document.addEventListener('keydown', function (e) {
        if (lb.hidden) return;
        if (e.key === 'Escape') close();
        if (e.key === 'ArrowLeft') show(i - 1);
        if (e.key === 'ArrowRight') show(i + 1);
      });
    })();
  </script>
H
footer
} > gallery/index.html

# ---------- About ----------
{
head "About Nick | Golf Course Photographer | YCC Photography" "../"
header "../" about
cat <<H
  <section class="split">
    <div>
      <h1 class="h2">Expertise in Course Photography</h1>
      <h4>Capturing your golf course at its finest, revealing the character, features, and contours that set it apart.</h4>
      <h4>Led by photographer Nick, YCC Photography highlights the landscape with a discerning eye and an authentic, tasteful perspective.</h4>
      <h4>Each project starts with understanding your course: the property, its finest characteristics, and ultimately its true essence, so every image reflects what makes it special.</h4>
    </div>
    <div class="split__media">
      <img src="$CDN/$IMG_ABOUT?format=1500w" alt="$ALT_ABOUT">
    </div>
  </section>
H
footer
} > about/index.html

# ---------- Contact ----------
{
head "Book a Golf Course Shoot | YCC Photography" "../"
header "../" contact
cat <<H
  <section class="split">
    <div>
      <h1>Let’s Talk About Your Course</h1>
      <p class="intro">I’d love to hear about your course. Tell me a bit about the property and what you have in mind using the form below, and I’ll get back to you to discuss the project.</p>
      <!-- Mirror only: on Squarespace this is a Form Block. Submitting here does nothing. -->
      <form class="form" onsubmit="event.preventDefault(); alert('Preview only: this form is not connected.');">
        <div>
          <label>Name</label>
          <div class="row">
            <label>First Name <span class="req">(required)</span><input name="first" required></label>
            <label>Last Name <span class="req">(required)</span><input name="last" required></label>
          </div>
        </div>
        <label>Email <span class="req">(required)</span><input type="email" name="email" required></label>
        <label>Message <span class="req">(required)</span><textarea name="message" required></textarea></label>
        <button class="btn-solid" type="submit">Send Inquiry</button>
      </form>
    </div>
    <div class="split__media">
      <img src="$CDN/$IMG_CONTACT?format=1500w" alt="$ALT_CONTACT">
    </div>
  </section>
H
footer
} > contact/index.html

echo "Built: index.html gallery/ about/ contact/"
