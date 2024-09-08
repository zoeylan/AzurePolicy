Param($RedisResourceGroup, $RedisName)

$aofValue = (Get-AzRedisCache -ResourceGroupName $RedisResourceGroup -Name $RedisName).RedisConfiguration['aof-backup-enabled']
$rdbValue = (Get-AzRedisCache -ResourceGroupName $RedisResourceGroup -Name $RedisName).RedisConfiguration['rdb-backup-enabled']

if ($aofValue -eq "true") {
    Set-AzRedisCache -ResourceGroupName $RedisResourceGroup -Name $RedisName -RedisConfiguration @{"aof-backup-enabled" = "false"}
}

if ($rdbValue -eq "true") {
    Set-AzRedisCache -ResourceGroupName $RedisResourceGroup -Name $RedisName -RedisConfiguration @{"rdb-backup-enabled" = "false"}
}
