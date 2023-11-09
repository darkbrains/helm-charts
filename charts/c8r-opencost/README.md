# C8R-Opencost Kubernetes Helm Chart

## Introduction  

>We are using  **PrometheusKubeStateMetrucs**,  **Prometheus Server** and **OpenCost** to collect metrics and send to our Instances to calculate the cost.

### Prometheus Community

[![GitHub Prometheus Community](https://img.shields.io/badge/GitHub-Prometheus-red)](https://github.com/prometheus)

### Grafana Labs

[![GitHub Grafana Labs](https://img.shields.io/badge/GitHub-Grafana-orange)](https://github.com/grafana)

### OpenCost

[![OpenCost](https://img.shields.io/badge/GitHub-OpenCost-green)](https://github.com/opencost/opencost)

## Requirements

* Kubernetes >= [1.19](https://kubernetes.io/releases/)
* Helm >= [3](https://github.com/helm/helm/releases)

## Installation

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```bash
helm repo add c8r https://cloudchipr.github.io/helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
c8r` to see the charts.
the latest versions of the packages.

To install the chart:

```bash
helm upgrade -i c8r-opencost -n c8r-opencost c8r/c8r-opencost \
  --set global.clusterId="YOUR_CLUSTER_ID" \ 
  --set global.bearerToken="YOUR_BEARER_TOKEN"
  --create-namespace
```

If you are installing Chart on `GKE` cluster, you need to use this command:

>*Note: See more about [Google Cloud Platform Configuration](https://www.opencost.io/docs/configuration/gcp)*

```bash
helm upgrade -i c8r-opencost -n c8r-opencost c8r/c8r-opencost \
  --set global.clusterId="YOUR_CLUSTER_ID" \ 
  --set global.bearerToken="YOUR_BEARER_TOKEN"
  --set opencost.opencost.exporter.cloudProviderApiKey="YOUR_GCP_API_KEY"
  --create-namespace 
```

To uninstall the chart:

```bash
helm uninstall c8r-opencost -n c8r-opencost c8r-opencost
kubectl delete namespace c8r-opencost
```

## Parameters

### Global

| Name                       | Description                             | Value                    |
| -------------------------- | --------------------------------------- | ------------------------ |
| `global.clusterId`         | Your Cluster ID (Requried)              | `""`                     |
| `global.endpoint`          | CloudChipr endpoint (Required)          | `metrics.cloudchipr.dev` |
| `global.bearerToken`       | Your CloudChipr bearer token (Required) | `""`                     |
| `global.nameOverride`      | Chart Name override                     | `""`                     |
| `global.namespaceOverride` | Chart NameSpace override                | `""`                     |

### OpenCost Chart

| Name                                               | Description                                                     | Value   |
| -------------------------------------------------- | --------------------------------------------------------------- | ------- |
| `openCost.enabled`                                 | Enable/Disable sub Chart OpenCost                               | `true`  |
| `opencost.opencost.tolerations`                    | Toleration labels for pod assignment                            | `[]`    |
| `opencost.opencost.nodeSelector`                   | Node labels for pod assignment                                  | `{}`    |
| `opencost.opencost.affinity`                       | Affinity settings for pod assignment                            | `{}`    |
| `opencost.opencost.topologySpreadConstraints`      | Assign custom TopologySpreadConstraints rules                   | `[]`    |
| `opencost.opencost.exporter.cloudProviderApiKey`   | CloudProvider API key if example You are deploying Chart on GKE | `""`    |
| `opencost.opencost.exporter.resources`             | Resource requests/limits for OpenCost exporter                  | `{}`    |
| `opencost.opencost.exporter.persistence.enabled`   | Persistent volume claim for storing the data. eg: csv file      | `false` |
| `opencost.opencost.exporter.aws.secret_access_key` | AWS secret access key (If needed)                               | `""`    |
| `opencost.opencost.exporter.aws.access_key_id`     | AWS access key id (If needed)                                   | `""`    |

### Prometheus Chart

| Name                                                      | Description                                                 | Value                                                         |
| --------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------- |
| `prometheusServer.enabled`                                | Enable/Disable sub Chart                                    | `true`                                                        |
| `prometheus.configmapReload.prometheus.enabled`           | Enable/Disable Prometheus ConfigMap reloader                | `true`                                                        |
| `prometheus.server.persistentVolume.enabled`              | Enable/Disable Prometheus server persistent volume          | `false`                                                       |
| `prometheus.server.extraFlags`                            | Prometheus server extra command line flags                  | `["web.enable-lifecycle","web.enable-remote-write-receiver"]` |
| `prometheus.server.tolerations`                           | Node tolerations for server scheduling to nodes with taints | `[]`                                                          |
| `prometheus.server.nodeSelector`                          | Node Selector                                               | `{}`                                                          |
| `prometheus.server.affinity`                              | Pod affinity                                                | `{}`                                                          |
| `prometheus.server.topologySpreadConstraints`             | Pod topology spread constraints                             | `[]`                                                          |
| `prometheus.server.resources`                             | Resource requests/limits for Prometheus server              | `{}`                                                          |
| `prometheus.server.retention`                             | Prometheus data retention period                            | `1d`                                                          |                                                          |
| `prometheus.kube-state-metrics.enabled`                   | Enable kube-state-metrics sub Chart (Requried)              | `true`                                                        |
| `prometheus.kube-state-metrics.nodeSelector`              | Node labels for pod assignment                              | `{}`                                                          |
| `prometheus.kube-state-metrics.affinity`                  | Affinity settings for pod assignment                        | `{}`                                                          |
| `prometheus.kube-state-metrics.tolerations`               | Tolerations for pod assignment                              | `[]`                                                          |
| `prometheus.kube-state-metrics.topologySpreadConstraints` | Topology spread constraints for pod assignment              | `[]`                                                          |
| `prometheus.prometheus-node-exporter.enabled`             | Enable/Disable node-exporter sub Chart (Requried)           | `false`                                                        |

## License

[**Apache 2.0 License**](../LICENSE)
