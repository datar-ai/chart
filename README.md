# RiseML Helm Chart

Helm chart for RiseML.

## Usage

You need to download Helm. You can get its command line client by running:

```
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
```

Once setup, you can install RiseML:

```
$ helm install riseml --name riseml --namespace riseml -f riseml-config.yml
```

For documentation on installing RiseML and the parameters in `riseml-config.yml`, please check our [documentation](https://docs.riseml.com/install/configuration.html).
