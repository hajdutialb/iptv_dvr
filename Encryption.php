<?php
    function encrypt($data, $key)
    {
        $bArr = substr($data, 0, 15);
        $iv = $key;
        $ciphertext = openssl_encrypt($data, 'aes-128-cbc', $key, OPENSSL_RAW_DATA, $iv);
        return chunk_split(base64_encode($ciphertext), 76, "\\r\\n");
    }

    function decrypt($data, $key)
    {
        return openssl_decrypt(base64_decode($data), 'aes-128-cbc', $key, OPENSSL_RAW_DATA, base64_decode($iv));
    }
    
	$username = getenv("TIBO_USER");
	$password = getenv("TIBO_PASS");
	$boxid = getenv("TIBO_BOXID");
	$ts = floor(microtime(true) * 1000);
	$appid = "3";

	$auth_dec = "username=" . $username . ";password=" . $password . ";boxid=" . $boxid . ";timestamp=" . $ts . ";appid=" . $appid;
	$auth = rawurlencode(encrypt($auth_dec, "asdfasdfasdfasdf"));

	echo $auth;
?>
