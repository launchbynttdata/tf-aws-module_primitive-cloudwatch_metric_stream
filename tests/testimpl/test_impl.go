package testimpl

import (
	"context"
	"fmt"
	"reflect"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/cloudwatch"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

var standardTags = map[string]string{
	"provisioner": "Terraform",
}

func TestCloudWatchComplete(t *testing.T, ctx types.TestContext) {
	streamName := terraform.Output(t, ctx.TerratestTerraformOptions(), "name")
	fmt.Println(streamName)

	t.Run("TestARNPatternMatches", func(t *testing.T) {
		checkARNFormat(t, ctx)
	})

	t.Run("TestingValidTags", func(t *testing.T) {
		checkTagsMatch(t, ctx)
	})

	t.Run("TestingMetricStream", func(t *testing.T) {
		checkMetricStream(t, ctx)
	})
}

func checkARNFormat(t *testing.T, ctx types.TestContext) {
	expectedPatternARN := "^arn:aws:cloudwatch:[a-z0-9-]+:[0-9]{12}:[a-z0-9-]+/.+$"

	actualARN := terraform.Output(t, ctx.TerratestTerraformOptions(), "arn")
	assert.NotEmpty(t, actualARN, "ARN is empty")
	assert.Regexp(t, expectedPatternARN, actualARN, "ARN does not match expected pattern")
}

func checkTagsMatch(t *testing.T, ctx types.TestContext) {
	expectedTags := terraform.OutputMap(t, ctx.TerratestTerraformOptions(), "tags_all")
	actualARN := terraform.Output(t, ctx.TerratestTerraformOptions(), "arn")
	client := GetCloudWatchClient(t)

	input := &cloudwatch.ListTagsForResourceInput{
		ResourceARN: aws.String(actualARN),
	}
	result, err := client.ListTagsForResource(context.TODO(), input)
	assert.NoError(t, err, "Failed to retrieve tags from AWS")

	actualTags := map[string]string{}
	for _, tag := range result.Tags {
		actualTags[*tag.Key] = *tag.Value
	}

	for k, v := range standardTags {
		expectedTags[k] = v
	}

	assert.True(t, reflect.DeepEqual(actualTags, expectedTags), fmt.Sprintf("tags did not match, expected: %v\nactual: %v", expectedTags, actualTags))
}

func checkMetricStream(t *testing.T, ctx types.TestContext) {
	client := GetCloudWatchClient(t)
	expectedName := terraform.Output(t, ctx.TerratestTerraformOptions(), "name")

	input := &cloudwatch.GetMetricStreamInput{
		Name: aws.String(expectedName),
	}

	result, err := client.GetMetricStream(context.TODO(), input)
	assert.NoError(t, err, "Failed to retrieve metric stream from AWS")

	currentName := result.Name
	assert.Equal(t, expectedName, *currentName, "Metric stream name doesn't match")
}

func GetAWSConfig(t *testing.T) (cfg aws.Config) {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	require.NoErrorf(t, err, "unable to load SDK config, %v", err)
	return cfg
}

func GetCloudWatchClient(t *testing.T) *cloudwatch.Client {
	cloudwatchClient := cloudwatch.NewFromConfig(GetAWSConfig(t))
	return cloudwatchClient
}
