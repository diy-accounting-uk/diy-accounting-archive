# SPDX-License-Identifier: LicenseRef-PolyForm-Internal-Use-1.0.0
# Copyright (C) 2006-2026 DIY Accounting Limited

#!/usr/bin/env bash
# scripts/update.sh
# Usage: ./scripts/update-node.sh
#

rm -f package-lock.json
rm -rf node-modules
rm -rf cdk-spreadsheets.out
npm install
npm run update-to-greatest
npm update
npm upgrade
npm install
npm run build
npm link
