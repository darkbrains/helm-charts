# C8R Kubernetes Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) <!-- ![Release Charts](https://github.com/cloudchipr/helm-charts/workflows/Release%20Charts/badge.svg?branch=main) --> [![Releases Downloads](https://img.shields.io/github/downloads/cloudchipr/helm-charts/total.svg)](https://github.com/cloudchipr/helm-charts/releases)

## Requirements

* Kubernetes >= [1.19](https://kubernetes.io/releases/)
* Helm >= [3](https://github.com/helm/helm/releases)

## Usage

[Helm](https://helm.sh/) must be installed to use the charts. Please refer to Helm's [documentation](https://helm.sh/docs/chart_template_guide/getting_started/) to get started.

Once Helm is set up properly, add the repository as follows:

```bash
helm repo add c8r https://cloudchipr.github.io/helm-charts
```

You can then run `helm search repo c8r` to see the charts.

## Contributing

The source code of all **C8R** [Helm](https://helm.sh/) charts can be found on [GitHub](https://github.com/cloudchipr/helm-charts/)

We'd love to have you contribute! Please refer to our [contribution guidelines](./CONTRIBUTING.md) for details.

## License

[**Apache 2.0 License**](./LICENSE)
