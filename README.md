# morpheus-mlops-charts

Morpheus Enterprise용 StradVision MLOps 설치 자산 저장소다.

구성 원칙:

- `charts/`: Morpheus `Spec Template` 타입을 `Helm Chart`로 만들 때 사용할 wrapper chart
- `specs/`: Morpheus `Spec Template` 타입을 `Kubernetes Spec`로 만들 때 사용할 raw manifest
- secret 값은 Git에 넣지 않고 placeholder만 둔다
- 실제 secret 값은 Morpheus Cypher 또는 별도 secret spec template로 주입한다

이 저장소의 chart는 upstream chart를 `dependency`로 참조한다.
Morpheus appliance가 외부 chart repo에 접근하지 못하면 아래 중 하나를 수행해야 한다.

1. `helm dependency build` 후 vendor된 `charts/` 디렉터리를 커밋
2. Harbor / Nexus 같은 내부 chart mirror를 사용하도록 `repository` 경로 변경

제외한 항목:

- `kube-vip`: MKS가 클러스터 lifecycle을 담당하므로 수동 control-plane VIP bootstrap을 그대로 이식하지 않음
- `rke2-installation`: MKS가 대체하므로 수동 RKE2 설치 문서는 변환 대상에서 제외
