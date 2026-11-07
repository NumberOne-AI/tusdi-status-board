# Tusdi Status Board

One shared status (title, subtitle, color) shown full-screen, e.g. "Code Freeze". Anyone with the link can edit. No auth. Free: GitHub Pages + Supabase free tier.

## Setup

1. **Supabase**: create a free project, open SQL Editor, run [supabase.sql](supabase.sql).
2. Copy Project URL and `anon` key (Project Settings > API) into the CONFIG block in [index.html](index.html).
3. **GitHub**: create repo `tusdi-status-board` under the org, push, then Settings > Pages > Deploy from branch `main` / root.
4. Open `https://<org>.github.io/tusdi-status-board/`.

## Notes

- The anon key is meant to be public. Safety comes from RLS: the table has a single row, only SELECT/UPDATE are allowed, and values are length/format constrained.
- Anyone who finds the URL can edit. Fine for internal use; if you need more, add a shared passphrase via an RPC function later.
- GitHub Pages on private repos needs a paid plan. Use a public repo (contains no secrets) or accept that the page is public.
- Supabase free projects pause after ~1 week of inactivity; visiting the page counts as activity, and you can unpause from the dashboard.
