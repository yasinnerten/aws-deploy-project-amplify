# terraform.tfvars

# Load Balancer Vars
public_subnet_cidrs     = ["10.0.16.0/20", "10.0.0.0/20"]
private_subnet_cidrs    = ["10.0.144.0/20", "10.0.128.0/20"]
vpc_cidr                = "10.0.0.0/16"
vpc_name                = "main-vpc"
alb_name                = "amplifygenai-alb"
domain_name             = "fekgpt.com"
app_route53_zone_id     = "Z09293293S486YLFKC3FQ" #Alternate Hosted Zone because of delegated Subdomain
target_group_port       = 3000
target_group_name       = "amplifygenai-tg"
alb_security_group_name = "amplifygenai-sg"
root_redirect           = false #set to true if redirecting to "www"
alb_logging_bucket_name = "amplifygenai-alb-access-logs"

#cognito vars
cognito_domain          = "auth"
cognito_route53_zone_id = "Z09293293S486YLFKC3FQ"
userpool_name          = "AmplifyGenAI-UserPool2"
provider_name          = "AmplifyGenAI"
sp_metadata_url        = "" #service provider metadata url for your SAML SSO
callback_urls          = [""] #DO NOT CHANGE CALLBACK URLS
logout_urls            = [""] #DO NOT CHANGE LOGOUT URLS
create_pre_auth_lambda = false #set to true if using pre-auth lambda
use_saml_idp           = false #set to true if using federated SAML
disable_public_signup  = true

# Variables with defaults don't need to be specified unless you wantnto override the default

#ECR Vars
ecr_repo_name        = "amplifygenai-repo"
image_tag_mutability = "IMMUTABLE"
scan_on_push         = false

#ECS Vars
desired_count                    = 1
cluster_name                     = "amplifygenai-cluster"
service_name                     = "amplifygenai-service"
container_port                   = 3000
max_capacity                     = 5
min_capacity                     = 1
scale_target_value               = 75
scale_in_cooldown                = 300
scale_out_cooldown               = 300
cloudwatch_log_group_name        = "amplifygenai-loggroup"
cloudwatch_policy_name           = "amplifygenai-cloudwatch-policy"
cloudwatch_log_stream_prefix     = "ecs"
secret_access_policy_name        = "amplifygenai-secret-access-policy"
ecs_alarm_email                  = "ai@fek.lu.se"
ecs_scale_down_alarm_description = "scaling up due to high CPU utilization"
ecs_scale_up_alarm_description   = "scaling down due to low CPU utilization"

#Task Definition Vars
container_cpu            = 1024
container_memory         = 4096
task_name                = "gen-ai-app-task"
task_execution_role_name = "gen-ai-app-task-execution-role"
task_role_name           = "gen-ai-app-task-role"
region                   = "us-east-1"
container_name           = "amplifyApp"

# Secrets Manager Vars
openai_api_key_name = "openai-api-key"
openai_endpoints_name = "openai-endpoints"
secret_name = "amplify-app-secrets"
secrets = {
  COGNITO_CLIENT_SECRET = "ls1rf0j2f493akpo2ll1qe32acfaftlgrqv3oi6r1bhmsu4q0p5"
  OPENAI_API_KEY        = "d193a8ef0f9a49e49fcabd53e4b0c4c0"
  NEXTAUTH_SECRET       = "zqybpcCugruex/ZZVqtezV9KVcL6uXFJ9PVO24/hRjk="
}

envs_name = "amplify-app-vars"
envs = {
  API_BASE_URL                = "api.fekgpt.com"
  ASSISTANTS_API_BASE         = "https://yt4zjg66x2.execute-api.us-east-1.amazonaws.com/dev"
  AVAILABLE_MODELS            = "gpt-35-turbo,gpt-4o,gpt-4-1106-Preview,anthropic.claude-instant-v1,anthropic.claude-v2:1,anthropic.claude-3-sonnet-20240229-v1:0,anthropic.claude-3-haiku-20240307-v1:0,anthropic.claude-3-opus-20240229-v1:0,mistral.mistral-7b-instruct-v0:2,mistral.mixtral-8x7b-instruct-v0:1,mistral.mistral-large-2402-v1:0"
  AZURE_API_NAME              = "fekgpt"
  AZURE_DEPLOYMENT_ID         = "1475aacc-abe7-4057-8478-d4173b7d15a2"
  CHAT_ENDPOINT               = "https://v5fdcwo6ynyxdj7h37rvgriniy0nwrkf.lambda-url.us-east-1.on.aws/"
  COGNITO_CLIENT_ID           = "1hpvkaj5rn0kg9l1ditprnq9ns"
  COGNITO_DOMAIN              = "https://auth.fekgpt.com"
  COGNITO_ISSUER              = "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_KMahKXPPZ"
  DEFAULT_MODEL               = "gpt-35-turbo"
  DEFAULT_FUNCTION_CALL_MODEL = "gpt-4-1106-Preview"
  MIXPANEL_TOKEN              = "b465d9313413a06bec2283ec9939b827"
  NEXTAUTH_SECRET             = "zqybpcCugruex/ZZVqtezV9KVcL6uXFJ9PVO24/hRjk="
  NEXTAUTH_URL                = "https://fekgpt.com" #deployed app domain name
  OPENAI_API_HOST             = "https://fekgpt.openai.azure.com"
  OPENAI_API_TYPE             = "azure"
  OPENAI_API_VERSION          = "2023-03-15-preview"
}