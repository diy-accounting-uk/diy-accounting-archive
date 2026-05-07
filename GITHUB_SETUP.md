# GITHUB_SETUP.md — what a fresh GitHub repo needs

This document captures the GitHub-side configuration this repo would need in a fresh account.

## Status — archive only

This repo is the **archive** of an earlier version of the DIY Accounting community-edition spreadsheets pipeline. The live spreadsheets pipeline now lives in `spreadsheets.diyaccounting.co.uk` (a sibling repo).

**This repo's workflows are not actively used.** It exists as a snapshot. New code changes belong in the live `spreadsheets.diyaccounting.co.uk` repo, not here.

## Workflows present (not actively run)

| File | Trigger | Notes |
|---|---|---|
| `test.yml` | push, daily schedule | Same shape as the live spreadsheets test workflow |
| `deploy.yml` | push, workflow_dispatch | Would deploy to the spreadsheets AWS account if vars were set |
| `generate-bst.yml` | push, workflow_dispatch | Would generate BST package outputs and self-commit |

## Recommended action for this repo

Either:

1. **Disable Actions** — Settings → Actions → "Disable actions". Stops scheduled runs and prevents accidental deploys from this archive.
2. **Or leave alone** — workflows will fail when they try to assume an OIDC role (no GitHub Actions Variables set, no trust policy listing this repo's `sub` claim). Failing CI on an archive repo is harmless but creates noise.

To formally disable via the API:
```bash
gh api repos/<org>/diy-accounting-archive/actions/permissions \
  -X PUT -f enabled=false
```

## If you ever need to revive this repo

Same setup as `spreadsheets.diyaccounting.co.uk` — see that repo's `GITHUB_SETUP.md`. Variables: `SPREADSHEETS_ACTIONS_ROLE_ARN`, `SPREADSHEETS_DEPLOY_ROLE_ARN`, `SPREADSHEETS_CERTIFICATE_ARN`. Add this repo's `sub` claim to the OIDC trust on `spreadsheets-github-actions-role` in the spreadsheets AWS account.
