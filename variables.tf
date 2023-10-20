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

variable "metrics_namespaces" {
  type        = list(string)
  description = "A list of metrics namespaces to pull from CloudWatch into Sumo Logic. An empty list (default) exports all metrics."
  default     = []
}

variable "metric_stream_name" {
  description = "Name of the Metric Stream."
  type        = string
}

variable "metrics_format" {
  description = "Format of metrics pulled from CloudWatch. Valid options are opentelemetry0.7 (default) and json."
  type        = string
  default     = "opentelemetry0.7"

  validation {
    condition     = can(regex("opentelemetry0.7|json", var.metrics_format))
    error_message = "Valid values are opentelemetry0.7 or json."
  }
}

variable "delivery_stream_arn" {
  type        = string
  description = "ARN of the Delivery Stream used as a target for Metrics."
}

variable "producer_role_arn" {
  type        = string
  default     = null
  description = "Role ARN to attach to the Metric Stream. This role should have permissions to PutRecord and PutRecordBatch on the delivery stream."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to the resources created by the module."
}
