# StepSecurity Maintained npm-get-version-action Actions

Forked from: [martinbeentjes/npm-get-version-action](https://github.com/martinbeentjes/npm-get-version-action)

This GitHub Action retrieves the package version from the package.json file and sets the version in the `current-version` output value usable in your workflow file.

## Example

To use this action in your project, use the following:

```yaml
- name: get-npm-version
  id: package-version
  uses: step-security/npm-get-version-action@v1
```

The Action sets an output variable called `current-version` which can be used in a following step by using `${{ steps.package-version.outputs.current-version}}`.

If you are using a monorepo or otherwise have some packages in a subdirectory of your repo, add the path to the `package.json` as a parameter:

```yaml
- name: get-npm-version
  id: package-version
  uses: step-security/npm-get-version-action@v1
  with:
    path: packages/<yourpackage>
```
