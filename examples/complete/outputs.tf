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

output "arn" {
  description = "ARN of the metric stream."
  value       = module.cloudwatch_metric_stream.arn
}

output "creation_date" {
  description = "Date and time in RFC3339 format that the metric stream was created."
  value       = module.cloudwatch_metric_stream.creation_date
}

output "last_update_date" {
  description = "Date and time in RFC3339 format that the metric stream was updated."
  value       = module.cloudwatch_metric_stream.creation_date
}

output "state" {
  description = "State of the metric stream. Possible values are running and stopped."
  value       = module.cloudwatch_metric_stream.state
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cloudwatch_metric_stream.tags_all
}
