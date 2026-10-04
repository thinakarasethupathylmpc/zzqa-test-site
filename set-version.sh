#!/bin/sh
# Usage: ./set-version.sh 1.0.1   -- publish that version on the QA test site, then commit + push.
# Older version files are kept so earlier download URLs stay valid.
V="$1"
[ -z "$V" ] && { echo "usage: $0 <version>"; exit 1; }
BASE="${QA_BASE_URL:?set QA_BASE_URL, e.g. https://<user>.github.io/zzqa-test-site}"
mkdir -p files
cat > release.html <<EOF
<!doctype html>
<html><head><meta charset="utf-8"><title>ZZ QA Test Product - release notes</title></head>
<body>
<h1>ZZ QA Test Product - release notes</h1>
<p>QA fixture for ResearchTool patch-addition testing. Not a real product.</p>
<div id="ver">ZZ QA Test Product $V</div>
</body></html>
EOF
cat > download.html <<EOF
<!doctype html>
<html><head><meta charset="utf-8"><title>ZZ QA Test Product - downloads</title></head>
<body>
<h1>ZZ QA Test Product $V - downloads</h1>
<ul>
<li><a id="dl-x86-exe" href="$BASE/files/zzqa-$V-x86.exe">x86 EXE</a></li>
<li><a id="dl-x64-exe" href="$BASE/files/zzqa-$V-x64.exe">x64 EXE</a></li>
<li><a id="dl-x86-msi" href="$BASE/files/zzqa-$V-x86.msi">x86 MSI</a></li>
<li><a id="dl-x64-msi" href="$BASE/files/zzqa-$V-x64.msi">x64 MSI</a></li>
</ul>
</body></html>
EOF
for f in x86.exe x64.exe x86.msi x64.msi; do
  [ -f "files/zzqa-$V-$f" ] || head -c 65536 /dev/urandom > "files/zzqa-$V-$f"
done
echo "QA site now publishes $V"
