from __future__ import annotations

import pendulum
from airflow.decorators import dag, task


@dag(
    dag_id="mlops_demo_pipeline",
    start_date=pendulum.datetime(2026, 1, 1, tz="UTC"),
    schedule=None,
    catchup=False,
    tags=["mlops", "demo"],
)
def mlops_demo_pipeline():
    @task
    def report_pipeline_contract() -> dict[str, str]:
        return {
            "source_repo": "baynex-hjkim/morpheus-mlops-training",
            "charts_repo": "baynex-hjkim/morpheus-mlops-charts",
            "image": "harbor.morpheus.test/mlops/mlops-demo",
            "deployment": "argocd/mlops-demo",
        }

    report_pipeline_contract()


mlops_demo_pipeline()
