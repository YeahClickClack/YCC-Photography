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
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Almarai:wght@400;700&family=Libre+Baskerville&display=swap" rel="stylesheet">
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

# ---------- Home ----------
{
head "YCC Photography" ""
header "" home "site-header--overlay"
cat <<H
  <section class="hero">
    <img src="$CDN/7ff7503a-ceeb-408b-be20-c8f136db8e22/Maiden2.jpg?format=2500w" alt="">
  </section>
  <section class="tagline">
    <h3>Course photography capturing the character, beauty, and soul of the game.</h3>
    <a class="btn-outline" href="gallery/">Gallery</a>
  </section>
H
footer
} > index.html

# ---------- Gallery ----------
# Order and captions match the live Gallery page. Alt text is empty on the live site.
fig() { printf '    <figure>\n      <img src="%s/%s?format=2500w" alt="" loading="lazy">\n      <figcaption>%s</figcaption>\n    </figure>\n' "$CDN" "$1" "$2"; }
{
head "Gallery — YCC Photography" "../"
header "../" gallery
echo '  <section class="gallery">'
fig "5d2937ff-5029-45dd-80a5-bcc34775186a/KnollCC.jpg"            "Knoll CC (West)"
fig "9cec47a1-9853-4f0e-9c7f-4122fe928806/NBWL+Biarritz.jpg"      "North Berwick (West Links)"
fig "8c6ed44c-ca7b-4d75-957e-5a1deb8129d1/RND.jpg"                "Royal North Devon Golf Club"
fig "a9a748a3-e2fa-4580-8d06-3b11e5b6192b/Sunningdale.jpeg"       "Sunningdale (Old)"
fig "896f0e48-d881-441a-83c6-213ca53201b0/StGH+8.jpeg"            "St. George’s Hill (Red/Blue)"
fig "d5c57a04-dc97-48f5-b686-627ec904b0c5/Enodoc.jpeg"            "St. Enodoc (Church)"
fig "94ddbb87-a2af-4a52-9316-9b5b88594146/Sunningdale+New.jpeg"   "Sunningdale (New)"
fig "7f30ccf3-e968-4baf-aa27-3dec27e36f28/StGH9.jpeg"             "St. George’s Hill (Red/Blue)"
fig "d2113714-60b9-4d64-8bc6-bd480cd0f09b/Rye.jpeg"               "Rye Golf Club (Old)"
fig "fbbe2b75-1f90-4883-ba25-8e6108106239/NBWLPIT.jpg"            "North Berwick (West Links)"
fig "24550d6f-dd84-4fbe-803c-39689ee72ea8/Redan3.jpg"             "North Berwick (West Links)"
fig "a2cf102e-53d5-4611-bfeb-2a56c780c55a/Sandwich2.jpg"          "Royal St. George’s Golf Club"
fig "e39bd340-13f9-4b18-8667-855d75d9d4c4/Dornoch3.jpg"           "Royal Dornoch Golf Club"
fig "37bb09a6-9a99-465a-a4cb-6563dfd9c4c5/RWNGC.jpg"              "Royal West Norfolk Golf Club"
echo '  </section>'
footer
} > gallery/index.html

# ---------- About ----------
{
head "About — YCC Photography" "../"
header "../" about
cat <<H
  <section class="split">
    <div>
      <h2>Expertise in Course Photography</h2>
      <h4>Capturing your golf course at its finest, revealing the character, features, and contours that set it apart.</h4>
      <h4>Led by photographer Nick, YCC Photography highlights the landscape with a discerning eye and an authentic, tasteful perspective.</h4>
      <h4>Each project starts with understanding your course: the property, its finest characteristics, and ultimately its true essence, so every image reflects what makes it special.</h4>
    </div>
    <div class="split__media">
      <img src="$CDN/d727b5b8-73e3-47bf-8446-68cab91feade/Nairn.jpeg?format=1500w" alt="">
    </div>
  </section>
H
footer
} > about/index.html

# ---------- Contact ----------
{
head "Contact — YCC Photography" "../"
header "../" contact
cat <<H
  <section class="split">
    <div>
      <h1>Initiate Your Vision: Submit an Inquiry</h1>
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
        <button class="btn-solid" type="submit">Submit</button>
      </form>
    </div>
    <div class="split__media">
      <img src="$CDN/95c6b4d7-6281-4192-9c21-17323780ef02/Aberdovey.jpg?format=1500w" alt="">
    </div>
  </section>
H
footer
} > contact/index.html

echo "Built: index.html gallery/ about/ contact/"
