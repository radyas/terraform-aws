package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestTerraformAws(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../deployment/",
		VarFiles:     []string{"dev.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	ec2_name := terraform.Output(t, terraformOptions, "ec2_instance_tags_name")
	ec2_owner := terraform.Output(t, terraformOptions, "ec2_instance_tags_owner")
	s3_name := terraform.Output(t, terraformOptions, "s3_bucket_tags_name")
	s3_owner := terraform.Output(t, terraformOptions, "s3_bucket_tags_owner")

	assert.Equal(t, "Flugel", ec2_name)
	assert.Equal(t, "InfraTeam", ec2_owner)
	assert.Equal(t, "Flugel", s3_name)
	assert.Equal(t, "InfraTeam", s3_owner)
}
