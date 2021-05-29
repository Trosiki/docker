#!/usr/bin/env bash
echo "END";

service nginx start
php-fpm

touch test
tail -0f test