---
name: do-next
description: Dispatch this repo's NEXT.md open items, if any exist, as worktree-isolated coordinator sub-agents. Invoke when the operator says "do next" or "work the backlog" — but check this repo's do-not-develop status first (see below) before dispatching any coding track.
---

# do-next — this repo is do-not-develop

**This repo is do-not-develop.** It is an archive, not an active codebase. The tmct `do-next`
coordinator pattern — dispatching worktree-isolated sub-agents to implement open items from
`NEXT.md` — does not apply here in its normal form: there should be no active feature or bug-fix
tracks to dispatch.

If this repo's `NEXT.md` exists, it points at `../NEXT.md` for the shared rules (DONE-or-OPEN
only, nothing deferred; completed work lives in `git log`), and any `PLAN_*.md` files at the repo
root are plans of record. But before treating any open item as a dispatchable coding track:

1. **Confirm with the operator that development here is intended.** An open item in this repo's
   `NEXT.md` is more likely a stale carry-over or a note about the archived state than live work.
2. **Documentation, layout, and metadata changes are fine without that confirmation** — things
   like this skills-layout conversion, README corrections, or gitignore fixes. Anything that
   touches application code, infrastructure, or generated packages is not.
3. If development is confirmed intended, follow the full `do-next` procedure from this
   workspace's other repos (worktree-isolated tracks, file-ownership boundaries, coordinator-only
   merge/push/NEXT.md edits) rather than reinventing it here — but get that confirmation first,
   every time, since "do-not-develop" is the default assumption for this repo.
