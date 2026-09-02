# Claude Code Memory - diy-accounting-archive

> **Shared conventions** (git workflow, code quality, confirm behavior, security): See `../CLAUDE.md`

## What this repository is

The **archived pre-migration spreadsheets repository** — the historical record of DIY
Accounting's Excel package catalogue and its generation pipeline as it stood before the
May 2026 migration to the `diy-accounting-uk` org. The live successor is
`../spreadsheets.diyaccounting.co.uk` (repo `diy-accounting-uk/spreadsheets.diyaccounting.co.uk`);
develop THERE, not here.

- **Do not develop here.** This repo is an archive by convention (the GitHub `archived` flag is
  deliberately not set — the operator manages it as history-plus-occasional-regeneration rather
  than frozen). Documentation and layout maintenance are fine; product work is not.
- **Nothing deploys from here.** There is no deploy workflow. `test.yml` and `generate-bst.yml`
  remain enabled and exercise the committed data/templates only.
- The business corpus indexes this repo **commits-only** (its file content is superseded by the
  live spreadsheets repo).

## `packages-published/`

Holds cuts of the live package catalogue, taken by hand from
`../spreadsheets.diyaccounting.co.uk` — see that repo's `PLAN_PACKAGES_TO_ARCHIVE.md` and
`.claude/skills/archive-packages/SKILL.md` for the procedure. Do not develop here and do not
edit `MANIFEST.toml` by hand; it is written by `archive-packages.js` and checked by its
`--verify` mode.

## Skills

Skills live at `.claude/skills/<name>/SKILL.md`, each with a gitignored root symlink
(`SKILL_<NAME>.md`) for convenience:

- `.claude/skills/plain-prose/SKILL.md` — writing rules for plain, human prose; follow this for
  all human-facing text (docs, comments, chat)
- `.claude/skills/do-next/SKILL.md` — notes this repo's do-not-develop status before any
  `NEXT.md`-driven dispatch
## Corpus search (corpus-loom MCP)

The `corpus-loom` MCP tools (`search`, `get_document`, `related_entities`) query one hybrid BM25+semantic index (~48.7k documents) spanning the whole business, not just this repo:

- **Repos**: all five diy-accounting-uk checkouts — tracked files at main plus full commit logs. This repo's source name is `archive` (commit log only — its file content is superseded by `spreadsheets`).
- **`drive`**: the DIY Accounting Limited Google Drive mirror — finance, minutes, personnel, product, support, technology, marketing, facilities. PDF/doc/docx content-indexed; spreadsheets metadata-only (findable by name).
- **`mail-antony` / `mail-support`**: complete Gmail backups of antony@ and support@diyaccounting.co.uk (2012→present).
- **Entities**: email addresses, seeded orgs (NatWest, HMRC, Companies House, Stripe, PayPal), Drive categories — `related_entities` links a person/org across mail, documents, and commits.

Source names for filters: `drive`, `mail-antony`, `mail-support`, `submit`, `spreadsheets`, `www`, `root`, `archive`. Drive `finance/` and `personnel/` are lexical-only (deliberately never embedded) — exact-token queries work there, paraphrase queries don't. Use this before grepping siblings or asking the operator for history.

