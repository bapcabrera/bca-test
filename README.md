# Bca.Test
![Platform](https://img.shields.io/powershellgallery/p/Bca.Test?logo=powershell&logoColor=white) [![License: MIT](https://img.shields.io/github/license/baptistecabrera/bca-test?logo=open-source-initiative&logoColor=white)](https://opensource.org/licenses/MIT)

[![GitHub Release](https://img.shields.io/github/v/tag/baptistecabrera/bca-test?logo=github&logoColor=white&label=release)](https://github.com/baptistecabrera/bca-test/releases) [![PowerShell Gallery](https://img.shields.io/powershellgallery/v/Bca.Test?color=informational&logo=powershell&logoColor=white)](https://www.powershellgallery.com/packages/Bca.Test) [![Nuget](https://img.shields.io/nuget/v/Bca.Test?color=informational&logo=nuget&logoColor=white)](https://www.nuget.org/packages/Bca.Test/) [![Chocolatey](https://img.shields.io/chocolatey/v/bca-test?color=informational&logo=chocolatey&logoColor=white)](https://chocolatey.org/packages/bca-test)


## Description

_Bca.Test_ is a PowerShell module used to to test my CI/CD processes.

## Transparency

_Please not that to date I am the only developper for this module._

- All code is primarily stored on a private Git repository on Azure DevOps;
- Issues opened in GitHub create a bug in Azure DevOps; [![Sync issue to Azure DevOps](https://github.com/baptistecabrera/bca-test/workflows/Sync%20issue%20to%20Azure%20DevOps/badge.svg)](https://github.com/baptistecabrera/bca-test/actions?query=workflow%3A"Sync+issue+to+Azure+DevOps")
- All pushes made in GitHub are synced to Azure DevOps (that includes all branches except `master`); [![Sync branches to Azure DevOps](https://github.com/baptistecabrera/bca-test/workflows/Sync%20branches%20to%20Azure%20DevOps/badge.svg)](https://github.com/baptistecabrera/bca-test/actions?query=workflow%3A"Sync+branches+to+Azure+DevOps")
- When a GitHub Pull Request is submitted, it is analyzed and merged in `develop` on GitHub, then synced to Azure DevOps that will trigger the CI;
- A Pull Request is then submitted in Azure DevOps to merge `develop` to `master`, it runs the CI again;
- Once merged to `master`, the CI is one last time, but this time it will create a Chocolatey and a NuGet packages that are pushed on private Azure DevOps Artifacts feeds;
- If the CI succeeds and the packages are well pushed, the CD is triggered.

### CI
[![Build Status](https://dev.azure.com/baptistecabrera/Bca/_apis/build/status/Build/Bca.Test?repoName=bca-test&branchName=master)](https://dev.azure.com/baptistecabrera/Bca/_build/latest?definitionId=13&repoName=bca-test&branchName=master)

[![Azure DevOps tests (branch)](https://img.shields.io/azure-devops/tests/baptistecabrera/Bca/13/master?logo=azure-pipelines&logoColor=white)](https://dev.azure.com/baptistecabrera/Bca/_build/latest?definitionId=13&repoName=bca-test&branchName=master) [![Azure DevOps coverage (branch)](https://img.shields.io/azure-devops/coverage/baptistecabrera/Bca/13/master?logo=azure-pipelines&logoColor=white)](https://dev.azure.com/baptistecabrera/Bca/_build/latest?definitionId=13&repoName=bca-test&branchName=master)

The CI is an Azure DevOps build pipeline that will:
- Test the module and does code coverage with _[Pester](https://pester.dev/)_;
- Run the _[PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer)_;
- Mirror the repository to GitHub

### CD
[![Build Status](https://dev.azure.com/baptistecabrera/Bca/_apis/build/status/Release/Bca.Test?repoName=bca-test&branchName=master)](https://dev.azure.com/baptistecabrera/Bca/_build/latest?definitionId=12&repoName=bca-test&branchName=master)

[![Azure DevOps tests (branch)](https://img.shields.io/azure-devops/tests/baptistecabrera/Bca/12/master?logo=azure-pipelines&logoColor=white)](https://dev.azure.com/baptistecabrera/Bca/_build/latest?definitionId=12&repoName=bca-test&branchName=master) [![Azure DevOps coverage (branch)](https://img.shields.io/azure-devops/coverage/baptistecabrera/Bca/12/master?logo=azure-pipelines&logoColor=white)](https://dev.azure.com/baptistecabrera/Bca/_build/latest?definitionId=12&repoName=bca-test&branchName=master)

The CD is an Azure DevOps release pipeline is trigerred that will:
- In a **Prerelease** step, install both Chocolatey and Nuget packages from the private feed in a container, and run tests again. If tests are successful, the packages are promoted to `@Prerelease` view inside the private feed;
- In a **Release** step, publish the packages to _[NuGet](https://www.nuget.org/)_ and _[Chocolatey](https://chocolatey.org/)_, and publish the module to _[PowerShell Gallery](https://www.powershellgallery.com/)_, then promote the packages to to `@Release` view inside the private feed.
