$aofvalue = az redis show --resource-group 'zoeyredisRG' --name 'zoeypremiumredis1' --query "redisConfiguration.aofBackupEnabled"

$rdbvalue = az redis show --resource-group 'zoeyredisRG' --name 'zoeypremiumredis1' --query "redisConfiguration.rdbBackupEnabled"

if ($aofvalue -eq "true")
{
    Set-AzRedisCache -Name "zoeypremiumredis1"  -RedisConfiguration @{"aof-backup-enabled" = "false"}
}


if ($rdbvalue -eq "true")
{
    Set-AzRedisCache -Name "zoeypremiumredis1"  -RedisConfiguration @{"rdb-backup-enabled" = "false"}
}