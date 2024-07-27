pnpm init
git init
# change to 1.0.0 to 0.0.0

pnpm add -D typescript
touch .gitignore
# add node_modules

touch src/index.ts
# add hello world to it
#
# for ts config base
https://github.com/tsconfig/bases/blob/main/bases/node-lts.json

# {
#   "display": "Node LTS",
#   "_version": "20.1.0",
#   "compilerOptions": {
#     "lib": ["es2023"],
#     "module": "node16",
#     "target": "es2022",
#     "strict": true,
#     "noUncheckedIndexedAccess": true,
#     "esModuleInterop": true,
#     "skipLibCheck": true,
#     "forceConsistentCasingInFileNames": true,
#     "moduleResolution": "node16"
#   },
#   "include": ["src"]
# }
#

added a bin folder
yarn link --global did not work
npm link worked
also have to setup the shebang and chmod

#
outDir: "dist"
.gitignore >>dist
pnpm add -D @types/node (console, will not work)
pnpm add commander
pnpm add -D tsup
# noEmit: true,
add lint: "tsc"
add build: "tsup src/index.ts --format cjs,esm --dts"
pnpm add -D vitest
add test: "vitest run"
modify dev: "vitest"
add test file index.test.ts
# import { describe, expect, it } from "vitest";
#
# describe("cli", () => {
#   it("dummy test", () => {
#     expect(1).toBe(1);
#   });
# });
#
#
add ci: pnpm lint && pnpm test && pnpm build
add .github/workflows/main.yml
# name: CI
# on:
#   push:
#     branches:
#       - "**"
#
# jobs:
#   build:
#     runs-on: ubuntu-latest
#     steps:
#       - uses: actions/checkout@v4
#       - uses: pnpm/action-setup@v4
#       - uses: actions/setup-node@v4
#         with:
#           node-version: 20
#           cache: "pnpm"
#
#       - run: pnpm i --frozen-lockfile
#       - run: pnpm run ci
#

add packageManager: "pnpm@9.6.0" or check the pnpm version
pnpm add -D @changesets/cli
pnpm changeset init
change the base branch config to master if your repo has master instead of main


Create a npm token
use it in repo secret as NPM_TOKEN
add a workflow called publish.yml
# name: Publish
# on:
#   push:
#     branches:
#       - "master"
#
# concurrency: ${{ github.workflow }}-${{ github.ref }}
#
# jobs:
#   publish:
#     runs-on: ubuntu-latest
#     steps:
#       - uses: actions/checkout@v4
#       - uses: pnpm/action-setup@v4
#       - uses: actions/setup-node@v4
#         with:
#           node-version: 20
#           cache: "pnpm"
#
#       - run: pnpm i --frozen-lockfile
#       - name: Create Release PR Or Publish
#         id: changesets
#         uses: changesets/actions@v1
#         with:
#           publish: pnpm run release
#         env:
#           GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
#           NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
#

add a release script
"release": "pnpm run ci && changeset publish"

add an .npmignore
