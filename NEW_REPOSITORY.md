# NEW_REPOSITORY.md — migration record

> This repository was migrated from `DIY-Accounting/diy-accounting-archive` to `support-at-diyaccounting/diy-accounting-archive` on **2026-05-06**, as part of consolidating all DIY Accounting repos under a single account after the suspension of `antonycc`.

## What happened

- The personal account `antonycc` was first org-flagged on 2026-05-03 and fully suspended on 2026-05-06.
- A new GitHub Pro account `support-at-diyaccounting` was created and authenticated.
- This repo previously lived at `DIY-Accounting/diy-accounting-archive` (DIY-Accounting org, not antonycc), so it wasn't directly impacted by the suspension; it was consolidated to the new account in the same migration sweep.
- Cross-repo migration plan: see `PLAN_GITHUB_MIGRATION.md` and `PLAN_FLAGGED.md` in the parent workspace (`/Users/antony/projects/diy-accounting-limited/`).

## How this repo was created in the new home

```bash
# 1. Empty repo created via gh CLI authenticated as support-at-diyaccounting
gh repo create support-at-diyaccounting/diy-accounting-archive \
  --public \
  --description "Archive of DIY Accounting community-edition spreadsheets (open-source, MPL 2.0)"

# 2. New remote added on local clone (kept old origin in place as safety net)
git -C diy-accounting-archive remote add newhome \
  git@github.com:support-at-diyaccounting/diy-accounting-archive.git

# 3. All branches and tags pushed
git -C diy-accounting-archive push newhome --all
git -C diy-accounting-archive push newhome --tags
```

## What was migrated

- **1 branch**: `main` (pushed at `9f00a7c`).
- **0 tags**.
- **All repository content** including CDK Java code, app templates, web assets.

## Code rewrites in this branch

This branch (`claude/migrate-to-support-at-diyaccounting`) updates stale references to the suspended `antonycc` account. Replacement rules applied:

| Old reference | New reference |
|---|---|
| `antonycc/diy-accounting` | `support-at-diyaccounting/spreadsheets.diyaccounting.co.uk` (the live spreadsheets repo was renamed in the migration) |
| `antonycc/root.diyaccounting.co.uk` | `support-at-diyaccounting/root.diyaccounting.co.uk` |
| `antonycc/submit.diyaccounting.co.uk` | `support-at-diyaccounting/submit.diyaccounting.co.uk` |
| `@antonycc/spreadsheets-diyaccounting-co-uk` (npm scope) | `@support-at-diyaccounting/spreadsheets-diyaccounting-co-uk` |

Files affected (8 total):
- `README.md`
- `app/templates/bst/bst-guide.md`
- `app/templates/meta.toml`
- `infra/main/java/co/uk/diyaccounting/spreadsheets/stacks/SpreadsheetsStack.java` — CDK stack tags
- `package.json`
- `web/spreadsheets.diyaccounting.co.uk/public/community.html`
- `web/spreadsheets.diyaccounting.co.uk/public/download.html`
- `web/spreadsheets.diyaccounting.co.uk/public/lib/community-page.js`

## What was deliberately NOT rewritten

- `_developers/archive/*.md` — historical records of past state; rewriting them would falsify the audit trail.
- `cdk-*.out/*`, `package-lock.json` — build artifacts; will be regenerated.
- Test report files (`axe-*.json`, `html-report/*`) — generated outputs.

If any of these become a problem they can be regenerated or rewritten in a follow-up PR.

## Status of GitHub Actions workflows

`.github/workflows/` contains `deploy.yml`, `generate-bst.yml`, `test.yml`. They reference the same AWS variables as the live spreadsheets repo:
- `vars.SPREADSHEETS_ACTIONS_ROLE_ARN`
- `vars.SPREADSHEETS_DEPLOY_ROLE_ARN`
- `vars.SPREADSHEETS_CERTIFICATE_ARN`

Since this is an **archive** repo and deployments should not happen here (deployment is owned by `spreadsheets.diyaccounting.co.uk`), one of the following should be done after this PR is merged:
1. **Disable Actions** on the new repo: `gh api repos/support-at-diyaccounting/diy-accounting-archive/actions/permissions -X PUT -f enabled=false`, OR
2. Remove the deploy workflow from this archive entirely.

No GitHub Actions Variables or Secrets need to be set for this repo.

## How to obtain values (for the live spreadsheets repo)

If you need to find the values that the live spreadsheets repo (`spreadsheets.diyaccounting.co.uk`) uses, see `support-at-diyaccounting/spreadsheets.diyaccounting.co.uk/NEW_REPOSITORY.md` once that PR lands.
