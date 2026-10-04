# ZZ QA test site

Fixture for testing ResearchTool's version detection and multi-variant patch addition.
`release.html` carries the "latest version"; `download.html` links one dummy installer per
variant (x86/x64 x EXE/MSI). The files are random bytes, not software. Safe to delete.

Publish a new version: `QA_BASE_URL=https://<user>.github.io/zzqa-test-site ./set-version.sh 1.0.1`, then commit and push.
