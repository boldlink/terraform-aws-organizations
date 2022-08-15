[![Build Status](https://github.com/boldlink/<REPO_NAME>/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/boldlink/<REPO_NAME>/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform  module \<PROVIDER>-\<MODULE> Terraform module

## How to use this template -- DELETE THIS SECTION BEFORE PR
1. Create your new module repository by using terraform only (see SOP) and make sure to use this template.
2. Add your Terraform code in any branch other than `main/master`
3. Change the `<REPO_NAME>` value for any badges in the `README.md` files in the root `examples` and `modules` folders.
4. Add nested modules in the `modules` folder, or `DELETE` the nested folder if not used.
    * _Note: you will also maintain the nested modules full `README.md` files, remember nested modules can be used on their own._
5. Add examples in the `examples` folder.
    * _Note: you can have as many examples as you want, but two are required._
        * _minimum - this is the example with the minimum code to use the module._
        * _complete - this is the example with all features for a single module used (the most common use)._
6. Run `pre-commit run --all-files` to update the `README` and fix any issues.
    * _Note: make sure your IDE tool uses spaces and not tabs specially on `yaml` files._
7. Run `checkov` or `terrascan` tool and make sure to add the log to the PR (something to automate).
    * _Note: make sure to scan your module nested modules and examples (great candidate for a makefile action/script and automation)._
8. Open a pull request into the default branch (usually `main`) and have it reviewed. don't forget to add the security scan logs.
    * _Note: make sure to add the nested modules README's to the pre-commit config so they are also updated and validated._
9. If you have been assigned a reviewer DM the reviewer, or the channel if it has been more than one day.
10. Post to the channel news of the releases to the teams.

## Description

lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem.

Examples available [`here`]github.com/boldlink/<REPO_NAME>//tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "miniumum" {
  source  = "boldlink/<module_name>/<provider>"
  version = "x.x.x"
  <insert the minimum required variables here if any are required>
  ...
}
```
## Documentation

[<ex. Amazon VPC/Github/Cloudflare> Documentation](https://link)

[Terraform module documentation](https://link)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.24.1 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Makefile
The makefile contain in this repo is optimised for linux paths and the main purpose is to execute testing for now.
* Create all tests:
`$ make tests`
* Clean all tests:
`$ make clean`

#### BOLDLink-SIG 2022
