// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

resource "aws_cloudwatch_metric_stream" "cloudwatch_metric_stream" {
  name          = var.metric_stream_name
  role_arn      = var.producer_role_arn
  firehose_arn  = var.delivery_stream_arn
  output_format = var.metrics_format

  dynamic "include_filter" {
    for_each = var.metrics_namespaces
    content {
      namespace = include_filter.value
    }
  }
  tags = local.tags
}
